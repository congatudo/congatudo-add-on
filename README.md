<div align="center">
    <img src="https://github.com/congatudo/congatudo-add-on/blob/main/images/logo.png?raw=true" alt="congatudo">
    <p align="center"><h2>Free your vacuum from the cloud</h2></p>
</div>

 [Congatudo](https://github.com/congatudo/Congatudo) add-on aims to be a vendor-agnostic abstraction and cloud replacement for Cecotec Conga vacuum robots
For more information, check out the [repository](https://github.com/congatudo/Congatudo)


## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [How it Works](#2-how-it-works)
3. [Installation](#3-installation)
4. [Connect your robot](#4-connect-your-robot)
5. [Beta Add-on for Multiple Robots](#5-beta-addon-for-multiple-robots)
6. [Navigate and Edit sysConfig.ini](#6-navigate-and-edit-sysconfigini)
7. [Expected Log Output](#7-expected-log-output)
8. [Running Multiple Instances](8-running-multiple-instances)
9. [Screenshots](#9-screenshots)
10. [Resources](#10-resources)



##
## **1. Prerequisites**
- Basic knowledge of the Congatudo project.
- Root access to your Conga robot via [SSH or ADB](https://github.com/congatudo/Congatudo/tree/master#get-root-access-in-your-conga).
- A Windows computer (anything from the last 15 years is good enough.)
- Have already installed and running a MQTT server resource. (preferably Mosquitto broker addon)
This add-on is automatically configured if you have a MQTT service in Home Assistant.
- A little basic knowlege of Linux systems will help.
##  
## **2. How it Works**
- The add-on adds a file named `valetudo.json` in the `/config` directory of your HA installation.
- One instance of the add-on will control a single robot.
- You can install both the main add-on and the beta add-on simultaneously.
- Each addon will operate independently, allowing you to integrate multiple Conga robots into Home Assistant.

##
## **3. Installation**

1. Click the button below to install this repository:
2. Click on the new add-on named "Valetudo"
3. Click `Install` on the addon page
4. Click `Start` and then `Open Web UI` to confirm everything is ok
5. Configure your Conga robot's credentials and network parameters.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/congatudo/congatudo-add-on)



##
## **4. Connect your robot**

Now you need to connect your robot to your add-on.

1. Ensure your Conga is connected to your WiFi
2. Access your Conga through SSH (follow this instruction to overpass the root password [here](https://github.com/congatudo/stuff/blob/master/docs/rooting-conga.md))
3. Edit the hosts file in the robot with your home assistant ip and reboot:
    ```bash
    $ echo "<your_home_assistant_ip> cecotec.das.3irobotix.net cecotec.download.3irobotix.net cecotec.log.3irobotix.net cecotec.ota.3irobotix.net eu.das.3irobotics.net eu.log.3irobotics.net eu.ota.3irobotics.net cecotec-das.3irobotix.net cecotec-log.3irobotix.net cecotec-upgrade.3irobotix.net cecotec-download.3irobotix.net" >> /etc/hosts
    $ reboot
    ```
4. Check the add-on logs to see if the robot is registered and you are done.
   - Enable `Show in sidebar`.
   - Click `Start` to start the addon.

##
5. 🎉 At this point you have sucessfully set up the HA addon and robot.
##

##
##
## **5. Beta Addon for Multiple Robots**

If you have more than one Conga robot and need to control each one independently, you can use the beta add-on. This allows you to install a second instances of the add-on, with each instance controlling a separate robot.

1. Search for the CongaTudo Beta add-on in the Add-on Store.
2. Install the beta add-on.
3. Configure the add-on with the credentials of your second Conga robot.
   - `server_cmd_port=4011`
   - `server_map_port=4031`
   - `server_sync_time_port=4051`
4. In the **Info** tab:
   - Enable `Show in sidebar`.
   - Click `Start` to start the addon.

5. Now you have to configure the conga robot before you can use the beta addon.

##
## **6. Navigate and Edit `sysConfig.ini`**

1. Via SSH or WinSCP Navigate to `/etc/sysconf` and open `sysConfig.ini`.
2. Locate and modify the following lines:
   ```ini
   server_cmd_address=cecotec.das.3irobotix.net
   server_map_address=cecotec.das.3irobotix.net
   server_log_address=cecotec.log.3irobotix.net
   server_ota_address=cecotec.ota.3irobotix.net
   server_down_address=cecotec.download.3irobotix.net

   server_cmd_port=4010
   server_map_port=4030
   server_sync_time_port=4050
   ```
3. Then replace `cecotec.xxxxx.3irobotix.net` with the IP address of your HA and set the ports to match the configuration in the beta addon :

   ```ini
   server_cmd_address=192.168.1.10
   server_map_address=192.168.1.10
   server_log_address=192.168.1.10
   server_ota_address=192.168.1.10
   server_down_address=192.168.1.10

   server_cmd_port=4011
   server_map_port=4031
   server_sync_time_port=4051
   ```
4. Save, close the file and restart the robot.
   ```bash
   $ reboot
   ```
##
## **7. Expected Log Output**
If everything was configured correctly, you should see logs similar to the following in the Log tab:
```pgsql
[2023-12-26T16:48:33.108Z] [INFO] Webserver running on port 8080
[2023-12-26T16:48:33.560Z] [INFO] Connected successfully to MQTT broker
[2023-12-26T16:48:34.031Z] [INFO] MQTT configured
[2023-12-26T16:48:34.707Z] [INFO] Added new robot with id 'xxxxx'
```


##
## *8. Running Multiple Instances*
Each add-on will show up as a separate entity in Home Assistant. You can configure and control each one independently.
Example:
- Congatudo Addon: Controls Robot A
- Congatudo (beta) Addon: Controls Robot B



##
## **9. Screenshots**



![image](https://github.com/user-attachments/assets/5605249d-5c3d-4f15-856e-8ab7544b9410)

![image](https://github.com/user-attachments/assets/d6da74cd-7226-47f9-90ab-415ec9ccdeb6)
![image](https://github.com/user-attachments/assets/7e13ac7c-11a3-4d2e-ab80-fdee42e8bb21)

![image](https://github.com/congatudo/congatudo-add-on/blob/main/images/MainMenu.png?raw=true)
![image](https://github.com/congatudo/congatudo-add-on/blob/main/images/map.png?raw=true)

[//]: # (### Join the Discussion)

[//]: # ( Oficial Valetudo Telegram group https://t.me/joinchat/RdqOmVgwlck1M2Iy)
[//]: # ( Valetudo Telegram Cecotec Conga group https://t.me/congatudo)

##
## *10. Resources*

* [Congatudo project](https://gitlab.com/congatudo) - Projects under develop for Cecotec Conga vacuum
* [Lovelace Valetudo Map Card](https://github.com/TheLastProject/lovelace-valetudo-map-card) - Map card for Home Assistant
* [I can't believe it's not Valetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) - A companion service for PNG Maps
* [Setting up Beta addon using WinSCP on a windows machine](https://github.com/Nismonx/conga-multiple-robots/tree/main) - This guide will help you with the file configuration in you robot using WinSCP
