<div align="center">
    <img src="https://github.com/congatudo/congatudo-add-on/blob/main/images/logo.png?raw=true" alt="congatudo">
    <p align="center"><h2>Free your vacuum from the cloud</h2></p>
</div>

[Congatudo](https://github.com/congatudo/Congatudo) add-on aims to be a vendor-agnostic abstraction and cloud replacement for Cecotec Conga vacuum robots

For more information, check out the [repository](https://github.com/congatudo/Congatudo)

### Installation

1. Click the button below to install this repository:

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/congatudo/congatudo-add-on)

1. Click on the new add-on named "Valetudo"
2. Click `Install` on the add-on page
3. Click `Start` and then `Open Web UI` to confirm everything is ok

### Requirements
Have already installed and running a MQTT server resource.
This add-on is automatically configured if you have a MQTT service in Home Assistant.

### Configuration

The add-on adds a file named `valetudo.json` in the `/config` directory of your HA installation.

### Connect your robot

Now you need to connect your robot to your add-on.

1. Ensure your Conga is connected to your WiFi
2. Access your Conga through SSH (follow this instruction to overpass the root password [here](https://github.com/congatudo/stuff/blob/master/docs/rooting-conga.md))
3. Edit the hosts file in the robot with your home assistant ip and reboot:
    ```bash
    $ echo "<your home assistant ip> cecotec.das.3irobotix.net cecotec.download.3irobotix.net cecotec.log.3irobotix.net cecotec.ota.3irobotix.net eu.das.3irobotics.net eu.log.3irobotics.net eu.ota.3irobotics.net cecotec-das.3irobotix.net cecotec-log.3irobotix.net cecotec-upgrade.3irobotix.net cecotec-download.3irobotix.net" >> /etc/hosts
    $ reboot
    ```
4. Check the add-on logs to see if the robot is registered 

### Screenshots

![image](https://github.com/congatudo/congatudo-add-on/blob/main/images/MainMenu.png?raw=true)
![image](https://github.com/congatudo/congatudo-add-on/blob/main/images/map.png?raw=true)

[//]: # (### Join the Discussion)

[//]: # ( Oficial Valetudo Telegram group https://t.me/joinchat/RdqOmVgwlck1M2Iy)
[//]: # ( Valetudo Telegram Cecotec Conga group https://t.me/congatudo)

### Resources

* [Congatudo project](https://gitlab.com/congatudo) - Projects under develop for Cecotec Conga vacuum
* [Lovelace Valetudo Map Card](https://github.com/TheLastProject/lovelace-valetudo-map-card) - Map card for Home Assistant
* [I can't believe it's not Valetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) - A companion service for PNG Maps
