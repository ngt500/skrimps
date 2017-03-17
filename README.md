# skrimps
OS X Privacy Conscious Skript. Skrimps features many advanced commands that users use to configure the OS X environment.
The Goal of Skrimps is to disable unnecessary hardware, networking and application preference settings.
Currently works in **OSX El Capitan**

## Features
Networking:
Enables Firewall, logging and stealth mode
Disables Location Services
IPV6: disable for network devices
Disables Captive portal, Bluetooth, Infrared, Apple Remote Events, Apple Remote Login
Filevault keys destroyed on standby
Disable writing Metadata on USB and Network drives (.DS_Store)
Safari: Disables Autofill, Auto Open Safe Downloads, History, Fruadulent Website Warning, Smart Search Field, Frequent sites

## To do
Modify to support OSX Mavericks, Yosemite and Sierra

## Use at your own risk
Some of these features may be needed for certain applications to work.

**Skrimps disables Safari fraudulent website check.**
This is for privacy reasons. (All URLS are sent to google!)

## How to install
Download skrimps.sh
```bash
chmod +x skrimps.sh
```
Close open applications

Launch in Terminal

_./skrimps.sh_
