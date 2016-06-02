#!/bin/bash
cd /polylab/updatepack/test/
date=`date +%Y%m%d`

for i in {00232..00300}
do   
wget http://virusshare.com/hashes/VirusShare_$i.md5 -P md5/
done
#wget https://virusshare.com/hashes/unpacked_hashes.md5 -P md5/
rm md5/*.1
./ti_mgmt_server --compile-md5 /polylab/updatepack/test/md5
sleep 60s
mv md5.lib md5lib/VirusShare$date.lib



