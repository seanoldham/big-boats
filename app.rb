require 'sinatra'
require 'httparty'
require_relative 'lib/flickr'

set :server, :puma

Tilt.register Tilt::ERBTemplate, 'html.erb'

get '/' do
  flickr
  erb :index
end
