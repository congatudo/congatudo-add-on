![image](readme.png)

Valetudo aims to be a vendor-agnostic abstraction and cloud replacement for Cecotec vacuum robots.

The main goal of Valetudo is to disable all cloud connectivity and instead provide controls via a
**mobile-friendly webinterface** as well as **MQTT** connectivity which also supports **Home Assistant Autodiscovery**.

For more information, check out the [Valetudo Newcomer Guide Early 2021 Edition](https://valetudo.cloud/pages/general/newcomer_guide_early_2021.html) as well
as the docs in general at [https://valetudo.cloud](https://valetudo.cloud)

### Screenshots:
To do it work, just follow:
1. Install the addon
2. Start the addon
3. SSH to your conga (follow this instruction to overpass the root password [here](https://gitlab.com/freeconga/stuff/-/blob/master/docs/rooting-conga.md))
    - `ssh root@192.168.X.Y`
    - Edit the hosts file: 
        ```bash
        $> echo "<your home assistant ip> cecotec.das.3irobotix.net cecotec.download.3irobotix.net cecotec.log.3irobotix.net cecotec.ota.3irobotix.net eu.das.3irobotics.net eu.log.3irobotics.net eu.ota.3irobotics.net" >> /etc/hosts
        $> /etc/init.d/valetudo enable
        $> reboot
        ```
4. Open its web UI
    - Under Settings/MQTT be sure it is pointing to your mqtt server. Be sure home assistant autodiscovery is enabled


### Screenshots:
![image](https://user-images.githubusercontent.com/974410/55658091-bc0f3880-57fc-11e9-8840-3e88186d5f56.png)
![image](https://user-images.githubusercontent.com/974410/83152218-d9d4e680-a0fd-11ea-8019-88315d80c8b9.png)

### Join the Discussion
* [Oficial Valetudo Telegram group](https://t.me/joinchat/RdqOmVgwlck1M2Iy)
* [Valetudo Telegram Cecotec Conga group](https://t.me/freeconga)
* \#valetudo on irc.libera.chat

### Resources
* [Freeconga project](https://freecon.ga/) - Projects under develop for Cecotec Conga vacuum
* [Lovelace Valetudo Map Card](https://github.com/TheLastProject/lovelace-valetudo-map-card) - Map card for Home Assistant
* [I can't believe it's not Valetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) - A companion service for PNG Maps
* [Valeronoi](https://github.com/ccoors/Valeronoi) - A companion app for generating WiFi Heatmaps