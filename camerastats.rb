require 'flickraw'

FlickRaw.api_key = "your api key"
FlickRaw.shared_secret = "your shared secret"

flickr.access_token = "your access token"
flickr.access_secret = "your access secret"

group_id = '52694132@N00' # bicycle racing
pages = 10

class Counter
  def initialize
    @stats = {}
  end
  
  def add(s)
    if s and s != ""
      if @stats.key? s
        @stats[s] += 1
      else
        @stats[s] = 1
      end
    end
  end
  
  def getList
    @stats.to_a.sort{|a, b| b[1] <=> a[1]}
  end
  
  def to_s
    getList.map{|x| "#{x[1]}: #{x[0]}"}.join("\n")
  end
  
end

n = 1
camera = Counter.new
lens = Counter.new

1.upto(pages).each do |page|
  photos = flickr.groups.pools.getPhotos :group_id => group_id, :per_page => 100, :page => page 
  
  photos.each do |ph|
    begin
      exif = flickr.photos.getExif :photo_id => ph.id
      c = exif.camera
      larray = exif.exif.select{|x| x["tag"] == "Lens"}
      l = larray[0]["raw"] if larray.size > 0
    
      camera.add c
      lens.add l
      print "#{n}: #{c} + #{l}\n"
    rescue => ex
      print "#{n}: #{ex.to_s}\n"
    end
    n += 1
    sleep 1
  end
end

print "\nCamera ranking\n"
print camera.to_s
print "\n\nLens ranking\n"
print lens.to_s
print "\n"

