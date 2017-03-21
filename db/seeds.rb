require 'nokogiri'
require 'open-uri'
require 'json'

Apartment.destroy_all


names = ["bucktown", "avondale", "lakeview", "roscoe-village", "logan-square", "clyborn-corridor", "lincoln-park", "humboldt-park", "wickerpark", "gooseigsland", "old-town", "gold-coast", "ukrainian-village", "river-west", "river-north", "streeterville", "west-town", "little-italy", "west-loop", "loop", "south-loop", "pilsen", "bridgeport", "chinatown", "bronzeville"]
# Fetch and parse HTML document

n = 0


  25.times do 
    url = "https://www.zillow.com/#{names[n]}-Chicago-IL/apartments/"

    # url += "#{ page }_p/" if page > 1

    doc = Nokogiri::HTML(open(url, 'User-Agent' => 'chrome'))

        doc.css('div.zsg-photo-card-content').each do |apt|
          link = apt.css('a').first.values.first
          pic = apt.css('img').first.values.first
          address = /(?=[\s\w\$\W])\d\d\d\d\s\w\s\w+\s\w+\S\w/.match apt.content
          bed_bath_feet = apt.css('span.zsg-photo-card-info').first.text
          bedrooms = bed_bath_feet[0]

          baths = bed_bath_feet.split(" · ")[-2]
          if baths != nil 
            baths = baths[0].gsub(/[^0-9]/, '')
          end

          sqft = bed_bath_feet.split(" · ")[-1]
          if sqft[1] == "$"
            sqft = 0
          else
            sqft = sqft.gsub!(/[^0-9]/, '')
          end

          rent1 = /(?<=[\\$])\w+.\d+/.match apt.content
          rent = rent1[0].gsub!(/[^0-9A-Za-z]/, '')
          neighborhood = names[n]

          @apartment = Apartment.new(
                              address: address,
                              sqft: sqft,
                              baths: baths,
                              rent: rent,
                              bedrooms: bedrooms,
                              link: link,
                              pic: pic,
                              neighborhood: neighborhood 
                              )
            
              if address && sqft && baths && rent && bedrooms
            @apartment.save
          end
        end
      n += 1
  end