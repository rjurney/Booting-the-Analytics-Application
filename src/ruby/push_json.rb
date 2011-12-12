require 'rubygems'
require 'avro'
require 'voldemort-rb'
require 'json'

# connect to voldemort
puts "Connecting to voldemort..."
client = VoldemortClient.new("test", "localhost:6666")

# read all data from avro file
puts "Opening avro file /tmp/per_user.avro/part-r-00000.avro..."
file = File.open('/tmp/per_user.avro/part-r-00000.avro', 'r+')
dr = Avro::DataFile::Reader.new(file, Avro::IO::DatumReader.new)
dr.each do |record|
  puts "Voldemort -> " + JSON(record["messages"])
  client.put record["user_key"], JSON(record["messages"])
end
