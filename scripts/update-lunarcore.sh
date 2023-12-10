source $INSTALL_PATH/set-env.sh
cd $INSTALL_PATH/LunarCore

is_binary_up_to_date() {
   latest_release=$(git describe --tags $(git rev-list --tags --max-count=1))
   [ "$latest_release" = "$LUNARCORE_RELEASE" ]
}

is_repo_up_to_date() {
   local_commit=$(git rev-parse HEAD)
   remote_branch=$(git rev-parse --abbrev-ref @{u} | sed 's/\// /g')
   remote_commit=$(git ls-remote $remote_branch | cut -f1)

   [ "$local_commit" = "$remote_commit" ]
}

update_binary() {
   latest_release=$(git describe --tags $(git rev-list --tags --max-count=1))
   wget "$URL_GIT_LUNARCORE/releases/download/$latest_release/LunarCore.jar" -P $INSTALL_PATH/LunarCore -O LunarCore.jar
   sed -i "/^export LUNARCORE_RELEASE=/c\export LUNARCORE_RELEASE=$latest_release" $INSTALL_PATH/set-env.sh
}

update_repo() {
   git pull origin main
}

recompile_binary() {
  ./gradlew jar
}




if ! is_repo_up_to_date; then
    echo "Repository is not up to date - Updating repository..."
    update_repo
    if [ "$COMPILE_LUNARCORE" = true ]; then
        echo "Rebuilding LunarCore.jar..."
        recompile_binary
    fi
else
    echo "Repository is up to date."
fi

if [ "$COMPILE_LUNARCORE" = false ]; then
    if ! is_binary_up_to_date; then
       echo "Binary is not up to date - Updating binary..."
       update_binary
    else
       echo "Binary is up to date."
    fi
fi
