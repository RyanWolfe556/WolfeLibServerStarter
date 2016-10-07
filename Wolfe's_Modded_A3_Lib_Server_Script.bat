@echo off 
	
	title Wolfe's Modded A3 Liberation Server Script
	color 0c
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" color 0A
:title
echo ******************************************
echo Wolfe's Modded A3 Liberation Server Script
echo ******************************************

:menu
echo What would you like to do:
	echo 1 - Start Server
	echo 2 - Update Server (Will Stop Running Server)
	echo 3 - Stop Server
	echo 4 - Quit.
	echo:
	echo 5 - (Beta!) RHS Server
	echo:
	echo:
set /P userSelect=Choice: 

if %userSelect% EQU 1 goto serverStart

if %userSelect% EQU 2 goto serverUpdate

if %userSelect% EQU 3 goto serverStop

if %userSelect% EQU 5 goto serverStartRHS

if %userSelect% EQU 4 ( EXIT ) ELSE (
		echo:
		echo:
	goto menu
)

:serverStart
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" goto serverStop4Restart
				:serverRestartReturn
				color 0A	
					cd "C:\Users\RyWolfe\Documents\Arma3Server"
						start "Wolfe's A3 Liberation Modded" arma3server.exe -port=2302 "-config=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\TADST_config.cfg" "-cfg=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\TADST_basic.cfg" "-profiles=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default" -name=default -filePatching -pid=pid.log -ranking=ranking.log "-mod=curator;heli;kart;mark;@ace;@Advanced Rappelling;@Advanced Sling Loading;@Advanced Towing;@Advanced Urban Rappelling;@Arma Enhanced Movement;@CBA_A3;@task_force_radio;@WolfeLib" -autoInit
							echo:
							echo:
							echo ~Server Running!~
							echo:
							echo:
	goto menu

:serverUpdate
	tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
		if "%ERRORLEVEL%"=="0" goto serverStop4Update
			:serverUpdateReturn
				cd "C:\Users\RyWolfe\Documents\steamcmd"
					set /P UserPW=Pass: 
					set /P UserGC=Guard Code: 
						start "Updater" /wait steamcmd.exe +login darkshadows311 %UserPW% %UserGC% +force_install_dir "C:\Users\RyWolfe\Documents\Arma3Server" +workshop_download_item 107410 450814997 +workshop_download_item 107410 463939057 +workshop_download_item 107410 713709341 +workshop_download_item 107410 615007497 +workshop_download_item 107410 639837898 +workshop_download_item 107410 730310357 +workshop_download_item 107410 333310405 +workshop_download_item 107410 620019431 +workshop_download_item 107410 772765069 +workshop_download_item 107410 775069027 +app_update 233780 validate +quit
							echo:
							echo:
							echo ~Server Mods Updated!~
							echo ~Server Validated~
							echo:
							echo:
	goto serverUpdate2_1
			
:serverUpdate2
		
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
		
			echo:
			echo:
			echo ~Server Files Updated!~
			echo:
			echo:
	goto menu
			
:serverStop
	color 0C
	taskkill /IM "arma3server.exe"
	echo:
			echo:
			echo:
			echo ~Server Halted!~
			echo:
			echo:
	goto menu
	
:serverStop4Update
	color 0c	
		taskkill /IM "arma3server.exe"
	goto serverUpdateReturn
		
:serverStop4Restart
	color 0c	
		taskkill /IM "arma3server.exe"
	goto serverRestartReturn
		
:serverUpdate2_1
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
	goto serverUpdate2
	
:serverStartRHS
		tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | find /I /N "arma3server.exe">NUL
			if "%ERRORLEVEL%"=="0" goto serverStop4RestartRHS
				:serverRestartReturnRHS
				color 0D
					cd "C:\Users\RyWolfe\Documents\Arma3Server"
						start "Wolfe's A3 Liberation Modded" arma3server.exe -port=2302 "-config=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\TADST_config.cfg" "-cfg=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default\TADST_basic.cfg" "-profiles=C:\Users\RyWolfe\Documents\Arma3Server\TADST\default" -name=default -filePatching -pid=pid.log -ranking=ranking.log "-mod=curator;heli;kart;mark;@ace;@Advanced Rappelling;@Advanced Sling Loading;@Advanced Towing;@Advanced Urban Rappelling;@Arma Enhanced Movement;@CBA_A3;@task_force_radio;@WolfeLib;@RHSAFRF;@RHSUSAF" -autoInit
							echo:
							echo:
							echo ~Server (RHS BETA) Running!~
							echo:
							echo:
	goto menu
		
:serverStop4RestartRHS
	color 0c
		taskkill /IM "arma3server.exe"
	goto serverRestartReturnRHS
