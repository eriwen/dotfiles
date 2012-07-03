#!/bin/bash

APP=$1

if [ -z $APP ]
then
  echo "Usage: ${0} /Applications/MyApp.app"
  exit 0
fi

read -p "Please make sure ${1} is closed. Press [Enter] to continue."

cp -R $APP $APP.bak
awk '/<dict>/{if (M==""){sub("<dict>","<dict><key>NSHighResolutionCapable<\/key><true\/>");M=1}}{print}' ${APP}.bak/Contents/Info.plist > ${APP}.bak/Contents/Info.plist.new
mv ${APP}.bak/Contents/Info.plist{.new,}

# Clear application caches
rm -rf $APP
mv $APP.bak $APP

echo "Done!"
