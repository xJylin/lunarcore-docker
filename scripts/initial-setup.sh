#!/bin/bash
# Initial download and setup of LunarCore.
#

echo -e "\033[0;35mStarting initial setup\033[0m"

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
   echo -e "\033[0;35mDownloading latest LunarCore binary...\033[0m"
   cd $INSTALL_PATH/LunarCore
   LUNARCORE_RELEASE=$(git describe --tags $(git rev-list --tags --max-count=1))
   echo "export LUNARCORE_RELEASE=$LUNARCORE_RELEASE" >> $INSTALL_PATH/set-env.sh
   wget "$URL_GIT_LUNARCORE/releases/download/$LUNARCORE_RELEASE/LunarCore.jar" -P $INSTALL_PATH/LunarCore -O LunarCore.jar
fi

echo -e "\033[0;35mCreating LunarCore/resources directory...\033[0m"
mkdir -p $INSTALL_PATH/LunarCore/resources

echo -e "\033[0;35mCopying StarRailData to LunarCore/resources...\033[0m"
cp -fR $INSTALL_PATH/StarRailData/* $INSTALL_PATH/LunarCore/resources

echo -e "\033[0;35mCopying LunarCoreConfigs to LunarCore/resources...\033[0m"
cp -fR $INSTALL_PATH/LunarCoreConfigs/* $INSTALL_PATH/LunarCore/resources

echo -e "\033[0;35mCleaning up LunarCore/resources...\033[0m"
rm -fr $INSTALL_PATH/LunarCore/resources/README.md

echo -e "\033[0;35mLaunching LunarCore to generate config.json...\033[0m"
cd $INSTALL_PATH/LunarCore
screen -d -m java -jar LunarCore.jar
sleep 1
PID=$(ps -ef | pgrep -fx "java -jar LunarCore.jar")
sudo kill -15 $PID
