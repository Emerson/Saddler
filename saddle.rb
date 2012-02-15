require 'sinatra'
require 'json'
require './lib/saddler'

get '/' do
	erb :index
end

post '/saddle' do
	# Prepare the params
	row_array = Array.new
	params[:grid].each do |row|
		row_array << row[1].map(&:to_i)
	end
	content_type :json
	saddle_points = Saddler.find(row_array)
	found = (saddle_points.count > 0) ? 'true' : 'false'
	{:found => found, :saddle_points => saddle_points}.to_json
end