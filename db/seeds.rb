# require 'nokogiri'
# require 'open-uri'
# require 'json'

# Apartment.destroy_all

# names = ["bucktown", "avondale", "lakeview", "roscoe-village", "logan-square", "clyborn-corridor", "lincoln-park", "humboldt-park", "wickerpark", "goose-island", "old-town", "gold-coast", "ukrainian-village", "river-west", "river-north", "streeterville", "west-town", "little-italy", "west-loop-gate", "loop", "south-loop", "pilsen", "bridgeport", "chinatown", "bronzeville"]


# n = 0
# page = 1


# 2.times do
#   25.times do 
#     url = "https://www.zillow.com/#{names[n]}-Chicago-IL/apartments/"

#     url += "#{ page }_p/" if page > 1

#     doc = Nokogiri::HTML(open(url, 'User-Agent' => 'chrome'))

#         doc.css('div.zsg-photo-card-content').each do |apt|
#           link = apt.css('a').first.values.first
#           pic = apt.css('img').first.values.first
#           address = /(?=[\s\w\$\W])\d\d\d\d\s\w\s\w+\s\w+\S\w/.match apt.content
#           bed_bath_feet = apt.css('span.zsg-photo-card-info').first.text
#           bedrooms = bed_bath_feet[0]

#           baths = bed_bath_feet.split(" · ")[-2]
#           if baths != nil 
#             baths = baths[0].gsub(/[^0-9]/, '')
#           end

#           sqft = bed_bath_feet.split(" · ")[-1]
#           if sqft[1] == "$"
#             sqft = 0
#           elsif sqft == nil?
#             sqft = 0
#           else
#             sqft = sqft.gsub!(/[^0-9]/, '')
#           end

#           rent1 = /(?<=[\\$])\w+.\d+/.match apt.content
#           if rent1 != nil
#              rent = rent1[0].gsub!(/[^0-9A-Za-z]/, '')
#           end
#           neighborhood = names[n]

#           @apartment = Apartment.new(
#                               address: address,
#                               sqft: sqft,
#                               baths: baths,
#                               rent: rent,
#                               bedrooms: bedrooms,
#                               link: link,
#                               pic: pic,
#                               neighborhood: neighborhood 
#                               )
            
#               if address && sqft && baths && rent && bedrooms
#             @apartment.save
#           end
#         end
#       n += 1
#   end
#   page += 1
# end
