#!/bin/sh
cur_path=$(pwd)
make_path=$cur_path/MAKE
AVEngineDB_path=$make_path/AVEngineDB
JsunpackRules_path=$make_path/JsunpackRules
ReputationData_path=$make_path/ReputationData
SandboxSignatures_path=$make_path/SandboxSignatures
YaraRules_path=$make_path/YaraRules
PEiDRules_path=$make_path/PEiDRules
GeographicalLocationInfo_path=$make_path/GeographicalLocationInfo
mail_path=$cur_path/mail_path
repurl='https://rules.emergingthreatspro.com/7478815182700852/reputation'

usage()
{	
	echo ""
	echo ""
	echo "Usage: $make { -m avenginedb | jsunpackrules | yararules | sandboxsignatures | "
	echo "               peidrules | reputationdata | geoip |all }"
	echo ""
	echo ""
	
}
pack_args()
{
	while getopts ":m:h" opt
		do
			case $opt in
			m)
				if [ "$OPTARG" = "avenginedb" ] ;then
					   PAT_TYPE=1
					
				elif [ "$OPTARG" = "jsunpackrules" ] ;then
					   PAT_TYPE=2
				elif [ "$OPTARG" = "yararules" ] ;then
					   PAT_TYPE=3
				elif [ "$OPTARG" = "sandboxsignatures" ] ;then
					   PAT_TYPE=4
				elif [ "$OPTARG" = "peidrules" ] ;then
					   PAT_TYPE=5
				elif [ "$OPTARG" = "reputationdata" ] ;then
					   PAT_TYPE=6
				elif [ "$OPTARG" = "geoip" ] ;then
					   PAT_TYPE=7
				elif [ "$OPTARG" = "all" ] ;then
					   PAT_TYPE=8
				else
					usage
					exit 2
				fi
				;;
			h)
				usage
				exit 1
				;;
			\?)
				usage
				exit 2
				;;
			esac
		done
}  
pack_init()
{
	if [ ! -d $make_path ] ;then
        mkdir -p $make_path
    fi

    if [ ! -d $AVEngineDB_path ] ;then
        mkdir -p $AVEngineDB_path
    fi
    
    if [ ! -d $JsunpackRules_path ] ;then
        mkdir -p $JsunpackRules_path
    fi

    if [ ! -d $ReputationData_path ] ;then
        mkdir -p $ReputationData_path
    fi

    if [ ! -d $SandboxSignatures_path ] ;then
        mkdir -p $SandboxSignatures_path
    fi
	if [ ! -d $YaraRules_path ] ;then
        mkdir -p $YaraRules_path
    fi
	if [ ! -d $PEiDRules_path ] ;then
        mkdir -p $PEiDRules_path
    fi
	if [ ! -d $GeographicalLocationInfo_path ] ;then
        mkdir -p $GeographicalLocationInfo_path
    fi
	if [ ! -d $mail_path ] ;then
        mkdir -p $mail_path
    fi
	
	
}
AVEngineDB()
{
    WORKING_DIR=$AVEngineDB_path/working
	DST_DIR=$AVEngineDB_path/dst
	DB_DIR=$AVEngineDB_path/db
	if [ ! -d $WORKING_DIR ] ;then
        mkdir -p $WORKING_DIR
    fi
	if [ ! -d $DST_DIR ] ;then
        mkdir -p $DST_DIR
    fi
	if [ ! -d $DB_DIR ] ;then
        mkdir -p $DB_DIR
    fi
	freshclam > $WORKING_DIR/update.log
	UPDATE_FLAG=`cat $WORKING_DIR/update.log | grep 'Database updated'`
	if [ "$UPDATE_FLAG" != "" ] ;then
		record_log "find the new clamav pattern..."
		
		cd $WORKING_DIR
		cd $DB_DIR
		mkdir clamav
		cp /var/lib/clamav/*.cvd /var/lib/clamav/*.cld $DB_DIR/clamav/
		version=`date +%Y%m%d%H`
		echo "$version" > $DB_DIR/clamav/version.txt
		mkdir $version
		cp $DB_DIR/clamav/ $version
		cp $DB_DIR/clamav/*.cvd $DB_DIR/clamav/*.cvd ../../../clamavdb
		#rm -rf $DST_DIR/db/*.tgz*
		mv clamav_pat.$version.tgz* $DST_DIR
		echo "####clamav pattern is updated, current version[$version]. You can find the package from [$DST_DIR]!"
			#return 1
			
	fi

}


GeographicalLocationInfo()
{
	
	WORKING_DIR=$GeographicalLocationInfo_path/working
	DST_DIR=$GeographicalLocationInfo_path/dst
	if [ ! -d $WORKING_DIR ] ;then
        mkdir -p $WORKING_DIR
    fi
	if [ ! -d $DST_DIR ] ;then
        mkdir -p $DST_DIR
    fi
	wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City-CSV.zip -O $WORKING_DIR/GeoLite2-City-CSV.zip 2>/dev/null
    if [ $? -ne "0" ] ;then
        echo "fail to download the GeoLite2-City-CSV.zip"
        return 0
    fi
    cd $WORKING_DIR
    unzip GeoLite2-City-CSV.zip 2>/dev/null
    cd GeoLite2-City-CSV_*
    blocks_md5=`md5sum GeoLite2-City-Blocks-IPv4.csv |cut -d" " -f1| xargs echo`
    locations_md5=`md5sum GeoLite2-City-Locations-zh-CN.csv |cut -d" " -f1| xargs echo`
    blocks_current=`cat $ORI_DIR/blocks_current.md5 | xargs echo`
    locations_current=`cat $ORI_DIR/locations_current.md5 | xargs echo`
    if [ "$blocks_md5" != "$blocks_current" ] || [ "$locations_md5" != "$locations_current" ];then
        mkdir geoip
        cp GeoLite2-City-Blocks-IPv4.csv GeoLite2-City-Locations-zh-CN.csv geoip/
        version=`date +%Y%m%d%H00`
        echo "$version" > geoip/version.txt
        tar zcf geoip_data.$version.tgz geoip/*
        md5sum geoip_data.$version.tgz | cut -d" " -f1 > geoip_data.$version.tgz.md5
        rm -rf $DST_DIR/*.tgz*
        mv geoip_data.$version.tgz* $DST_DIR
        cp geoip/* $cur_path/geoip/
        echo "####geoip data is updated, current version[$version]. You can find the package from [$DST_DIR]!"
        return 1
    fi
	time =`date`
	echo "$time geoip 更新至$version"> $DST_DIR$version.txt
	
	
}




ReputationData()
{
   	
	WORKING_DIR=$ReputationData_path/working
	DST_DIR=$ReputationData_path/dst
	ORI_DIR=$ReputationData_path/ori
    LogFile=$ReputationData_path/log.txt
    BIN_DIR=$ReputationData_path/bin
	RESULT_DIR=$ReputationData_path/result
	if [ ! -d $WORKING_DIR ] ;then
        mkdir -p $WORKING_DIR
    fi
	if [ ! -d $DST_DIR ] ;then
        mkdir -p $DST_DIR
    fi
	if [ ! -d $ORI_DIR ] ;then
        mkdir -p $ORI_DIR
    fi
	if [ ! -d $RESULT_DIR ] ;then
        mkdir -p $RESULT_DIR
    fi
	if [ ! -d $BIN_DIR ] ;then
        mkdir -p $BIN_DIR
		cp libtrans $BIN_DIR/
		chmod +x libtrans
    fi
	
	md5_file="$ORI_DIR/current.md5"
    current=`cat $md5_file | xargs echo`
    wget http://rules.emergingthreatspro.com/8430691101153340/suricata-1.1.0/etpro.rules.tar.gz.md5 -O $WORKING_DIR/current.md5 2>/dev/null
    if [ $? -ne "0" ] ;then
        echo "fail to download the etpro.rules.tar.gz.md5"
        return 0
    fi
    latest=`cat $WORKING_DIR/current.md5 | xargs echo`
    
    if [ "$latest" != "$current" ] ;then
        echo "find new rules, start downloading..."
        wget https://rules.emergingthreatspro.com/8430691101153340/suricata-1.1.0/etpro.rules.tar.gz -O $WORKING_DIR/etpro.rules.tar.gz 2>/dev/null
        if [ $? -ne "0" ] ;then
            record_log "fail to download the etpro.rules.tar.gz"
            return 0
        fi
        cd $WORKING_DIR/
        #check the md5sum of the package
        pkg_md5=`md5sum etpro.rules.tar.gz |cut -d" " -f1| xargs echo`
        if [ "$latest" != "$pkg_md5" ] ;then
            record_log "etpro.rules.tar.gz md5sum check fail!"
            return 0
        fi
        tar zxf etpro.rules.tar.gz
        #reset the msg from rules file
        cd $WORKING_DIR/rules
        sed -i 's/msg:"ET /\msg:"PD /' *.rules
        sed -i 's/msg:"SURICATA /\msg:"PD /' *.rules
        sed -i 's/msg:"ETPRO /\msg:"PD /' *.rules
        cp $WORKING_DIR/rules/*.* ../../../../idp/
		echo "idp $version done" >>rules.log
		cp $WORKING_DIR/current.md5 $md5_file
		rm ../etpro.rules.tar.gz
    fi
	
	
	
    md5_iprepdata="$ORI_DIR/current_ip.md5"
    md5_dmrepdata="$ORI_DIR/current_dm.md5"
	if [ -f "$md5_iprepdata" ]&&[ -f "$md5_dmrepdata" ] ;then
		current_ip=`cat $md5_iprepdata | xargs echo`
		current_dm=`cat $md5_dmrepdata | xargs echo`
		wget $repurl/detailed-iprepdata.txt.gz.md5sum -O $WORKING_DIR/current_ip.md5 2>/dev/null
		if [ $? -ne "0" ] ;then
			echo "fail to download the detailed-iprepdata.txt.gz.md5sum"
			return 0
		fi
		latest_ip=`cat $WORKING_DIR/current_ip.md5 | xargs echo`

		wget $repurl/detailed-domainrepdata.txt.gz.md5sum -O $WORKING_DIR/current_dm.md5 2>/dev/null
		if [ $? -ne "0" ] ;then
			echo "fail to download the detailed-domainrepdata.txt.gz.md5sum"
			return 0
		fi
		latest_dm=`cat $WORKING_DIR/current_dm.md5 | xargs echo` 
    
        #echo "check the rep package md5 for updating..."
		if [ "$latest_ip" != "$current_ip" ] || [ "$latest_dm" != "$current_dm" ] ;then
			echo "find new rep pattern, start downloading..."
			wget $repurl/detailed-iprepdata.txt.gz -O $WORKING_DIR/detailed-iprepdata.txt.gz 2>/dev/null
			if [ $? -ne "0" ] ;then
				echo "fail to download the detailed-iprepdata.txt.gz"
				return 0
			fi
			wget $repurl/detailed-domainrepdata.txt.gz -O $WORKING_DIR/detailed-domainrepdata.txt.gz 2>/dev/null
			if [ $? -ne "0" ] ;then
				echo "fail to download the detailed-domainrepdata.txt.gz"
				return 0
			fi
			cd $WORKING_DIR/
				#check the md5sum of the package
			ip_pkg_md5=`md5sum detailed-iprepdata.txt.gz |cut -d" " -f1| xargs echo`
			if [ "$latest_ip" != "$ip_pkg_md5" ] ;then
				echo "detailed-iprepdata.txt.gz md5sum check fail!"
				return 0
			fi
			dm_pkg_md5=`md5sum detailed-domainrepdata.txt.gz |cut -d" " -f1| xargs echo`
			if [ "$latest_dm" != "$dm_pkg_md5" ] ;then
				echo "detailed-domainrepdata.txt.gz md5sum check fail!"
				return 0
			fi
			gunzip detailed-iprepdata.txt.gz detailed-domainrepdata.txt.gz
			echo "convert the new rep pattern..."
			version=`date +%Y%m%d`
			if [ ! -d daydown ];then
				mkdir daydown
			fi
			$BIN_DIR/libtrans -l 1 -s detailed-iprepdata.txt -d  daydown/ipdown$version.sys >> $LogFile
			$BIN_DIR/libtrans -l 2 -s detailed-domainrepdata.txt -d daydown/dmdown$version.sys >> $LogFile
			rm detailed-iprepdata.txt
			rm detailed-domainrepdata.txt
			echo 'ipdown',$version,`cat daydown/ipdown$version.sys | wc -l` >>daydown/ipdown$version.txt
			echo 'dmdown',$version,`cat daydown/dmdown$version.sys | wc -l` >>daydown/dmdown$version.txt
			
			packeddate=`date +%Y%m%d`
			cp daydown/ipdown$version.sys ../result/
			cp daydown/dmdown$version.sys ../result/
			
			cp /polylab/updatepack/test/MAKE/scrapy/url360/result/crawlall$version.sys ../result/
			
			cat ../result/crawlall$version.sys  ../result/dmdown$version.sys ../../watcherlab_blackdomain.txt |sort | uniq >../result/dm$packeddate.sys
			cat ../result/ipdown$packeddate.sys ../../watcherlab_blackipv4.txt |sort | uniq > ../result/ip$packeddate.sys
			while read line
			do
				sed '/'$line'/d' ../result/dm$packeddate.sys >../result/dm$packeddate.sys.bak && mv -f ../result/dm$packeddate.sys.bak ../result/dm$packeddate.sys
			done < ../white/white.sys
			cp ../result/dm$packeddate.sys ../result/dm.sys
			cp ../result/ip$packeddate.sys ../result/ip.sys
			echo '爬虫domain数量：' `cat ../result/crawlall$version.sys  | wc -l` >../result/cr$version.txt
			echo '网络下载domain数量：' `cat ../result/dmdown$version.sys  | wc -l` > ../result/dmdown$version.txt
			echo '去重总共domain数量：' `cat ../result/dm.sys |wc -l` >../result/dm$version.txt
			echo '网络下载ip数量：' `cat ../result/ip.sys |  wc -l` >../result/ip$version.txt
			echo  'MD5数量：' `cat $cur_path/md5/*.md5 |sort | uniq |wc -l` > ../result/md5$version.txt
			echo 'idp rules 条数：' `find $cur_path/idp/ -name "*.rules" | xargs grep "^alert" |wc -l` > ../result/rules$version.txt
			echo 'watcherlab_domain数量:' `cat ../../watcherlab_blackdomain.txt |sort | uniq |wc -l`> ../result/watchlab_blackdomain$version.txt
			echo 'watcherlab_ipv4数量:' `cat ../../watcherlab_blackipv4.txt |sort | uniq |wc -l`>../result/watchlab_blackipv4$version.txt
			cd ../result/
			
			time=`date +%Y%m%d%H%M%S`
			echo $time '推送：20机器' > to.txt
			cat cr$version.txt dmdown$version.txt dm$version.txt ip$version.txt  md5$version.txt rules$version.txt  watchlab_blackdomain$version.txt watchlab_blackipv4$version.txt to.txt> $version.txt
			cp $version.txt $mail_path/
			
			cd ../working
			cp ../result/dm.sys ../../../domain/
			cp ../result/ip.sys ../../../domain/
			#echo "$version" > ../result/version.txt
			
		#cp $WORKING_DIR/repdata/dm.sys result/
		#cp $WORKING_DIR/repdata/ip.sys result/
		   # create_link repdata $DST_DIR/repdata.$version.tgz
			echo "$latest_ip" > $md5_iprepdata
			echo "$latest_dm" > $md5_dmrepdata
			
			echo "####rep pattern is updated, current version[$version]. You can find the package from [$DST_DIR]!"
			
		fi
		else
			echo 
			wget $repurl/detailed-iprepdata.txt.gz.md5sum -O $ORI_DIR/current_ip.md5 2>/dev/null
			wget $repurl/detailed-domainrepdata.txt.gz.md5sum -O $ORI_DIR/current_dm.md5 2>/dev/null
			current_ip=`cat $md5_iprepdata | xargs echo`
		current_dm=`cat $md5_dmrepdata | xargs echo`
		wget $repurl/detailed-iprepdata.txt.gz.md5sum -O $WORKING_DIR/current_ip.md5 2>/dev/null
		if [ $? -ne "0" ] ;then
			echo "fail to download the detailed-iprepdata.txt.gz.md5sum"
			return 0
		fi
		latest_ip=`cat $WORKING_DIR/current_ip.md5 | xargs echo`

		wget $repurl/detailed-domainrepdata.txt.gz.md5sum -O $WORKING_DIR/current_dm.md5 2>/dev/null
		if [ $? -ne "0" ] ;then
			echo "fail to download the detailed-domainrepdata.txt.gz.md5sum"
			return 0
		fi
		latest_dm=`cat $WORKING_DIR/current_dm.md5 | xargs echo` 
    
        #echo "check the rep package md5 for updating..."
		if [ "$latest_ip" != "$current_ip" ] || [ "$latest_dm" != "$current_dm" ] ;then
			echo "find new rep pattern, start downloading..."
			wget $repurl/detailed-iprepdata.txt.gz -O $WORKING_DIR/detailed-iprepdata.txt.gz 2>/dev/null
			if [ $? -ne "0" ] ;then
				echo "fail to download the detailed-iprepdata.txt.gz"
				return 0
			fi
			wget $repurl/detailed-domainrepdata.txt.gz -O $WORKING_DIR/detailed-domainrepdata.txt.gz 2>/dev/null
			if [ $? -ne "0" ] ;then
				echo "fail to download the detailed-domainrepdata.txt.gz"
				return 0
			fi
			cd $WORKING_DIR/
				#check the md5sum of the package
			ip_pkg_md5=`md5sum detailed-iprepdata.txt.gz |cut -d" " -f1| xargs echo`
			if [ "$latest_ip" != "$ip_pkg_md5" ] ;then
				echo "detailed-iprepdata.txt.gz md5sum check fail!"
				return 0
			fi
			dm_pkg_md5=`md5sum detailed-domainrepdata.txt.gz |cut -d" " -f1| xargs echo`
			if [ "$latest_dm" != "$dm_pkg_md5" ] ;then
				echo "detailed-domainrepdata.txt.gz md5sum check fail!"
				return 0
			fi
			gunzip detailed-iprepdata.txt.gz detailed-domainrepdata.txt.gz
			echo "convert the new rep pattern..."
			version=`date +%Y%m%d`
			if [ ! -d daydown ];then
				mkdir daydown
			fi
			$BIN_DIR/libtrans -l 1 -s detailed-iprepdata.txt -d  daydown/ipdown$version.sys >> $LogFile
			$BIN_DIR/libtrans -l 2 -s detailed-domainrepdata.txt -d daydown/dmdown$version.sys >> $LogFile
			rm detailed-iprepdata.txt
			rm detailed-domainrepdata.txt 
			echo 'ipdown',$version,`cat daydown/ipdown$version.sys | wc -l` >>daydown/ipdown$version.txt
			echo 'dmdown',$version,`cat daydown/dmdown$version.sys | wc -l` >>daydown/dmdown$version.txt
			
			packeddate=`date +%Y%m%d`
			cp daydown/ipdown$version.sys ../result/
			cp daydown/dmdown$version.sys ../result/
			
			scp root@192.168.25.203:/root/scrapy/url360/result/crawlall.sys ../result/
			
			cat ../result/crawlall.sys  ../result/dmdown$version.sys >>../result/dm$packeddate.sys
			
			cp ../result/dm$packeddate.sys ../result/dm.sys
			cp ../result/ipdown$packeddate.sys ../result/ip.sys
			echo `cat ../result/crawlall.sys | wc -l` >>../result/cr$version.txt
			echo `cat ../result/dm.sys | wc -l` >>../result/dm$version.txt
			echo `cat ../result/ip.sys | wc -l` >>../result/ip$version.txt
			echo '爬虫domain数量：' `cat ../result/$version.sys | wc -l` >../result/cr$version.txt
			echo '网络下载domain数量：' `cat ../result/dm.sys | wc -l` >../result/dm$version.txt
			echo '网络下载ip数量：' `cat ../result/ip.sys | wc -l` >../result/ip$version.txt
			echo  'MD5数量' `cat $cur_path/md5/*.md5|sort | uniq |wc -l` > ../result/md5$version.txt
			echo 'idp rules 条数：' `cat $cur_path/idp/*.rules` > ../result/rules$version.txt
			cd ../result/
			cat cr$version.txt dm$version.txt ip$version.txt  md5$version.txt rules$version.txt> $version.txt
			
			cp $version.txt $mail_path/
			
			cd ../working
			cp ../result/dm.sys ../../../domain/
			cp ../result/ip.sys ../../../domain/
			#echo "$version" > ../result/version.txt
			
		#cp $WORKING_DIR/repdata/dm.sys result/
		#cp $WORKING_DIR/repdata/ip.sys result/
		   # create_link repdata $DST_DIR/repdata.$version.tgz
			echo "$latest_ip" > $md5_iprepdata
			echo "$latest_dm" > $md5_dmrepdata
			
			echo "####rep pattern is updated, current version[$version]. You can find the package from [$RESULT_DIR]!"
			return 1
		fi
		
    fi
     
  
	


}
 
send_mail()
{
  
  version=`date +%Y%m%d`
  cat $mail_path/$version.txt >$version.txt
  #python $cur_path/apt_send_mail.py $version'每日更新情况' "`cat $mail_path/$version.txt`" $version.txt
}
 
 

######main######
pack_init
pack_args $@
if [ $# != 2 ];then
	usage
	exit 1;
fi

if [ $PAT_TYPE -eq "1" ] ;then
    
    AVEngineDB
    
fi
if [ $PAT_TYPE -eq "2" ] ;then
    
    pack_geoip
    
fi
if [ $PAT_TYPE -eq "3" ] ;then
    
    pack_yararules
    
fi
if [ $PAT_TYPE -eq "4" ] ;then
    
    pack_domain
    
fi
if [ $PAT_TYPE -eq "5" ] ;then
    
    pack_ip
    
fi
if [ $PAT_TYPE -eq "6" ] ;then
    
    ReputationData
	
    
fi
if [ $PAT_TYPE -eq "7" ] ;then
    
    GeographicalLocationInfo
    
fi
send_mail
