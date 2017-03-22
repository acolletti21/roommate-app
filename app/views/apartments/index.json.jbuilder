json.array! @apartments.each do |apartment|
 json.id apartment.id
 json.address apartment.address
 json.sqft apartment.sqft
 json.baths apartment.baths
 json.rent apartment.rent
 json.bedrooms apartment.bedrooms
 json.link apartment.link
 json.pic apartment.pic
 json.neighborhood apartment.neighborhood
end