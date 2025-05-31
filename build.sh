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

# install VM runtimes
rpm-ostree install java-latest-openjdk dotnet-runtime-8.0 dotnet-runtime-9.0

# IME packages (Japanese language input)
#rpm-ostree install fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-mozc fcitx5-autostart imsettings im-chooser

# Tools
rpm-ostree install graphviz

# netbird VPN
tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=0
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

rpm-ostree install libappindicator-gtk3 libappindicator netbird-ui

#### Example for enabling a System Unit File

systemctl enable podman.socket
