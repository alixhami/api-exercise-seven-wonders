require 'httparty'

#Starter Code:
seven_wonders = [
  "Great Pyramind of Giza",
  "Hanging Gardens of Babylon",
  "Colossus of Rhodes",
  "Lighthouse of Alexandria",
  "Statue of Zeus at Olympia",
  "Temple of Artemis",
  "Mausoleum at Halicarnassus"
]

BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json?address="

coordinates = seven_wonders.map { |wonder|
  url = BASE_URL + wonder.gsub(" ", "+")
  [wonder, HTTParty.get(url)["results"][0]["geometry"]["location"]]
}.to_h

puts coordinates
