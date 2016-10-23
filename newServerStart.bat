@echo off 
	
	title Wolfe's Modded A3 Liberation Server Script
	color 0c
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" color 0A
:title
	echo:
	echo:
echo ******************************************
echo Wolfe's Modded A3 Liberation Server Script
echo ******************************************

:menu
	tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" (color 0A ) ELSE (color 0c)
	
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
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3server.exe"
			)
		
			color 0A	
				cd "C:\Users\RyWolfe\Documents\Arma3Server"
					start "Wolfe's A3 Liberation Modded" arma3server.exe -port=2302 "-config=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\TADST_config.cfg" "-cfg=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\TADST_basic.cfg" "-profiles=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default" -name=default -filePatching -pid=pid.log -ranking=ranking.log "-mod=curator;heli;kart;mark;@ace;@Advanced Rappelling;@Advanced Sling Loading;@Advanced Towing;@Advanced Urban Rappelling;@Arma Enhanced Movement;@CBA_A3;@task_force_radio;@WolfeLib;@RHSAFRF;@RHSUSAF;@Tryk's Multi-play Uniforms Pack 0.9.4b;@TRYK Multiplay-Uniform Fix;@ADR-97 Weapon Pack (Official Mod);@BloodLust;@a3-team-mod-test" -autoInit
						echo:
						echo:
						echo ~Server Starting!~
						echo:
						echo:
						
	goto menu
	
:serverUpdateSteam

		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\Users\default" "C:\Users\RyWolfe\Documents\Arma3Server\TADST\backup" /S /Y /I /Q /K
			
			echo:
			echo:
			echo ~Server Backed Up!~
			echo:
			echo:
		
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3server.exe"
			)

			cd "C:\Users\RyWolfe\Documents\steamcmd"
				set /P UserPW=Pass: 
					start "Updater" /wait steamcmd.exe +login darkshadows311 %UserPW% +force_install_dir "C:\Users\RyWolfe\Documents\Arma3Server" +workshop_download_item 107410 450814997 +workshop_download_item 107410 463939057 +workshop_download_item 107410 713709341 +workshop_download_item 107410 615007497 +workshop_download_item 107410 639837898 +workshop_download_item 107410 730310357 +workshop_download_item 107410 333310405 +workshop_download_item 107410 620019431 +workshop_download_item 107410 772765069 +workshop_download_item 107410 775069027 +workshop_download_item 107410 684872545 +workshop_download_item 107410 741196544 +workshop_download_item 107410 669962280 +workshop_download_item 107410 667953829 +workshop_download_item 107410 785645866 +app_update 233780 validate +quit
						echo:
						echo:
						echo ~SteamCMD Mods Updated!~
						echo ~Server Validated~
						echo:
						echo:
			
	goto serverUpdateClean
	
:serverUpdateClean
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@CBA_A3\"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@ace"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Rappelling"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Sling Loading"
			del /S /Q *.*
		cd	"C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Towing"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Urban Rappelling"
			del /S /Q *.*
		cd	"C:\Users\RyWolfe\Documents\Arma3Server\@Arma Enhanced Movement"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@task_force_radio"
			del /S /Q *.*
		cd	"C:\Users\RyWolfe\Documents\Arma3Server\@WolfeLib"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@WolfeRHSLib"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@Tryk's Multi-play Uniforms Pack 0.9.4b"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@TRYK Multiplay-Uniform Fix"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@a3-team-mod-test"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@ADR-97 Weapon Pack (Official Mod)"
			del /S /Q *.*
		cd "C:\Users\RyWolfe\Documents\Arma3Server\@BloodLust"
			del /S /Q *.*
				echo:
				echo:
				echo ~Server Mod Files Cleaned!~
				echo:
				echo:
				
	goto serverUpdateXCOPY

:serverUpdateXCOPY
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\450814997\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@CBA_A3\" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\463939057\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@ace" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\713709341\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Rappelling" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\615007497\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Sling Loading" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\639837898\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Towing" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\730310357\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Urban Rappelling" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\333310405\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@Arma Enhanced Movement" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\620019431\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@task_force_radio" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\772765069\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@WolfeLib" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\775069027\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@WolfeRHSLib" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\684872545\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@Tryk's Multi-play Uniforms Pack 0.9.4b" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\741196544\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@TRYK Multiplay-Uniform Fix" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\669962280\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@ADR-97 Weapon Pack (Official Mod)" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\667953829\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@BloodLust" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\steamcmd\steamapps\workshop\content\107410\785645866\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\@a3-team-mod-test" /S /Y /I /Q /K 
				echo:
				echo:
				echo ~Server Mod Files Updated!~
				echo:
				echo:
				
	goto serverUpdateKeys
	
:serverUpdateKeys

		cd "C:\Users\RyWolfe\Documents\Arma3Server\keys"
			del /S /Q *.*
			
		XCOPY "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\keys" /S /Y /I /Q /K 
		
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@CBA_A3\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@ace\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Rappelling\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Sling Loading\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Towing\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@Advanced Urban Rappelling\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@Arma Enhanced Movement\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@task_force_radio\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@WolfeLib\Keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@WolfeRHSLib\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@Tryk's Multi-play Uniforms Pack 0.9.4b\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@TRYK Multiplay-Uniform Fix\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@ADR-97 Weapon Pack (Official Mod)\Keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@BloodLust\Keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\@a3-team-mod-test\keys\*.*" "C:\Users\RyWolfe\Documents\Arma3Server\Keys" /S /Y /I /Q /K 

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
		
		XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\Users\default" "C:\Users\RyWolfe\Documents\Arma3Server\TADST\backup" /S /Y /I /Q /K
			
			echo:
			echo:
			echo ~Server Backed Up!~
			echo:
			echo:
		
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3server.exe"
			)
		
		echo:
		echo:
		echo ~Server Halted!~
		echo:
		echo:

		goto menu
		
:serverBackup

			XCOPY "C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\Users\default" "C:\Users\RyWolfe\Documents\Arma3Server\TADST\backup" /S /Y /I /Q /K
			
			echo:
			echo:
			echo ~Server Backup Complete!~
			echo:
			echo:
			
	goto menu
		
:serverLogCycle
		
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" (
				color 0c
					taskkill /IM "arma3server.exe"
			)
		
			echo:
			echo:
			echo ~Server Halted!~
			echo:
			echo:
		
		cd "C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\"
		
		MOVE *.log "C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\LOGs"
			echo:
			echo:
			echo ~Cycled Logs~
			echo:
			echo:
		
		MOVE *.rpt "C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\RPTs"
			echo:
			echo:
			echo ~Cycled RPTs~
			echo:
			echo:
			
	goto menu