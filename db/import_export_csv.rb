require 'csv'
def top20
  adventures = []
  CSV.foreach('db/adventures.csv') do |row|
    adventures << row
  end

  slice = adventures.each_slice(5)
  slice.each do |s|
  	p s[4][0]
    # adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0], image_url: s[4][0])
    # p adventure
    # p s[1][0]
    # country = Country.find_or_create_by(name:s[1][0])
    # p country
    # CountryAdventure.create(country_id: country.id, adventure_id: adventure.id)
  end
end

def importGadventures
	puts "importing adventures"
	CSV.foreach("db/csvFiles/gadventures.csv") do |csv|
		Adventure.makeAdventure(csv[0],csv[1],csv[2],csv[3],csv[4],csv[5],csv[6])
	end
  puts "done importing adventures"
end

def importImages
  puts "importing images"
  CSV.foreach("db/csvFiles/images.csv") do |csv|
    city = City.find_by(name:csv[6])
    puts city.id
    Image.create(panoramio_id:csv[0], original_image_url:csv[1],medium_image_url:csv[2],smaal_image_url:csv[3],longitude:csv[4],latitude:csv[6],city:city)
  end
  puts "done importing images"
end

def export_images_to_csv
  puts "exporting images to a csv file"
  CSV.open("db/csvFiles/images.csv", "wb") do |csv|
    Image.all.each do |image|
      csv << [image.panoramio_id,image.original_image_url,image.medium_image_url,image.smaal_image_url,image.longitude,image.latitude,image.city.name]
    end
  end
end
