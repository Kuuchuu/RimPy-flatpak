# RimPy | Flatpak'd
Mod Manager for Rimworld by [Rimpy-Custom](https://github.com/rimpy-custom) all bundled up into a Flatpak.

----

### Install

There are two installation methods:

 1.  - Download [prebuilt Flatpak](https://github.com/Kuuchuu/RimPy-flatpak/releases/download/1.2.6.29/rimpy.1.2.6.29.flatpak) from Releases `wget https://github.com/Kuuchuu/RimPy-flatpak/releases/download/1.2.6.29/rimpy.1.2.6.29.flatpak`
     - Install the Flatpak `flatpak install rimpy.1.2.6.29.flatpak`

 3. Follow instructions in <b>Build</b> section below.

----

### Build

##### Dependencies:

 - git
 - flatpak
 - flatpak-builder

Debian/Ubuntu/Mint

 - `sudo apt update`
 - `sudo apt install git flatpak flatpak-builder`

Solus

 - `sudo eopkg it git flatpak-builder`

Fedora/RHEL/CentOS

 - `sudo dnf install git flatpak flatpak-builder`
 - `# sudo dnf install epel-release # EPEL repository may need enabled on RHEL/CentOS`

Void Linux

 - `sudo xbps-install -Su git flatpak flatpak-builder`

##### Steps:

 1. `git clone https://github.com/Kuuchuu/RimPy-flatpak.git`
 2. `cd RimPy-flatpak`
 3. `./build.sh`

----