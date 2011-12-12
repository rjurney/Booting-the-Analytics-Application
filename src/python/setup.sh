# # Install protobufs
# echo "Installing Python protobufs..."
# cd ../../lib
# mkdir python
# cd python
# wget --no-check-certificate https://protobuf.googlecode.com/files/protobuf-2.4.1.tar.gz
# tar -xvzf protobuf-2.4.1.tar.gz
# rm protobuf-2.4.1.tar.gz
# cd protobuf-2.4.1
# ./configure
# make
# make check
# sudo make install
# cd python
# python setup.py test
# sudo python setup.py install
# 
# # Install Voldemort client
# cd ../../../voldemort-0.90.1
# bin/voldemort-stop.sh
# bin/voldemort-server.sh clients/python/tests/voldemort_config &
# cd clients/python
# python setup.py nosetests
# sudo python setup.py install
# cd ../..
# bin/voldemort-stop.sh
# 
# # Bring voldemort back in normal configuration
# bin/voldemort-server.sh config/single_node_cluster > /tmp/voldemort.log &
# cd ..
# 
# # Install avro
# wget http://apache.mirrors.tds.net//avro/stable/py/avro-1.6.1.tar.gz
# tar -xvzf avro-1.6.1.tar.gz
# rm avro-1.6.1.tar.gz
# cd avro-1.6.1
# 
# 
