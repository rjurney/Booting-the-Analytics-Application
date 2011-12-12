# Pasted from here: http://www.harshj.com/2010/04/25/writing-and-reading-avro-data-files-using-python/

# Import the schema, datafile and io submodules
# from avro (easy_install avro)
from avro import schema, datafile, io
 
OUTFILE_NAME = 'sample.avro'
 
SCHEMA_STR = """{
    "type": "record",
    "name": "sampleAvro",
    "namespace": "AVRO",
    "fields": [
        {   "name": "name"   , "type": "string"   },
        {   "name": "age"    , "type": "int"      },
        {   "name": "address", "type": "string"   },
        {   "name": "value"  , "type": "long"     }
    ]
}"""
 
SCHEMA = schema.parse(SCHEMA_STR)
 
def write_avro_file():
    # Lets generate our data
    data = {}
    data['name']    = 'Foo'
    data['age']     = 19
    data['address'] = '10, Bar Eggs Spam'
    data['value']   = 800
 
    # Create a 'record' (datum) writer
    rec_writer = io.DatumWriter(SCHEMA)
 
    # Create a 'data file' (avro file) writer
    df_writer = datafile.DataFileWriter(
                    # The file to contain
                    # the records
                    open(OUTFILE_NAME, 'wb'),
                    # The 'record' (datum) writer
                    rec_writer,
                    # Schema, if writing a new file
                    # (aka not 'appending')
                    # (Schema is stored into
                    # the file, so not needed
                    # when you want the writer
                    # to append instead)
                    writers_schema = SCHEMA,
                    # An optional codec name
                    # for compression
                    # ('null' for none)
                    codec = 'deflate'
                )
 
    # Write our data
    # (You can call append multiple times
    # to write more than one record, of course)
    df_writer.append(data)
 
    # Close to ensure writing is complete
    df_writer.close()
 
def read_avro_file():
    # Create a 'record' (datum) reader
    # You can pass an 'expected=SCHEMA' kwarg
    # if you want it to expect a particular
    # schema (Strict)
    rec_reader = io.DatumReader()
 
    # Create a 'data file' (avro file) reader
    df_reader = datafile.DataFileReader(
                    open(OUTFILE_NAME),
                    rec_reader
                )
 
    # Read all records stored inside
    for record in df_reader:
        print record['name'], record['age']
        print record['address'], record['value']
        # Do whatever read-processing you wanna do
        # for each record here ...
 
if __name__ == '__main__':
    # Write an AVRO file first
    write_avro_file()
 
    # Now, read it
    read_avro_file()