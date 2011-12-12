pig_version=0.9.1
voldemort_version=0.90.1

echo "Installing Pig ${pig_version}..."
mkdir lib
cd lib
wget http://mirror.olnevhost.net/pub/apache//pig/pig-${pig_version}/pig-${pig_version}.tar.gz
tar -xvzf pig-${pig_version}.tar.gz
rm pig-${pig_version}.tar.gz
cd pig-${pig_version}

# Patch PIG-2411 so we can use the AvroStorage UDF - see https://issues.apache.org/jira/browse/PIG-2411
cp ../../src/pig/avrobug.patch .
patch -p0 < avrobug.patch

ant
cd contrib/piggybank/java
ant
cd ../../../..

echo "Setting up pig environment..."
export CLASSPATH=$CLASSPATH:$PATH/lib/pig-${pig_version}/build/ivy/lib/Pig/avro-1.4.1.jar\
:$PATH/lib/pig-${pig_version}/build/ivy/lib/Pig/json-simple-1.1.jar\
:$PATH/lib/pig-${pig_version}/contrib/piggybank/java/piggybank.jar\
:$PATH/lib/pig-${pig_version}/build/ivy/lib/Pig/jackson-core-asl-1.6.0.jar\
:$PATH/lib/pig-${pig_version}/build/ivy/lib/Pig/jackson-mapper-asl-1.6.0.jar

echo "Installing Voldemort ${voldemort_version}..."
cd lib
wget --no-check-certificate https://github.com/downloads/voldemort/voldemort/voldemort-0.90.1.tar.gz
tar -xvzf voldemort-${voldemort_version}.tar.gz
rm voldemort-${voldemort_version}.tar.gz
cd voldemort-${voldemort_version}
echo "Starting Voldemort..."
bin/voldemort-server.sh config/single_node_cluster > /tmp/voldemort.log &
cd ../..
