# The 'one page' web app.
require 'rubygems'
require 'sinatra'
require 'avro'
require 'voldemort-rb'
require 'json'

# connect to voldemort
client = VoldemortClient.new("test", "localhost:6666")

get '/messages_per_user_id/:user_id' do |user_id|
  client.get "messages_per_user_id:#{user_id}"
end
