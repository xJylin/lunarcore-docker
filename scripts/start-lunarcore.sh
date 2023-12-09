#!/bin/bash
INSTALL_PATH="/app"

cd /home/lunarcore
if [ -f "$INSTALL_PATH/.initialized" ]; then
   source update-config.sh
else
   source initial-setup.sh
   cd /home/lunarcore
   source update-config.sh
   touch $INSTALL_PATH/.initialized
fi
echo -e "\033[0;32mLaunching LunarCore...\033[0m"
cd $INSTALL_PATH/LunarCore
java -jar LunarCore.jar
echo "Exit Code: $?"
