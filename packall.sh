#!/bin/sh
cur_path=$(pwd)
clamavdb_path=$cur_path/clamavdb
geoip_path=$cur_path/geoip
yararules_path=$cur_path/yararules
domain_path=$cur_path/domain
ip_path=$cur_path/ip
md5_path=$cur_path/md5
peid_path=$cur_path/peid
cuckoo_signatures_path=$cur_path/cuckoo_signatures
jsunpack_path=$cur_path/jsunpack
dpi_path=$cur_path/dpi
ccdm_path=$cur_path/ccdm
idp_path=$cur_path/idp
malware_path=$cur_path/malware
pdfmt_path=$cur_path/pdfmt
other_path=$cur_path/other
packed_path=$cur_path/packed
mail_path=$cur_path/mail_path
name=poly
signaturesini=signatures.ini
delsignatureini=delsignatures.ini
date=`date +%Y%m%d%H%M%S`
version=_1.0.0.`date +%Y%m%d`
versiontxt=version.txt
installpy=install.py
installsh=install.sh
resart='sh /polyhawk/service/sandbox.sh restart'



usage()
{	
	echo ""
	echo ""
	echo "Usage: $pack { -p clamav|geoip|yararules|domain|ip|md5|peid|cuckoo_signatures| "
	echo "               jsunpack|dpi|ccdm|idp|malware|pdfmt|other|mingyu|all }"
	echo ""
	echo "          new signatures must have signatures.ini         "
	echo ""
	echo ""
}
pack_args()
{
	while getopts ":p:h" opt
		do
			case $opt in
			p)
				#target=$OPTARG
				if [ "$OPTARG" = "clamav" ] ;then
					PAT_TYPE=1
					target=AVEngineDB
				elif [ "$OPTARG" = "geoip" ] ;then
					PAT_TYPE=2
					target=GeographicalLocationInfo
				elif [ "$OPTARG" = "yararules" ] ;then
					PAT_TYPE=3
					target=YaraRules
				elif [ "$OPTARG" = "domain" ] ;then
					PAT_TYPE=4
				elif [ "$OPTARG" = "ip" ] ;then
					PAT_TYPE=5
				elif [ "$OPTARG" = "md5" ] ;then
					PAT_TYPE=6
					target=MD5Data
				elif [ "$OPTARG" = "peid" ] ;then
					PAT_TYPE=7
					target=PEiDRules
				elif [ "$OPTARG" = "cuckoo_signatures" ] ;then
					PAT_TYPE=8
					target=SandboxSignatures
				elif [ "$OPTARG" = "jsunpack" ] ;then
					PAT_TYPE=9
					target=JsunpackRules
				elif [ "$OPTARG" = "dpi" ] ;then
					PAT_TYPE=10
				elif [ "$OPTARG" = "ccdm" ] ;then
					PAT_TYPE=11
				elif [ "$OPTARG" = "idp" ] ;then
					PAT_TYPE=12
				elif [ "$OPTARG" = "malware" ] ;then
					PAT_TYPE=13
				elif [ "$OPTARG" = "pdfmt" ] ;then
					PAT_TYPE=14
				elif [ "$OPTARG" = "other" ] ;then
					PAT_TYPE=15
				elif [ "$OPTARG" = "all" ] ;then
					PAT_TYPE=16
				elif [ "$OPTARG" = "mingyu" ] ;then
					PAT_TYPE=17
					target=ReputationData
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
	if [ ! -d $clamavdb_path ] ;then
        mkdir -p $clamavdb_path
    fi

    if [ ! -d $geoip_path ] ;then
        mkdir -p $geoip_path
    fi
    
    if [ ! -d $yararules_path ] ;then
        mkdir -p $yararules_path
    fi

    if [ ! -d $domain_path ] ;then
        mkdir -p $domain_path
    fi

    if [ ! -d $ip_path ] ;then
        mkdir -p $ip_path
    fi
	if [ ! -d $md5_path ] ;then
        mkdir -p $md5_path
    fi
	if [ ! -d $peid_path ] ;then
        mkdir -p $peid_path
    fi
	if [ ! -d $cuckoo_signatures_path ] ;then
        mkdir -p $cuckoo_signatures_path
    fi
	if [ ! -d $jsunpack_path ] ;then
        mkdir -p $jsunpack_path
    fi
	if [ ! -d $dpi_path ] ;then
        mkdir -p $dpi_path
    fi
	if [ ! -d $ccdm_path ] ;then
        mkdir -p $ccdm_path
    fi
	if [ ! -d $idp_path ] ;then
        mkdir -p $idp_path
    fi
	if [ ! -d $malware_path ] ;then
        mkdir -p $malware_path
    fi
	if [ ! -d $pdfmt_path ] ;then
        mkdir -p $pdfmt_path
    fi
	if [ ! -d $other_path ] ;then
        mkdir -p $other_path
    fi
	if [ ! -d $packed_path ] ;then
        mkdir -p $packed_path
    fi
	
}




pack_prepare()
{
mkdir $target$version
echo $version >> version.txt
echo '#!/bin/sh' >> install.sh
echo '***************' $name$version '***************' >>log.log 
}
pack_clamavdb()
{
if [ "`ls -A $clamavdb_path`" = "" ] ; then
echo  'clamavdb no'>>log.log 
else
 echo "cp clamavdb/* /var/lib/clamav/" >> install.sh
 echo "cp version.txt /var/lib/clamav/" >> install.sh
 echo "/etc/init.d/clamav-daemon reload-database" >> install.sh
 cp -r $clamavdb_path $target$version/
 echo  'clamavdb yes'>>log.log 
fi

}
pack_geoip()
{
if [ "`ls -A $geoip_path_path`" = "" ] ; then
echo  'geoip no'>>log.log 
else
 echo "cp geoip/* /polydata/content/geoip/" >> install.sh
 echo "ps -ef | grep tomcat | grep -v grep|awk '{print $2}'|xargs kill -9" >>install.sh
 cp -r $geoip_path $target$version/
 echo  'geoip yes'>>log.log 
fi
}
pack_yararules()
{
if [ "`ls -A $yararules_path`"  = "" ];then
	echo "no new yararule"
	echo 'yararules no'>>log.log
else
	cp -r $yararules_path $target$version
	echo "cp yararules/* /polydata/content/yara/rules/" >> install.sh
	echo $resart>>install.sh
	echo 'yararule yes'>>log.log
fi
}
pack_domain()
{
if [ "`ls -A $domain_path`"  = "" ];then
	echo "domain no "
else
	cp  -r $domain_path/ $target$version
	echo "cp domain/dm.sys /polydata/content/malware/domain" >> install.sh
	echo '/polyhawk/bin/ti_mgmt_client --add-domain /polydata/content/malware/domain/dm.sys'>>install.sh
	echo "cp version.txt /polydata/content/malware/domain/" >> install.sh
	echo "cp domain/dm.sys /polydata/content/reputation/" >> install.sh
	echo "cp domain/ip.sys /polydata/content/reputation" >> install.sh
	echo " "
	echo 'domain yes' >>log.log
	
fi
}
pack_mingyu()
{
pack_domain
pack_idp

}
pack_ip()
{
echo "cp "
}
pack_md5()
{
if [ "`ls -A $md5_path`"  = "" ];then
	echo "md5 no "
else
	cp -r $md5_path $target$version
	echo "virusshare_path=/polydata/content/malware/md5/VirusShare/">>install.sh
	echo "cp md5/*.* /polydata/content/malware/md5/VirusShare/">>install.sh
	echo "cd /polydata/content/malware/md5/VirusShare/" >>install.sh
	echo "rm -f *.filepart " >>install.sh
	echo "/polyhawk/bin/ti_mgmt_server --start" >>install.sh
	echo "cd /polyfalcon/analysis/utils/pdmalware/bin/" >> install.sh
	echo 'if [ "`ls -A $virusshare_path `"  = "" ];then' >> install.sh
	echo "	mkdir -p /polydata/content/malware/md5/VirusShare/">>install.sh
	echo "	/polyhawk/bin/ti_mgmt_server --compile /polydata/content/malware/md5/VirusShare/" >> install.sh
	echo "else">>install.sh
	echo "	/polyhawk/bin/ti_mgmt_server --compile /polydata/content/malware/md5/VirusShare/" >> install.sh
	echo "fi" >> install.sh
	echo "/polyhawk/bin/ti_mgmt_server --stop" >>install.sh
	echo "/polyhawk/bin/ti_mgmt_server --start">>install.sh
	echo 'echo "success"'>>install.sh
	echo 'md5 yes' >>log.log
fi
}
pack_peid()
{
if [ "`ls -A $peid_path`"  = "" ];then
	echo "peid no "
else
	echo "cp -f peid/* /polyhawk/mds/analysis/sandbox/data/peutils/" >> install.sh
	echo "cp -f version.txt /polyhawk/mds/analysis/sandbox/data/peutils/" >> install.sh
	cp -r $peid_path $target$version/
	echo  'peid yes'>>log.log 
fi
}
pack_cuckoo_signatures()
{
if [ -f $delsignatureini -o -f $signaturesini ] ; then
	echo "# -*- coding: UTF-8 -*-" >> install.py
fi 
if [ -f $delsignatureini ] ; then
	
	echo "import os" >> install.py
fi
if [ -f $signatureini ] ; then
	echo "import shutil" >> install.py
fi
if [ -f $delsignatureini -o -f $signaturesini ] ; then
	echo "import sqlite3" >> install.py
	echo "sigcon = sqlite3.connect('/polydata/content/category/cuckoo_signatures.db')">> install.py
fi 

if [ "`ls -A $cuckoo_signatures_path`"  = "" ];then
	echo "no new cuckoo_signatures "
else 
	rm $installsh
	if [  -f $signaturesini ]; then
		_Name=( $( __readINI signatures.ini Name name ) )
		_Category_en=( $( __readINI signatures.ini Category_en category_en ) )
		_Category_ch=( $( __readINI signatures.ini Category_ch category_ch ) )
		_Severity=( $( __readINI signatures.ini Severity severity ) )
		_Description_en=( $( __readINI signatures.ini Description_en description_en ) )
		_Description_ch=( $( __readINI signatures.ini Description_ch description_ch ) )
		
		echo "run = sigcon.cursor()">>install.py
		addsql="insert into signatures(name,category_en,category_ch,severity,description_en,description_ch) values ('$_Name','$_Category_en','$_Category_ch','$_Severity','$_Description_en','$_Description_ch')"
		run='run.execute("'
		font='")'
		echo "string1 = u'$_Category_ch'">> install.py
		echo "string2 = u'$_Description_ch'">> install.py
		echo $run$addsql$font>>install.py
		cp -r $cuckoo_signatures_path $target$version
		echo 'os.system("cp cuckoo_signatures/* /polyhawk/mds/analysis/sandbox/modules/signatures/")' >> install.py
	else
		echo " no signatures.conf"
	fi
	
fi
if [ -f $delsignatureini ]; then
	_Name=( $( __readINI delsignatures.ini Name name ) )
	_Category_en=( $( __readINI delsignatures.ini Category_en category_en ) )
	_Category_ch=( $( __readINI delsignatures.ini Category_ch category_ch ) )
	_Severity=( $( __readINI delsignatures.ini Severity severity ) )
	_Description_en=( $( __readINI delsignatures.ini Description_en description_en ) )
	_Description_ch=( $( __readINI delsignatures.ini Description_ch description_ch ) )
	_Filename=( $( __readINI delsignatures.ini Filename filename ) )
	
	run='run.execute("'
	delsql="delete from signatures where name ='$_Name'"
	a='")'
	echo $run$delsql$a>>install.py
	#echo "os.remove('$_Filename')" >>install.py
fi
if [ -f $delsignatureini -o -f $signaturesini ] ; then
	echo "sigcon.commit()">>install.py
	echo "os.system('$resart')">>install.py
	
	echo "print 'success'">>install.py
fi 
}
pack_jsunpack()
{

if [ "`ls -A $jsunpack_path`" = "" ] ; then
echo  'jsunpack no'>>log.log 
else
 echo "cp jsunpack/* /polyfalcon/analysis/utils/jsunpack/" >> install.sh
 cp -r $jsunpack_path $target$version/
 echo  'jsunpack yes'>>log.log 
fi
}
pack_dpi()
{
echo "cp "
}
pack_ccdm()
{
echo "cp "
}
pack_idp()
{
if [ "`ls -A $idp_path`"  = "" ];then
	echo "idp no "
else
	
	cp -r $idp_path $target$version
	#cp -r $domain_path $target$version
	echo "cp -f idp/* /polydata/content/idp/">>install.sh
	#echo "cp domain/dm.sys /polydata/content/reputation/" >> install.sh
	#echo "cp domain/ip.sys /polydata/content/reputation/" >> install.sh
	dot='`'
	run="ps -ef|grep 'apt_packet'| grep -v 'grep'|awk '{print $"
	end="2}'"
	echo "kill -12 $dot$run$end$dot">>install.sh
	echo "exit 0" >> install.sh
	echo 'idp yes' >>log.log
fi
}
pack_malware()
{
echo "cp "
}
pack_pdfmt()
{
echo "cp "
}
pack_other()
{
echo "cp "
}

pack_all()
{

if [ "`ls -A $clamavdb_path`" = "" ] ; then
	echo  'clamavdb no'>>log.log 
	echo "no new clamavdb"
else
 echo "find new clamav "
 echo
 echo "cp clamavdb/* /var/lib/clamav/" >> install.sh
 echo "cp version.txt /var/lib/clamav/" >> install.sh
 cp -r $clamavdb_path $target$version/
 echo  'clamavdb yes'>>log.log 
fi

if [ "`ls -A $geoip_path`"  = "" ] ; then
echo  "no geoip update"
	
fi

if [ "`ls -A $yararules_path`"  = "" ];then
	echo "no new yararule"
	echo 'yararules no'>>log.log
else
	echo "find new yara"
	echo
	cp -r $yararules_path $target$version
	echo "cp yararules/* /polyfalcon/analysis/utils/yara/rules/" >> install.sh
	echo 'yararule yes'>>log.log
fi

if [ "`ls -A $domain_path`"  = "" ];then
	echo "no domain update"
fi

if [ "`ls -A $ip_path`"  = "" ];then
	echo "no ip update "
fi

if [ "`ls -A $md5_path`"  = "" ];then
	echo "no md5 update "
fi

if [ "`ls -A $peid_path`"  = "" ];then
	echo "no peid update "
fi



if [ "`ls -A $jsunpack_path`"  = "" ];then
	echo "no jsunpack update "
fi

if [ "`ls -A $dpi_path`"  = "" ];then
	echo "no dpi update "
fi

if [ "`ls -A $ccdm_path`"  = "" ];then
	echo "no ccdm update "
fi

if [ "`ls -A $idp_path`"  = "" ];then
	echo "no idp update "
fi

if [ "`ls -A $malware_path`"  = "" ];then
	echo "no malware update "
fi

if [ "`ls -A $pdfmt_path`"  = "" ];then
	echo "no pdfmt update "
fi

cp install.sh $target$version


}
pack_copy()
{
if [ "`ls -A $target$version`" = "" ] ; then
	echo "no new"
else	
	if [ ! -f $installpy ]; then
		echo " no install.py " >>log.log
	else
		cp $installpy $target$version
		echo "copy install.py to " $target$version >>log.log
	fi
	if [ ! -f $installsh ]; then
		echo " no install.sh " >>log.log
	else
		cp $installsh $target$version
		echo "copy install.sh to " $target$version >>log.log
	fi
	if [ ! -f $versiontxt ]; then
		echo " no version " >>log.log
	else
		cp $versiontxt $target$version
		echo "copy version.txt to " $target$version >>log.log
	fi

fi

}
pack_zip()
{

if [ "`ls -A $target$version`" != "" ] ; then
	#zip -P polygo -r $target$version.zip $target$version
	cp info.json $target$version
	zip -r $packed_path/$target$version.zip $target$version
fi
}

pack_clean()
{
rm $versiontxt
rm -r $target$version
if [  -f $installsh ]; then
	rm $installsh
fi
if [  -f $installpy ]; then
	rm $installpy
fi
}
# __readINI [配置文件路径+名称] [节点名] [键值]
function __readINI() {
 INIFILE=$1;	SECTION=$2;	ITEM=$3
 _readIni=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$ITEM'/{print $2;exit}' $INIFILE`
echo ${_readIni}
}
build_infojson()
{
  
  #cp info-sample.json info.json
  date=`date +%Y%m%d`
  date1=`date -d'-1 day' +'%Y%m%d'`
  if [ "$target" = "AVEngineDB" ];then
    echo "liebesu"
    ID="3001"
	chtarget="反病毒引擎特征码"
	suffix="sh"
	type="shell"
	IsVisible="1"
  elif [ "$target" = "SandboxSignatures" ];then
	ID="3002"
	chtarget="动态行为检测规则"
	suffix="py"
	type="python"
    IsVisible="1"
  elif [ "$target" = "YaraRules" ];then
    ID="3003"
	chtarget="Yara规则"
	suffix="sh"
	type="shell"
    IsVisible="1"
  elif [ "$target" = "JsunpackRules" ];then
    ID="3004"
	chtarget="CVE漏洞特征"
	suffix="sh"
	type="shell"
    IsVisible="1"
  elif [ "$target" = "ReputationData" ];then
    ID="3005"
	chtarget="威胁情报数据"
	suffix="sh"
	type="shell"
    IsVisible="1"
  elif [ "$target" = "MD5Data" ];then
    ID="3007"
	chtarget="哈希校验数据"
	suffix="sh"
	type="shell"
    IsVisible="1"
  elif [ "$target" = "PEiDRules" ];then
    ID="3008"
	chtarget="PEiD规则"
	suffix="sh"
	type="shell"
	IsVisible="1"
  elif [ "$target" = "GeographicalLocationInfo" ];then
    ID="3006"
	chtarget="地理位置信息"
	suffix="sh"
	type="shell"
	IsVisible="0"
  fi
  
  
  s='{
    "ProductId": '$ID',
    "ProductName": {
        "en": "'$target'",
        "ch": "'$chtarget'"
    },
    "ProductType": "Client",
    "ProductInfo": {
        "langCode": "CN_ZH",
        "OEM": "",
        "description": ""
    },
    "PlatformInfo": {
        "os": "Linux",
        "vender": "Ubuntu",
        "architecture": "X86",
        "version": "14.04"
    },
    "IsVisible": "'$IsVisible'",
    "UpdatePaths": {
        "from":{
            "minimum": "1.0.0.20151202",
            "maximum": "1.0.0.'$date1'"
        },
        "to": "1.0.0.'$date'",
        "required": [
        ]
    },
    "InstallInfo": {
        "version": "1.0.0.'$date'",
        "path": "install.'$suffix'",
        "type": "'$type'"
    }
}'
  
echo $s > info.json
}

scp_pack()
{
scp $packed_path/$target$version.zip root@192.168.25.20:/root/PolyUpgrade/Temp/ 
ret=$?
version1=`date +%Y%m%d`
if [ $ret -ne 0 ]; then
    python $cur_path/apt_send_mail.py $version1'每日更新情况：发送失败' "`cat $mail_path/$version1.txt`" $mail_path/$version1.txt
else
	python $cur_path/apt_send_mail.py $version1'每日更新情况：发送成功' "`cat $mail_path/$version1.txt`" $mail_path/$version1.txt
fi
python call_server.py $target$version.zip
time=`date +%Y%m%d%H%M%S`
echo $time $target$version"has send to 192.168.25.20" >> scp.log
}





##main

pack_init
pack_args $@
if [ $# != 2 ];then
	usage
	exit 1;
fi
pack_prepare
if [ $PAT_TYPE -eq "1" ] ;then
    
    pack_clamavdb
    
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
    
    pack_md5
    
fi
if [ $PAT_TYPE -eq "7" ] ;then
    
    pack_peid
    
fi
if [ $PAT_TYPE -eq "8" ] ;then
   
    pack_cuckoo_signatures
    
fi
if [ $PAT_TYPE -eq "9" ] ;then
    
    pack_jsunpack
    
fi
if [ $PAT_TYPE -eq "10" ] ;then
    
    pack_dpi
    
fi
if [ $PAT_TYPE -eq "11" ] ;then
    
    pack_ccdm
    
fi
if [ $PAT_TYPE -eq "12" ] ;then
    
    pack_idp
   
fi
if [ $PAT_TYPE -eq "13" ] ;then
   
    pack_malware
    
fi
if [ $PAT_TYPE -eq "14" ] ;then
    
    pack_pdfmt
    
fi
if [ $PAT_TYPE -eq "15" ] ;then
    
    pack_other
    
fi
if [ $PAT_TYPE -eq "16" ] ;then
   
    pack_all
   
fi
if [ $PAT_TYPE -eq "17" ] ;then
   
    pack_mingyu
   
fi
build_infojson
pack_copy
pack_zip
scp_pack
pack_clean
