And /return list of titles and urls formatted as "([^\"]+)"$/ do |param|

#functions to convert hash to chosen format
def fjson(a)
    f = File.new('catalog.json', 'w+')
    f.puts JSON.generate(a)
    f.close
end

def fyaml(a)
    f = File.new('catalog.yml', 'w+')
    f.puts a.to_yaml()
    f.close
end

def fcsv(a)
    f = File.new('catalog.csv', 'w+')
    a.each do |key, value|
	f.puts key + "," + value + "\n"
    end

    f.close
end

scrapedFromSite = Hash.new
scrapedFromFile = Hash.new

category = all(:xpath, '//div[@class="cats"]/ul/li/a') #select all <a> tags which contain category

#convert selected <a> tags to hash
category.each do |item|
   scrapedFromSite[item['href']] = item.native.text
end


if param == 'json'
    if File.exist?('catalog.json') #print list of new and removed entries and update data file if it's exist
	f = File.open('catalog.json')
	json = f.read
	f.close

	scrapedFromFile = JSON.parse(json)

	if scrapedFromSite.to_a != scrapedFromFile.to_a
            new_entries = scrapedFromSite.to_a - scrapedFromFile.to_a
	    puts "\nNew entries:"
	    new_entries.each do |item|
   	        puts item
	    end

	    removed_entries = scrapedFromFile.to_a - scrapedFromSite.to_a
	    puts "\nRemoved entries:"
	    removed_entries.each do |item|
	       puts item
	    end
	    fjson(scrapedFromSite)
	else
	    puts "\nNo changes found"
	end
    else 			   #print scraped list and create new data file if it isn't exist 
	scrapedFromSite.each do |item|
   	    puts item
	end
        fjson(scrapedFromSite)
	puts "\nFile catalog.json created"
    end

elsif param == 'yaml'
    if File.exist?('catalog.yml') 
	f = File.open('catalog.yml')
	yaml = f.read
	f.close

	scrapedFromFile = YAML.load(yaml)

	if scrapedFromSite.to_a != scrapedFromFile.to_a
	    new_entries = scrapedFromSite.to_a - scrapedFromFile.to_a
	    puts "\nNew entries:"
	    new_entries.each do |item|
   	        puts item
	    end

	    removed_entries = scrapedFromFile.to_a - scrapedFromSite.to_a
	    puts "\nRemoved entries:"
	    removed_entries.each do |item|
	       puts item
	    end
	    fyaml(scrapedFromSite)
	else
	    puts "\nNo changes found"
	end
    else
	scrapedFromSite.each do |item|
   	    puts item
	end 
        fyaml(scrapedFromSite)
	puts "\nFile catalog.yml created"
    end
elsif param == 'csv'
    if File.exist?('catalog.csv') 
	f = File.open('catalog.csv')
	csv = f.read
	f.close

	scrapedFromFile = CSV.parse(csv)

	if scrapedFromSite.to_a != scrapedFromFile.to_a
	    new_entries = scrapedFromSite.to_a - scrapedFromFile.to_a
	    puts "\nNew entries:"
	    new_entries.each do |item|
   	        puts item
	    end

	    removed_entries = scrapedFromFile.to_a - scrapedFromSite.to_a
	    puts "\nRemoved entries:"
	    removed_entries.each do |item|
	       puts item
	    end
	    fcsv(scrapedFromSite)
	else
	    puts "\nNo changes found"
	end
    else
	scrapedFromSite.each do |item|
   	    puts item
	end 
        fcsv(scrapedFromSite)
	puts "\nFile catalog.csv created"
    end
end
end
