#!/bin/bash
#See https://github.com/Melledy/LunarCore

echo -e "\033[0;35mStarting initial setup\033[0m"

URL_BINARY_LUNARCORE="https://github.com/Melledy/LunarCore/releases/download/v1.0.1/LunarCore.jar"
URL_GIT_LUNARCORE="https://github.com/Melledy/LunarCore"
URL_GIT_LUNARCORECONFIGS="https://gitlab.com/Melledy/LunarCore-Configs"
URL_GIT_STARRAILDATA="https://github.com/Dimbreath/StarRailData"

echo -e "\033[0;35mDownloading resources...\033[0m"
git clone $URL_GIT_LUNARCORE "$INSTALL_PATH/LunarCore"
git clone $URL_GIT_LUNARCORECONFIGS "$INSTALL_PATH/LunarCoreConfigs"
git clone $URL_GIT_STARRAILDATA "$INSTALL_PATH/StarRailData"


if [ "$COMPILE_LUNARCORE" = true ]; then
   echo -e "\033[0;35mCompiling LunarCore...\033[0m"
   cd $INSTALL_PATH/LunarCore
   chmod +x ./gradlew
   ./gradlew jar
else
   echo -e "\033[0;35mDownloading LunarCore Binary...\033[0m"
   wget $URL_BINARY_LUNARCORE -P $INSTALL_PATH/LunarCore
fi

echo -e "\033[0;35mCreating LunarCore/resources directory...\033[0m"
mkdir -p $INSTALL_PATH/LunarCore/resources


echo -e "\033[0;35mCopying StarRailData to LunarCore/resources...\033[0m"
rm -fr $INSTALL_PATH/StarRailData/README.md
rm -fr $INSTALL_PATH/StarRailData/.git
cp -fR $INSTALL_PATH/StarRailData/* $INSTALL_PATH/LunarCore/resources
rm -fr $INSTALL_PATH/StarRailData

echo -e "\033[0;35mCopying LunarCoreConfigs to LunarCore/resources...\033[0m"
rm -fr $INSTALL_PATH/LunarCoreConfigs/.git
cp -fR $INSTALL_PATH/LunarCoreConfigs/* $INSTALL_PATH/LunarCore/resources
rm -fr $INSTALL_PATH/LunarCoreConfigs

echo -e "\033[0;35mLaunching LunarCore to generate config.json...\033[0m"
cd $INSTALL_PATH/LunarCore
screen -d -m java -jar LunarCore.jar
sleep 1
PID=$(ps -ef | pgrep -fx "java -jar LunarCore.jar")
sudo kill -9 $PID
