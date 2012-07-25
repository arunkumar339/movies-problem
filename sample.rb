require 'rubygems'
require 'json'
#read json
raw_json = IO.read('data/movies.json')
#parse json
parsed_json=JSON.parse(raw_json) 
genres = []
#extract genres
parsed_json["movies"].each do |movie|
  movie["genres"].each do |genre|
	genres<< genre unless genres.include? genre
	end
end
genres=genres.sort
#output the result
genres.each do |genre|
	total_rating=0.0
	total_movies=0 
	parsed_json["movies"].each do |movie|
	if movie["genres"].include?genre
		total_rating+=movie["rating"].to_f
		total_movies+=1
	end
	end
	puts "%0.2f #{genre}" % (total_rating/total_movies)
end