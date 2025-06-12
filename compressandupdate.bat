@echo off
setlocal

:: Variablen setzen
set "MOD_ITEM_ID=3023536687"
set "MOD_FOLDER=creativemode"
set "OUTPUT_ZIP=CreativeMode.zip"

:: Dateien komprimieren
powershell -Command "Compress-Archive -Path '%MOD_FOLDER%\*' -DestinationPath '%OUTPUT_ZIP%' -Force"

:: Mod hochladen
DesyncedModUploader.exe -u %MOD_ITEM_ID% %OUTPUT_ZIP%

echo Fertig!
endlocal
