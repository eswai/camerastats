# Camerastats

Camerastats is a ruby script to know which camera and lens are popular in a certain group in Flickr.

# Usage

+ You must have a Flickr account
+ Get api key, shared secret, access token and access secret according to https://github.com/hanklords/flickraw
+ Modify api_key and so on in camerastats.rb
+ Modify group_id of which group you want to analyse in camerastats.rb
+ Modify pages. Pages times 100 is a number of photos you will analyse.
+ run "bundle install"
+ run "bundle exec ruby camerastats.rb"

# Expected result

Something like the following:

Camera ranking
111: Nikon D700
61: Canon EOS 550D
59: Canon EOS 7D
56: Nikon D90
45: Nikon D3100
42: Nikon D5100
36: Canon EOS 5D Mark II
24: Canon EOS 5D
24: Sony SLT-A57
20: Canon EOS 50D
18: Nikon D3200
16: Nikon D70
16: Canon EOS 40D
16: Nikon D7000
15: Sony NEX-7
13: Pentax K-5
12: Canon EOS 5D Mark III
12: Kodak EasyShare Z710 Zoom

Lens ranking
55: 70.0-200.0 mm f/2.8
42: 18.0-200.0 mm f/3.5-6.3
31: EF70-200mm f/4L IS USM
30: EF17-40mm f/4L USM
24: 55-200mm f/4-5.6
22: 18-55mm f/3.5-5.599999999
21: 24.0-70.0 mm f/2.8
20: EF100-400mm f/4.5-5.6L IS USM
17: 35mm f/1.8
12: 70.0-300.0 mm f/4.5-5.6
11: 100.0 mm f/2.8
