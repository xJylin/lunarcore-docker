# LunarCore-Docker
Containerized variant to run [LunarCore](https://github.com/Melledy/LunarCore)

## Environment Variables
The following variables can be passed to the container using the parameter -e <br>
If they are set their respective values will be overwritten in the config.json file. This happens at every container start. <br>
If you want to manually adjust certain values in the config.json - **do not** set them as environment variables or your changes will be overwritten.

Example: -e GAMESERVER_NAME="My Server"


| Name  | Description | Datatype | Example | Default
| ------------- | ------------- | ------------- | ------------- | ------------- |
| USE_SSL | Enables/Disables SSL | Boolean | true | undefined
| KEYSTORE_PATH  | Path to the keystore file | String | ./keystore.p12 | undefined
| KEYSTORE_PW  | Password for the keystore | String | lunar | undefined
| PUBLIC_ADDRESS  | Public address or hostname | String | 127.0.0.1 | undefined
| PUBLIC_PORT_DISPATCHER  | Port for the Dispatcher | Integer | 443 | undefined
| PUBLIC_PORT_GAMESERVER  | Port for the Gameserver | Integer | 23301 | undefined
| MONGO_DB_URI  || String | mongodb://localhost:27017 | undefined
| MONGO_DB_USE_INTERNAL  | true = use internal db <br false = use external db | Boolean | true | undefined
| COMPILE_LUNARCORE  | true = download and compile latest version from source <br> false = download latest precompiled binary | Boolean | true | undefined
| GAMESERVER_NAME  | Name of the Server | String | My Server | undefined
| GAMESERVER_DESC  | Description of the server | String | My Description | undefined
| AUTO_CREATE_ACCOUNT  | Automatically create new accounts on login | Boolean | true | undefined
| SPEND_STAMINA  | Enables/Disables stamina consumption | Boolean | true | undefined
| UNLOCK_ALL_CHALLENGES  | I dont even fucking know | Boolean | true | undefined
| STAMINA_RECOVERY_RATE  | Rate at which stamina is recovered | Integer | true | undefined
| STAMINA_RESERVE_RECOVERY_RATE  | Rate at which stamina reserve is recovered | Integer | true | undefined
| LANGUAGE  | Sets server language | String | EN | undefined
| PUID  | User ID for the internal container user | Integer | 1000 | 1000 
| PGID  | Group ID for the internal container user group | Integer | 1000 | 1000 
