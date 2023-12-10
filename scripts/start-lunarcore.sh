#!/bin/bash
HOME=~lunarcore
source $INSTALL_PATH/set-env.sh

cd /home/lunarcore
if [ "$INITIALIZED" = true ]; then
   source update-config.sh
else
   source initial-setup.sh
   cd /home/lunarcore
   source update-config.sh
   echo "export INITIALIZED=true" >> $INSTALL_PATH/set-env.sh

fi
echo -e "\033[0;32mLaunching LunarCore...\033[0m"
cd $INSTALL_PATH/LunarCore
java -jar LunarCore.jar
echo "Exit Code: $?"
