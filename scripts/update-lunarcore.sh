#!/bin/bash
# Updates LunarCore
#


source $INSTALL_PATH/set-env.sh

is_lunarcore_binary_up_to_date() {
   cd $INSTALL_PATH/LunarCore
   latest_release=$(git describe --tags $(git rev-list --tags --max-count=1))
   [ "$latest_release" = "$LUNARCORE_RELEASE" ]
}

is_repo_up_to_date() {
   cd $1
   local_commit=$(git rev-parse HEAD)
   remote_branch=$(git rev-parse --abbrev-ref @{u} | sed 's/\// /g')
   remote_commit=$(git ls-remote $remote_branch | cut -f1)

   [ "$local_commit" = "$remote_commit" ]
}

update_lunarcore_binary() {
   cd $INSTALL_PATH/LunarCore
   latest_release=$(git describe --tags $(git rev-list --tags --max-count=1))
   wget "$URL_GIT_LUNARCORE/releases/download/$latest_release/LunarCore.jar" -P $INSTALL_PATH/LunarCore -O LunarCore.jar
   sed -i "/^export LUNARCORE_RELEASE=/c\export LUNARCORE_RELEASE=$latest_release" $INSTALL_PATH/set-env.sh
}

update_repo() {
   cd $1
   git pull origin main
}

recompile_lunarcore_binary() {
  cd $INSTALL_PATH/LunarCore
  ./gradlew jar
}



#Update LunarCore
if ! is_repo_up_to_date "$INSTALL_PATH/LunarCore"; then
    echo -e "\033[0;35mLunarCore repository is not up to date - Updating repository...\033[0m"
    update_repo "$INSTALL_PATH/LunarCore"
    if [ "$COMPILE_LUNARCORE" = true ]; then
        echo -e "\033[0;35mRebuilding LunarCore.jar...\033[0m"
        recompile_lunarcore_binary
    fi
else
    echo -e "\033[0;35mLunarCore repository is up to date.\033[0m"
fi

#Update StarRailData
if ! is_repo_up_to_date "$INSTALL_PATH/StarRailData"; then
    echo -e "\033[0;35mStarRailData repository is not up to date - Updating repository...\033[0m"
    update_repo "$INSTALL_PATH/StarRailData"
    echo -e "\033[0;35mCopying StarRailData to LunarCore/resources...\033[0m"
    cp -fR $INSTALL_PATH/StarRailData/* $INSTALL_PATH/LunarCore/resources
else
    echo -e "\033[0;35mStarRailData repository is up to date.\033[0m"
fi

#Update StarRailConfigs
if ! is_repo_up_to_date "$INSTALL_PATH/LunarCoreConfigs"; then
    echo -e "\033[0;35mLunarCoreConfigs repository is not up to date - Updating repository...\033[0m"
    update_repo "$INSTALL_PATH/LunarCoreConfigs"
    echo -e "\033[0;35mCopying LunarCoreConfigs to LunarCore/resources...\033[0m"
    cp -fR $INSTALL_PATH/LunarCoreConfigs/* $INSTALL_PATH/LunarCore/resources
else
    echo -e "\033[0;35mLunarCoreConfigs repository is up to date.\033[0m"
fi


#Update precompiled binary
if [ "$COMPILE_LUNARCORE" = false ]; then
    if ! is_lunarcore_binary_up_to_date; then
       echo -e "\033[0;35mBinary is not up to date - Updating binary...\033[0m"
       update_lunarcore_binary
    else
       echo -e "\033[0;35mBinary is up to date.\033[0m"
    fi
fi
