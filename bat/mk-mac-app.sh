#!/bin/bash
#
################################################################################
#
# NAME                            : mkshellapp
# CREATOR                         : yamaq
# FINAL UPDATE                    : 20190217115012
# VERSION                         : 1.0.5
#
################################################################################
### VARIABLES
################################################################################

# set -x

################################################################################
### MAIN
#################################################################################


ret=$(osascript -e '
    display dialog "作成するアプリの名称を入力" buttons {"Abort", "OK"} default button 2 default answer "Myapp"
') >/dev/null 2>&1
pressedButton=$(echo $ret | awk '{print $2}' | awk -F ':' '{print $2}' | tr -d \,)
if [ $pressedButton = "Abort" ]; then
    exit 1
fi
appName=$(echo $ret | awk '{print $4}' | awk -F ':' '{print $2}')
appName="${appName}.app"

sourceFilePath=$(osascript -e '
    tell application "Finder"
        activate
        POSIX path of (choose file with prompt "スクリプトファイルの選択")
    end tell
' 2>/dev/null)
if [ $? -ne 0 ]; then
    exit 2
fi

iconFilePath=$(osascript -e '
    tell application "Finder"
        activate
        POSIX path of (choose file with prompt "アイコンファイルの選択")
    end tell
' 2>/dev/null)
if [ $? -ne 0 ]; then
    exit 3
fi

ret=$(osascript -e '
    display dialog "作成するアプリのバージョンを入力" buttons {"Abort", "OK"} default button 2 default answer "1.0.0"
') >/dev/null 2>&1
pressedButton=$(echo $ret | awk '{print $2}' | awk -F ':' '{print $2}' | tr -d \,)
if [ $pressedButton = "Abort" ]; then
    exit 4
fi
versionNum=$(echo $ret | awk '{print $4}' | awk -F ':' '{print $2}')

cd ${HOME}/Desktop
if [ -e "${appName}" ]; then
    rm -rf "${appName}"
fi
mkdir -p "${appName}"/Contents/MacOS
mkdir -p "${appName}"/Contents/Resources

if [ -x "$sourceFilePath" ]; then
    cp -p "$sourceFilePath" "${appName}"/Contents/MacOS
    cp -p "$iconFilePath" "${appName}"/Contents/Resources
else
    echo "Error: $sourceFilePath is not found or not executable." 2>&1
    exit 5
fi

cat << EOF > "${appName}"/Contents/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>CFBundleIconFile</key>
        <string>$(basename "$iconFilePath")</string>
        <key>CFBundleExecutable</key>
        <string>$(basename "$sourceFilePath")</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleSignature</key>
        <string>YMQQ</string>
        <key>CFBundleShortVersionString</key>
        <string>$(basename "$versionNum")</string>
    </dict>
</plist>
EOF

osascript -e '
    on run argv
        tell application "Finder"
            activate
            display dialog (argv) buttons {"OK"} default button 1
        end tell
    end run
' "アプリが作成できました。" >/dev/null 2>&1



################################################################################
############################################################ END OF THE CODE ###
################################################################################
