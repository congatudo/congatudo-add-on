<div align="center">
    <img src="https://github.com/txitxo0/valetudo4conga-addon/blob/main/images/valetudo_logo_with_name.svg?raw=true" width="800" alt="valetudo">
    <p align="center"><h2>Free your vacuum from the cloud</h2></p>
</div>

Valetudo aims to be a vendor-agnostic abstraction and cloud replacement for vacuum robots.

The main goal of Valetudo is to disable all cloud connectivity and instead provide controls via a
**mobile-friendly webinterface** as well as **MQTT** connectivity which also supports **Home Assistant Autodiscovery**.

For more information, check out the [Valetudo Newcomer Guide Early 2021 Edition](https://valetudo.cloud/pages/general/newcomer_guide_early_2021.html) as well
as the docs in general at [https://valetudo.cloud](https://valetudo.cloud)

### Installation

1. Click the button below to install this repository:

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ftxitxo0%2Fvaletudo4conga-addon)

2. Click on the new add-on named "Valetudo for Conga"
3. Click `Install` on the add-on page
4. Click `Start` and then `Open Web UI` to confirm everything is ok
5. Under `Settings / MQTT` be sure it is pointing to your mqtt broker and that home assistant autodiscovery is enabled

### Configuration

The add-on adds a file named `valetudo.json` in the `/config` directory of your HA installation.

1. Open the file `/config/valetudo.json`
2. Change the robot implementation to Conga:

    ```json
    {
      "robot": {
        "implementation": "CecotecCongaRobot"
      }
    }
    ```

### Connect your robot

Now you need to connect your robot to your add-on.

1. Ensure your Conga is connected to your WiFi
2. Access your Conga through SSH (follow this instruction to overpass the root password [here](https://gitlab.com/freeconga/stuff/-/blob/master/docs/rooting-conga.md))
3. Edit the hosts file in the robot with your home assistant ip and reboot:

    ```bash
    $ echo "<your home assistant ip> cecotec.das.3irobotix.net cecotec.download.3irobotix.net cecotec.log.3irobotix.net cecotec.ota.3irobotix.net eu.das.3irobotics.net eu.log.3irobotics.net eu.ota.3irobotics.net" >> /etc/hosts
    $ reboot
    ```

4. Check the add-on logs to see if the robot is registered

### Screenshots

![image](https://user-images.githubusercontent.com/974410/55658091-bc0f3880-57fc-11e9-8840-3e88186d5f56.png)
![image](https://user-images.githubusercontent.com/974410/83152218-d9d4e680-a0fd-11ea-8019-88315d80c8b9.png)

### Join the Discussion

* [Oficial Valetudo Telegram group](https://t.me/joinchat/RdqOmVgwlck1M2Iy)
* [Valetudo Telegram Cecotec Conga group](https://t.me/freeconga)

### Resources

* [FreeConga project](https://freecon.ga/) - Projects under develop for Cecotec Conga vacuum
* [Lovelace Valetudo Map Card](https://github.com/TheLastProject/lovelace-valetudo-map-card) - Map card for Home Assistant
* [I can't believe it's not Valetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) - A companion service for PNG Maps
