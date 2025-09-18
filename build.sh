#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# install for CPU/GPU power control
rpm-ostree install corectrl

# install VM runtimes and SDK things
rpm-ostree install java-latest-openjdk dotnet-sdk-8.0 dotnet-sdk-9.0 nodejs

# IME packages (Japanese language input)
#rpm-ostree install fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-mozc fcitx5-autostart imsettings im-chooser

# Tools

rpm-ostree install graphviz

## VS Codium

# rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# rpm-ostree install codium

# rpm-ostree install libappindicator-gtk3 libappindicator netbird-ui

#### Example for enabling a System Unit File

systemctl enable podman.socket
