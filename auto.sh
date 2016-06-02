#!/bin/bash
cd /polylab/updatepack/test/MAKE/
python watcherlab_feed.py
cd /polylab/updatepack/test/
sh make.sh -m reputationdata
sh packall.sh -p mingyu
sh packall.sh -p md5

