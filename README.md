# LunarCore-Docker
Basic [LunarCore](https://github.com/Melledy/LunarCore) docker container.


## Features

- Automatic download & setup
- Most important configuration setting accessible via environment variables
- Compile from [source](https://github.com/Melledy/LunarCore) or use precompiled [.jar](https://github.com/Melledy/LunarCore/tags)
- Configurable PID/GID (Hello Unraid)
- Automatic update feature

## Setup

Clone the project
```bash
  git clone https://github.com/xJylin/lunarcore-docker
```

Go to the project directory
```bash
  cd lunarcore-docker
```

Build the container
```bash
  docker build . -t lunarcore-docker
```

Run the container - **replace [] with your values**
```bash
  docker run -it -v '[HOST_PATH]:/app' -p '[HOST_PORT]:443/tcp' -p '[HOST_PORT]:23301/udp' lunarcore-docker
```

Example:
```bash
  docker run -it -v './app:/app' -e 'USE_SSL'='false' -p '443:443/tcp' -p '23301:23301/udp' lunarcore-docker
```



## Environment Variables
The following variables can be passed to the container using the parameter `-e` <br>
If they are set their respective values will be overwritten in the config.json file. This happens at every container start. <br>
If you want to manually adjust certain values in the config.json - **do not** set them as environment variables or your changes will be overwritten.

Example: `-e GAMESERVER_NAME="My Server"`


| Name  | Description | Datatype | Example | Default
| ------------- | ------------- | ------------- | ------------- | ------------- |
| `USE_SSL` | Enables/Disables SSL | `boolean` | true | undefined
| `KEYSTORE_PATH`  | Path to the keystore file | `string` | ./keystore.p12 | undefined
| `KEYSTORE_PW`  | Password for the keystore | `string` | lunar | undefined
| `PUBLIC_ADDRESS`  | Public address or hostname | `string` | 127.0.0.1 | undefined
| `PUBLIC_PORT_DISPATCHER`  | Port for the Dispatcher | `integer` | 443 | undefined
| `PUBLIC_PORT_GAMESERVER`  | Port for the Gameserver | `integer` | 23301 | undefined
| `MONGO_DB_URI`  | URI to the mongoDB server | `string` | mongodb://localhost:27017 | undefined
| `MONGO_DB_USE_INTERNAL`  | true = use internal db <br false = use external db | `boolean` | true | undefined
| `COMPILE_LUNARCORE`  | true = download and compile latest version from source <br> false = download latest precompiled binary | `boolean` | true | `false`
| `UPDATE_LUNARCORE`  | true = automatically updates LunarCore (takes `COMPILE_LUNARCORE` into account) <br> false = disables automatic updates | `boolean` | true | `true`
| `GAMESERVER_NAME`  | Name of the Server | `string` | My Server | undefined
| `GAMESERVER_DESC`  | Description of the server | `string` | My Description | undefined
| `AUTO_CREATE_ACCOUNT`  | Automatically create new accounts on login | `boolean` | true | undefined
| `SPEND_STAMINA`  | Enables/Disables stamina consumption | `boolean` | true | undefined
| `UNLOCK_ALL_CHALLENGES`  | Unlocks all challanges | `boolean` | true | undefined
| `STAMINA_RECOVERY_RATE`  | Rate at which stamina is recovered | `integer` | true | undefined
| `STAMINA_RESERVE_RECOVERY_RATE`  | Rate at which stamina reserve is recovered | `integer` | true | undefined
| `LANGUAGE`  | Sets server language | `string` | EN | undefined
| `PUID`  | User ID for the internal container user | `integer` | 1000 | `1000`
| `PGID`  | Group ID for the internal container user group | `integer` | 1000 | `1000`


## Notice
The container at the moment requires the `-it` to keep LunarCore active.
Otherwise the container will end after LunarCore finished starting up.

## Related Projects

 - [LunarCore](https://github.com/Melledy/LunarCore)
 - [StarRailData](https://github.com/Dimbreath/StarRailData)
 - [LunarCore-Configs]( https://gitlab.com/Melledy/LunarCore-Configs)


