# Camerastats

Camerastats is a ruby script to know which camera and lens are popular in a certain group in Flickr.

# Usage

+ You must have a Flickr account
+ Install Redis
+ Get api key, shared secret, access token and access secret according to https://github.com/hanklords/flickraw
+ Modify api_key and so on in camerastats.rb
+ Modify group_id of which group you want to analyse in camerastats.rb
+ Modify pages. Pages times 100 is a number of photos you will analyse.
+ run "bundle install"
+ run "bundle exec ruby camerastats.rb"

# Expected result

Something like the following:

    Camera ranking
    
    13:Canon EOS 7D (64)
    9:Nikon D700 (110)
    7:Nikon D7000 (16)
    5:Canon EOS 5D Mark II (14)
    5:Nikon D5100 (42)
    4:Canon EOS 550D (62)
    4:Canon EOS 50D (19)
    4:Canon EOS 5D Mark III (12)
    3:Canon EOS 500D (8)
    3:Nikon D3100 (45)
    3:Apple iPhone 4S (5)
    3:Canon EOS 5D (24)
    2:Nikon D300 (5)
    2:Sony NEX-7 (15)
    2:Canon EOS 400D Digital (3)
    2:Nikon D3200 (18)
    2:Sony DSLR-A700 (6)
    2:Nikon D60 (10)
    2:Canon EOS 60D (5)
    2:Canon EOS 40D (16)
    2:Nikon D90 (56)
    2:Kodak EasyShare Z710 Zoom (12)
    2:Pentax K-5 (13)
    
    Lens ranking
    
    7:70.0-200.0 mm f/2.8 (55)
    4:EF17-40mm f/4L USM (6)
    4:EF100-400mm f/4.5-5.6L IS USM (20)
    3:55-200mm f/4-5.6 (24)
    3:EF24-105mm f/4L IS USM (9)
    3:24.0-70.0 mm f/2.8 (19)
    3:18.0-55.0 mm f/3.5-5.6 (9)
    2:18.0-200.0 mm f/3.5-5.6 (9)
    2:EF50mm f/1.8 II (2)
    2:18-200mm f/3.5-5.6 (5)
    2:EF70-200mm f/2.8L IS USM (4)
    2:EF70-200mm f/4L IS USM (31)
    2:EF-S15-85mm f/3.5-5.6 IS USM (2)
    2:EF-S17-55mm f/2.8 IS USM (9)
    2:EF-S18-200mm f/3.5-5.6 IS (9)
    2:18-70mm f/3.5-4.5 (4)
    2:18-105mm f/3.5-5.6 (2)
