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
rpm-ostree install java-17-openjdk dotnet-runtime-9.0

# IME packages
rpm-ostree install fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-mozc fcitx5-autostart imsettings im-chooser

#### Example for enabling a System Unit File

systemctl enable podman.socket
