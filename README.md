# LunarCore-Docker
Containerized variant to run [LunarCore](https://github.com/Melledy/LunarCore)

## Environment Variables
| Name  | Description | Datatype | Example | Default
| ------------- | ------------- | ------------- | ------------- | ------------- |
| USE_SSL  | Enables/Disables SSL | Boolean |||
| KEYSTORE_PATH  | Path to the keystore file | String |||
| KEYSTORE_PW  | Password for the keystore | String |||
| PUBLIC_ADDRESS  | Public address or hostname | String |||
| PUBLIC_PORT_DISPATCHER  | Port for the Dispatcher | Integer |||
| PUBLIC_PORT_GAMESERVER  | Port for the Gameserver | Integer |||
| MONGO_DB_URI  || String ||
| MONGO_DB_USE_INTERNAL  || Boolean ||
| COMPILE_LUNARCORE  || Boolean ||
| GAMESERVER_NAME  || String ||
| GAMESERVER_DESC  || String ||
| AUTO_CREATE_ACCOUNT  || Boolean ||
| SPEND_STAMINA  || Boolean ||
| UNLOCK_ALL_CHALLENGES  || Boolean ||
| STAMINA_RECOVERY_RATE  || Integer ||
| STAMINA_RESERVE_RECOVERY_RATE  || Integer ||
| LANGUAGE  || String ||
| PUID  || Integer | 1000 | 1000 |
| PGID  || Integer | 1000 | 1000 |
