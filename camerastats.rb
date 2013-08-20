require 'flickraw'
require 'redis'

FlickRaw.api_key = "your api key"
FlickRaw.shared_secret = "your shared secret"

flickr.access_token = "your access token"
flickr.access_secret = "your access secret"

group_id = '52694132@N00' # bicycle racing
pages = 10 # target photos = pages * 100

redis = Redis.new

# for counting how many photos
class Counter
  def initialize
    @stats = {}
  end
  
  def add(s)
    return unless s
    s.strip!
    @stats[s] = @stats.key?(s) ? @stats[s] + 1 : 1
  end
  
  def num(s)
    @stats[s]
  end
  
  def getList
    @stats.to_a.sort{|a, b| b[1] <=> a[1]}
  end
  
end

# for counting how many users
class UserCounter
  def initialize
    @users = {}
  end
  
  def add(camera, user)
    return unless camera
    camera.strip!
    if @users.key? camera
      @users[camera] << user
      @users[camera].uniq!
    else
      @users[camera] = [user]
    end
  end
  
  def num(camera)
    @users[camera].size
  end
  
  def getList
    @users.to_a.sort{|a, b| b[1].size <=> a[1].size}
  end
end

n = 1
camera = Counter.new
lens = Counter.new

ucamera = UserCounter.new
ulens = UserCounter.new

1.upto(pages).each do |page|
  photos = flickr.groups.pools.getPhotos :group_id => group_id, :per_page => 100, :page => page 
  
  photos.each do |ph|
    if redis.hexists 'exif', ph.id # already cached
      info = Marshal.load redis.hget('info', ph.id)
      exif = Marshal.load redis.hget('exif', ph.id)
      next if exif == 'permission_denied'
    else # not cached yet
      begin
        info = flickr.photos.getInfo :photo_id => ph.id
        exif = flickr.photos.getExif :photo_id => ph.id
        redis.hset 'info', ph.id, Marshal.dump(info)
        redis.hset 'exif', ph.id, Marshal.dump(exif)
        sleep 0.5
      rescue => ex
        print "#{ex.to_s}\n"
        redis.hset 'info', ph.id, Marshal.dump('permission_denied')
        redis.hset 'exif', ph.id, Marshal.dump('permission_denied')
        next
      end
    end
    
    c = exif.camera
    larray = exif['exif'].select{|x| x["tag"] == "Lens"}
    l = larray.size > 0 ? larray[0]["raw"] : nil
    
    camera.add c
    lens.add l
    ucamera.add c, info.owner.nsid
    ulens.add l, info.owner.nsid
    
    puts "#{n}: #{c} + #{l}"
    
    n += 1
  end

end

# printing results

puts "", "Camera ranking", ""

ucamera.getList.each do |k, v|
  next if k == ''
  puts "#{v.size}:#{k} (#{camera.num(k)})"
end

puts "", "Lens ranking", ""

ulens.getList.each do |k, v|
  next if k == ''
  puts "#{v.size}:#{k} (#{lens.num(k)})"
end

