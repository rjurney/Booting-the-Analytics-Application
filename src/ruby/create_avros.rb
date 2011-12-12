require 'rubygems'
require 'avro'
require 'voldemort-rb'
require 'json'

# This is our Avro schema
SCHEMA = <<-JSON
{ "type": "record",
  "name": "Email",
  "fields" : [
    {"name": "message_id", "type": "int"},
    {"name": "topic", "type": "string"},
    {"name": "user_id", "type": "int"}
  ]}
JSON

puts "Avro Schema: "
puts SCHEMA

puts "Writing Avros to /tmp/messages.avro..."
file = File.open('/tmp/messages.avro', 'wb')
schema = Avro::Schema.parse(SCHEMA)
writer = Avro::IO::DatumWriter.new(schema)
dw = Avro::DataFile::Writer.new(file, writer, schema)
dw << {"message_id" => 11, "topic" => "Hello World", "user_id" => 1}
dw << {"message_id" => 12, "topic" => "Jim is silly!", "user_id" => 1}
dw << {"message_id" => 13, "topic" => "I like apples.", "user_id" => 2}
dw << {"message_id" => 24, "topic" => "Round the world...", "user_id" => 2}
dw << {"message_id" => 35, "topic" => "How do I sent a message?", "user_id" => 45}
puts "Closing /tmp/messages.avro"
dw.close
