#!/bin/bash
INSTALL_PATH="/app"


if ! id "lunarcore" >/dev/null 2>&1; then
   groupadd -g $PGID lunarcore
   useradd -u $PUID -g $PGID -ms /bin/bash lunarcore
   usermod -aG sudo lunarcore
   echo 'lunarcore ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
   chown -R $PUID:$PGID /app
   mv /root/initial-setup.sh /home/lunarcore/initial-setup.sh
   mv /root/update-config.sh /home/lunarcore/update-config.sh
   mv /root/start-lunarcore.sh /home/lunarcore/start-lunarcore.sh
   chown $PUID:$PGID /home/lunarcore/initial-setup.sh
   chown $PUID:$PGID /home/lunarcore/update-config.sh
   chown $PUID:$PGID /home/lunarcore/start-lunarcore.sh
fi

sudo -E -u lunarcore bash /home/lunarcore/start-lunarcore.sh
