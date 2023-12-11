#!/bin/bash
# Updates config.json with ENV variable values if they are set.
#

echo -e "\033[0;35mUpdating config.json...\033[0m"
cd $INSTALL_PATH/LunarCore

lunarCoreConfig=$(<config.json)

#DATABASE
if [ -n "$MONGO_DB_URI" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".accountDatabase.uri = \"$MONGO_DB_URI\""); fi
if [ -n "$MONGO_DB_USE_INTERNAL" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".accountDatabase.useInternal = $MONGO_DB_USE_INTERNAL"); fi
if [ -n "$MONGO_DB_URI" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".gameDatabase.uri = \"$MONGO_DB_URI\""); fi
if [ -n "$MONGO_DB_USE_INTERNAL" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".gameDatabase.useInternal = $MONGO_DB_USE_INTERNAL"); fi

#DISPATCHER
if [ -n "$USE_SSL" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".httpServer.useSSL = $USE_SSL"); fi
if [ -n "$PUBLIC_PORT_DISPATCHER" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".httpServer.publicPort = $PUBLIC_PORT_DISPATCHER"); fi
if [ -n "$PUBLIC_ADDRESS" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".httpServer.publicAddress = \"$PUBLIC_ADDRESS\""); fi
if [ -n "$KEYSTORE_PATH" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".keystore.path = \"$KEYSTORE_PATH\""); fi
if [ -n "$KEYSTORE_PW" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".keystore.password = \"$KEYSTORE_PW\""); fi

#GAMESERVER
if [ -n "$GAMESERVER_NAME" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".gameServer.name = \"$GAMESERVER_NAME\""); fi
if [ -n "$GAMESERVER_DESC" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".gameServer.description = \"$GAMESERVER_DESC\""); fi
if [ -n "$PUBLIC_ADDRESS" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".gameServer.publicAddress = \"$PUBLIC_ADDRESS\""); fi
if [ -n "$PUBLIC_PORT_GAMESERVER" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".gameServer.publicPort = $PUBLIC_PORT_GAMESERVER"); fi

#SERVER SETTINGS
if [ -n "$AUTO_CREATE_ACCOUNT" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.autoCreateAccount = $AUTO_CREATE_ACCOUNT"); fi
if [ -n "$SPEND_STAMINA" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.spendStamina = $SPEND_STAMINA"); fi
if [ -n "$UNLOCK_ALL_CHALLENGES" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.unlockAllChallenges = $UNLOCK_ALL_CHALLENGES"); fi
if [ -n "$START_TRAILBLAZER_LEVEL" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.startTrailblazerLevel = $START_TRAILBLAZER_LEVEL"); fi
if [ -n "$AUTO_UPGRADE_WORLD_LEVEL" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.autoUpgradeWorldLevel = $AUTO_UPGRADE_WORLD_LEVEL"); fi
if [ -n "$STAMINA_RECOVERY_RATE" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.staminaRecoveryRate = $STAMINA_RECOVERY_RATE"); fi
if [ -n "$STAMINA_RESERVE_RECOVERY_RATE" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.staminaReserveRecoveryRate = $STAMINA_RESERVE_RECOVERY_RATE"); fi
if [ -n "$LANGUAGE" ]; then lunarCoreConfig=$(echo $lunarCoreConfig | jq ".serverOptions.language = \"$LANGUAGE\""); fi

echo $lunarCoreConfig | jq > config.json

