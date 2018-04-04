@echo off 

:vars
set serverRootPath="C:\Users\Administrator\Documents\a3_new_lib_server"
set steamcmdRootPath="C:\steamCMD"


	title Wolfe's Modded A3 Liberation Server Script
	color 0c
		tasklist /FI "IMAGENAME eq arma3serverc_x64.exe" 2>NUL | find /I /N "arma3serverc_x64.exe">NUL
			if "%ERRORLEVEL%"=="0" color 0A
:title
	echo:
	echo:
echo ******************************************
echo Wolfe's Modded A3 Liberation Server Script
echo ******************************************

:menu
	tasklist /FI "IMAGENAME eq arma3serverc_x64.exe" 2>NUL | find /I /N "arma3serverc_x64.exe">NUL
			if "%ERRORLEVEL%"=="0" (color 0A ) ELSE (color 0c)
		
	set userSelect=0
	
echo What would you like to do:

	echo:
	echo 0 - Status Refresh
	echo 1 - Start Server (Stops Running Server)
	echo 2 - Update Server (Server Backup, Stops Running Server)
	echo 3 - Stop Server (Server Backup, Stops Running Server)
	echo 4 - Backup Server
	echo 5 - Cycle Logs (Stops Running Server)
	echo 6 - Quit.
	echo:
	echo:
	
set /P userSelect=Choice: 

if %userSelect% EQU 0 goto title

if %userSelect% EQU 1 goto serverStart

if %userSelect% EQU 2 goto serverUpdateSteam

if %userSelect% EQU 3 goto serverStop

if %userSelect% EQU 4 goto serverBackup 

if %userSelect% EQU 5 goto serverLogCycle

if %userSelect% EQU 6 ( EXIT ) ELSE (
		echo:
		echo:
	goto menu
)

:serverStart
		tasklist /FI "IMAGENAME eq arma3serverc_x64.exe" 2>NUL | find /I /N "arma3serverc_x64.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3serverc_x64.exe"
			)
		
			color 0A	
				cd "%serverRootPath%"
					start "Wolfe's A3 Liberation Modded" arma3serverc_x64.exe -port=2502 "-config=%serverRootPath%\TADST\default\TADST_config.cfg" "-cfg=%serverRootPath%\TADST\default\TADST_basic.cfg" "-profiles=%serverRootPath%\TADST\default" -name=default -filePatching -pid=pid.log -ranking=ranking.log "-mod=curator;heli;kart;mark;@CBA_A3;@ace;@Advanced Rappelling;@Advanced Sling Loading;@Advanced Towing;@Advanced Urban Rappelling;@Enhanced Movement;@task_force_radio;@WolfeLib;@Tryk's Multi-play Uniforms Pack 0.9.4b;@TRYK Multiplay-Uniform Fix;@BloodLust;@JSRS SOUNDMOD - Additional Weapon Handling and Reloading Sounds;@JSRS SOUNDMOD;@ACEX;@RHSUSAF;@ACE Compat - RHS United States Armed Forces;@Bullet Casings;@Jbad;@LYTHIUM" -autoInit
						echo:
						echo:
						echo ~Server Starting!~
						echo:
						echo:
						
	goto menu
	
:serverUpdateSteam

		XCOPY "%serverRootPath%\TADST\default\Users\default" "%serverRootPath%\TADST\backup" /S /Y /I /Q /K
			
			echo:
			echo:
			echo ~Server Backed Up!~
			echo:
			echo:
		
		tasklist /FI "IMAGENAME eq arma3serverc_x64.exe" 2>NUL | find /I /N "arma3serverc_x64.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3serverc_x64.exe"
			)

			cd "%steamcmdRootPath%"
				set /P UserNM=User: 
				set /P UserPW=Pass: 
					start "Updater" /wait steamcmd.exe +login %UserNM% %UserPW% +force_install_dir "%serverRootPath%" +workshop_download_item 107410 450814997 +workshop_download_item 107410 463939057 +workshop_download_item 107410 713709341 +workshop_download_item 107410 615007497 +workshop_download_item 107410 639837898 +workshop_download_item 107410 730310357 +workshop_download_item 107410 333310405 +workshop_download_item 107410 620019431 +workshop_download_item 107410 772765069 +workshop_download_item 107410 684872545 +workshop_download_item 107410 741196544 +workshop_download_item 107410 667953829 +workshop_download_item 107410 863393819 +workshop_download_item 107410 861133494 +workshop_download_item 107410 708250744 +workshop_download_item 107410 773125288 +workshop_download_item 107410 843577117 +workshop_download_item 107410 606289254 +workshop_download_item 107410 520618345 +workshop_download_item 107410 909547724 +app_update 233780 validate +quit
						echo:
						echo:
						echo ~SteamCMD Mods Updated!~
						echo ~Server Validated~
						echo:
						echo:
			
	goto serverUpdateClean
	
:serverUpdateClean
		cd "%serverRootPath%\@CBA_A3"
			del /S /Q *.*
		cd "%serverRootPath%\@ace"
			del /S /Q *.*
		cd "%serverRootPath%\@Advanced Rappelling"
			del /S /Q *.*
		cd "%serverRootPath%\@Advanced Sling Loading"
			del /S /Q *.*
		cd	"%serverRootPath%\@Advanced Towing"
			del /S /Q *.*
		cd "%serverRootPath%\@Advanced Urban Rappelling"
			del /S /Q *.*
		cd	"%serverRootPath%\@Enhanced Movement"
			del /S /Q *.*
		cd "%serverRootPath%\@task_force_radio"
			del /S /Q *.*
		cd	"%serverRootPath%\@WolfeLib"
			del /S /Q *.*
		cd "%serverRootPath%\@Tryk's Multi-play Uniforms Pack 0.9.4b"
			del /S /Q *.*
		cd "%serverRootPath%\@TRYK Multiplay-Uniform Fix"
			del /S /Q *.*
		cd "%serverRootPath%\@BloodLust"
			del /S /Q *.*
		cd "%serverRootPath%\@JSRS SOUNDMOD - Additional Weapon Handling and Reloading Sounds"
			del /S /Q *.*
		cd "%serverRootPath%\@JSRS SOUNDMOD"
			del /S /Q *.*
		cd "%serverRootPath%\@ACEX"
			del /S /Q *.*
		cd "%serverRootPath%\@RHSUSAF"
			del /S /Q *.*
		cd "%serverRootPath%\@ACE Compat - RHS United States Armed Forces"
			del /S /Q *.*
		cd "%serverRootPath%\@Bullet Casings"
			del /S /Q *.*
		cd "%serverRootPath%\@Jbad"
			del /S /Q *.*
		cd "%serverRootPath%\@LYTHIUM"
			del /S /Q *.*
				echo:
				echo:
				echo ~Server Mod Files Cleaned!~
				echo:
				echo:
				
	goto serverUpdateXCOPY

:serverUpdateXCOPY
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\450814997\*.*" "%serverRootPath%\@CBA_A3\" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\463939057\*.*" "%serverRootPath%\@ace" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\713709341\*.*" "%serverRootPath%\@Advanced Rappelling" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\615007497\*.*" "%serverRootPath%\@Advanced Sling Loading" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\639837898\*.*" "%serverRootPath%\@Advanced Towing" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\730310357\*.*" "%serverRootPath%\@Advanced Urban Rappelling" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\333310405\*.*" "%serverRootPath%\@Arma Enhanced Movement" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\620019431\*.*" "%serverRootPath%\@task_force_radio" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\772765069\*.*" "%serverRootPath%\@WolfeLib" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\684872545\*.*" "%serverRootPath%\@Tryk's Multi-play Uniforms Pack 0.9.4b" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\741196544\*.*" "%serverRootPath%\@TRYK Multiplay-Uniform Fix" /S /Y /I /Q /K  
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\667953829\*.*" "%serverRootPath%\@BloodLust" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\863393819\*.*" "%serverRootPath%\@JSRS SOUNDMOD - Additional Weapon Handling and Reloading Sounds" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\861133494\*.*" "%serverRootPath%\@JSRS SOUNDMOD" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\708250744\*.*" "%serverRootPath%\@ACEX" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\773125288\*.*" "%serverRootPath%\@ACE Compat - RHS United States Armed Forces" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\843577117\*.*" "%serverRootPath%\@RHSUSAF"/S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\606289254\*.*" "%serverRootPath%\@Bullet Casings" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\520618345\*.*" "%serverRootPath%\@Jbad" /S /Y /I /Q /K 
		XCOPY "%steamcmdRootPath%\steamapps\workshop\content\107410\909547724\*.*" "%serverRootPath%\@LYTHIUM" /S /Y /I /Q /K
		
		echo:
				echo:
				echo ~Server Mod Files Updated!~
				echo:
				echo:
				
	goto serverUpdateKeys
	
:serverUpdateKeys

		cd "%serverRootPath%\keys"
			del /S /Q *.*
			
		XCOPY "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\keys\*.*" "%serverRootPath%\keys" /S /Y /I /Q /K 
		
		XCOPY "%serverRootPath%\@CBA_A3\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@ace\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Advanced Rappelling\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Advanced Sling Loading\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Advanced Towing\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Advanced Urban Rappelling\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Arma Enhanced Movement\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@task_force_radio\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@WolfeLib\Keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Tryk's Multi-play Uniforms Pack 0.9.4b\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@TRYK Multiplay-Uniform Fix\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@BloodLust\Keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@JSRS SOUNDMOD - Additional Weapon Handling and Reloading Sounds\Keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@JSRS SOUNDMOD\Keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@ACEX\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@ACE Compat - RHS United States Armed Forces\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K  
		XCOPY "%serverRootPath%\@RHSUSAF\key\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Bullet Casings\Keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@Jbad\Addons\Key\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		XCOPY "%serverRootPath%\@LYTHIUM\keys\*.*" "%serverRootPath%\Keys" /S /Y /I /Q /K 
		

			echo:
			echo:
			echo ~Server Keys Updated!~
			echo:
			echo:
			echo ~Server Update Complete!~
			echo:
			echo:
				
	goto menu			
			
:serverStop
		
		XCOPY "%serverRootPath%\TADST\default\Users\default" "%serverRootPath%\TADST\backup" /S /Y /I /Q /K
			
			echo:
			echo:
			echo ~Server Backed Up!~
			echo:
			echo:
		
		tasklist /FI "IMAGENAME eq arma3serverc_x64.exe" 2>NUL | find /I /N "arma3serverc_x64.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3serverc_x64.exe"
			)
		
		echo:
		echo:
		echo ~Server Halted!~
		echo:
		echo:

		goto menu
		
:serverBackup

			XCOPY "%serverRootPath%\TADST\default\Users\default" "%serverRootPath%\TADST\backup" /S /Y /I /Q /K
			
			echo:
			echo:
			echo ~Server Backup Complete!~
			echo:
			echo:
			
	goto menu
		
:serverLogCycle
		
		tasklist /FI "IMAGENAME eq arma3serverc_x64.exe" 2>NUL | find /I /N "arma3serverc_x64.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3serverc_x64.exe"
			)
		
			echo:
			echo:
			echo ~Server Halted!~
			echo:
			echo:
		
		cd "%serverRootPath%\TADST\default\"
		
		MOVE *.log "%serverRootPath%\TADST\default\LOGs"
			echo:
			echo:
			echo ~Cycled Logs~
			echo:
			echo:
		
		MOVE *.rpt "%serverRootPath%\TADST\default\RPTs"
			echo:
			echo:
			echo ~Cycled RPTs~
			echo:
			echo:
			
	goto menu