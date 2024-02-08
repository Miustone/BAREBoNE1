@echo off
setlocal EnableExtensions EnableDelayedExpansion

title BAREBoNE1 CREATION SCRIPT BETA
echo WELCOME TO THE BAREBoNE1 COMMUNITY!
timeout /t 3 /nobreak > nul
cls

set DriveLetter=
set /p DriveLetter=PLEASE ENTER THE DRIVE LETTER OF THE MOUNTED Windows ISO FILE: 
set "DriveLetter=%DriveLetter%:"
echo.
if not exist "%DriveLetter%\sources\boot.wim" (
	echo.CAN NOT FIND THE Windows INSTALLATION FILES IN THE SPECIFIED DRIVE LETTER...
	echo.
	echo.PLEASE ENTER THE DRIVE LETTER WHICH CONTAINS THE Windows FILES...
	goto :Stop
)

if not exist "%DriveLetter%\sources\install.wim" (
	echo.CAN NOT FIND THE Windows INSTALLATION FILES IN THE SPECIFIED DRIVE LETTER...
	echo.
	echo.PLEASE ENTER THE DRIVE LETTER WHICH CONTAINS THE Windows FILES...
	goto :Stop
)
md c:\BAREBoNE1
echo EXTRACTING Windows...
xcopy.exe /E /I /H /R /Y /J %DriveLetter% c:\BAREBoNE1 >nul
echo EXTRACTION DONE!
sleep 2
cls
echo GETTING Windows VERSION:
dism /Get-WimInfo /wimfile:c:\BAREBoNE1\sources\install.wim
for /f "tokens=2* delims=:" %%a in ('dism /Get-WimInfo /wimfile:c:\BAREBoNE1\sources\install.wim /index:1 ^| find "Name"') do set "osname=%%b"
echo THE ISO FILE CONTAINS: %osname%
set index=
set /p index=Please enter the image index:
set "index=%index%"
echo MOUNTING WINDOWS IMAGE. THIS MAY TAKE A WHILE.
echo.
md c:\scratchdir
dism /mount-image /imagefile:c:\BAREBoNE1\sources\install.wim /index:%index% /mountdir:c:\scratchdir

echo MOUNTING COMPLETE! PERFORMING REMOVAL OF APPLICATIONS...

echo REMOVING Clipchamp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Clipchamp.Clipchamp_2.2.8.0_neutral_~_yxz26nhyzhsrt 

echo REMOVING News...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Weather...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Xbox...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GamingApp_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING GetHelp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GetHelp_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING GetStarted...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Office Hub...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Solitaire...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING PeopleApp...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING PowerAutomate...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.PowerAutomateDesktop_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING ToDo...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Todos_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Alarms...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsAlarms_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Mail...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Feedback Hub...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsFeedbackHub_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Maps...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Sound Recorder...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING XboxTCUI...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Xbox.TCUI_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING XboxGamingOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING XboxGameOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameOverlay_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING XboxSpeechToTextOverlay...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Your Phone...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.YourPhone_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Music...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Video...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Family...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.MicrosoftFamily_2022.507.447.0_neutral_~_8wekyb3d8bbwe

echo REMOVING QuickAssist...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.QuickAssist_2022.507.446.0_neutral_~_8wekyb3d8bbwe

echo REMOVING Teams...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:MicrosoftTeams_23002.403.1788.1930_x64__8wekyb3d8bbwe

echo REMOVING Cortana...
dism /image:c:\scratchdir /Remove-ProvisionedAppxPackage /PackageName:Microsoft.549981C3F5F10_4.2204.13303.0_neutral_~_8wekyb3d8bbwe

echo REMOVING OF SYSTEM APPS COMPLETE! PROCEEDING NOW TO THE REMOVAL OF SYSTEM PACKAGES...

timeout /t 1 /nobreak > nul
cls

echo REMOVING Internet Explorer...
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~en-US~11.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~11.0.22621.1265 > nul

echo REMOVING LA57:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Kernel-LA57-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING Handwriting:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING OCR:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING Speech:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING TTS:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING Media Player Legacy:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~en-US~10.0.22621.1 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~~10.0.22621.1 > nul

echo REMOVING Tablet PC Math:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-TabletPCMath-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING Wallpapers:
dism /image:c:\scratchdir /Remove-Package /PackageName:Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 > nul

echo REMOVING Edge:
rd "C:\scratchdir\Program Files (x86)\Microsoft\Edge" /s /q
rd "C:\scratchdir\Program Files (x86)\Microsoft\EdgeUpdate" /s /q

echo REMOVING OneDrive:
takeown /f C:\scratchdir\Windows\System32\OneDriveSetup.exe
icacls C:\scratchdir\Windows\System32\OneDriveSetup.exe /grant Administrators:F /T /C
del /f /q /s "C:\scratchdir\Windows\System32\OneDriveSetup.exe"

echo REMOVAL COMPLETE!

timeout /t 2 /nobreak > nul
cls

echo LOADING REGISTRY...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul

echo BYPASSING SYSTEM REQUIREMENTS(ON THE SYSTEM IMAGE):
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1

echo DISABLING TEAMS:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v "ConfigureChatAutoInstall" /t REG_DWORD /d "0" /f >nul 2>&1

echo DISABLING SPONSORED APPS:
Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start" /v "ConfigureStartPins" /t REG_SZ /d "{\"pinnedList\": [{}]}" /f >nul 2>&1

echo Disabling Reserved Storage:
Reg add "HKLM\zSOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d "0" /f >nul 2>&1

echo DISABLING CHAT ICON:
Reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f >nul 2>&1
Reg add "HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f >nul 2>&1

echo OPTIMIZATION COMPLETE!

echo UNMOUNTING REGISTRY...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1

echo CLEANING UP IMAGE...
dism /image:c:\scratchdir /Cleanup-Image /StartComponentCleanup /ResetBase

echo CLEANUP COMPLETE!

echo UNMOUNTING IMAGE...
dism /unmount-image /mountdir:c:\scratchdir /commit

echo EXPORTING IMAGE...
Dism /Export-Image /SourceImageFile:c:\BAREBoNE1\sources\install.wim /SourceIndex:%index% /DestinationImageFile:c:\BAREBoNE1\sources\install2.wim /compress:max
del c:\BAREBoNE1\sources\install.wim
ren c:\BAREBoNE1\sources\install2.wim install.wim

echo IMAGE COMPLETED. CONTINUING WITH: boot.wim...
timeout /t 2 /nobreak > nul
cls

echo MOUNTING BOOT IMAGE:
dism /mount-image /imagefile:c:\BAREBoNE1\sources\boot.wim /index:2 /mountdir:c:\scratchdir

echo LOADING REGISTRY...
reg load HKLM\zCOMPONENTS "c:\scratchdir\Windows\System32\config\COMPONENTS" >nul
reg load HKLM\zDEFAULT "c:\scratchdir\Windows\System32\config\default" >nul
reg load HKLM\zNTUSER "c:\scratchdir\Users\Default\ntuser.dat" >nul
reg load HKLM\zSOFTWARE "c:\scratchdir\Windows\System32\config\SOFTWARE" >nul
reg load HKLM\zSYSTEM "c:\scratchdir\Windows\System32\config\SYSTEM" >nul

echo BYPASSING SYSTEM REQUIREMENTS (ON THE SETUP IMAGE):
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zDEFAULT\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV1" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zNTUSER\Control Panel\UnsupportedHardwareNotificationCache" /v "SV2" /t REG_DWORD /d "0" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f >nul 2>&1
			Reg add "HKLM\zSYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f >nul 2>&1

echo OPTIMIZATION COMPLETE! 

echo UNMOUNTING REGISTRY...
reg unload HKLM\zCOMPONENTS >nul 2>&1
reg unload HKLM\zDRIVERS >nul 2>&1
reg unload HKLM\zDEFAULT >nul 2>&1
reg unload HKLM\zNTUSER >nul 2>&1
reg unload HKLM\zSCHEMA >nul 2>&1
reg unload HKLM\zSOFTWARE >nul 2>&1
reg unload HKLM\zSYSTEM >nul 2>&1

echo UNMOUNTING IMAGE...
dism /unmount-image /mountdir:c:\scratchdir /commit 
cls

echo THE BAREBoNE1 IMAGE IS NOW COMPLETED. PROCEEDING WITH THE CREATION OF THE FINAL ISO...

echo.
echo CREATING ISO IMAGE...
%~dp0oscdimg.exe -m -o -u2 -udfver102 -bootdata:2#p0,e,bc:\BAREBoNE1\boot\etfsboot.com#pEF,e,bc:\BAREBoNE1\efi\microsoft\boot\efisys.bin c:\BAREBoNE1 %~dp0BAREBoNE1.iso

echo BAREBoNE1 CREATION COMPLETED! PRESS ANY KEY TO EXIT THE SCRIPT...
pause 

echo PERFORMING CLEANUP...
rd c:\BAREBoNE1 /s /q 
rd c:\scratchdir /s /q 

exit





