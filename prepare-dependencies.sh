#!/bin/bash

# Detect the operating system
OS=$(uname -s)

# Function to install dependencies on macOS using Homebrew
install_dependencies_mac() {
    brew install librtlsdr
    brew install libbladerf
    brew install hackrf
    brew install pkg-config
}

# Function to install dependencies on Debian-based Linux
install_dependencies_debian() {
    sudo apt-get update
    sudo apt-get install -y build-essential fakeroot debhelper librtlsdr-dev pkg-config \
                            libncurses5-dev libbladerf-dev libhackrf-dev liblimesuite-dev \
                            libsoapysdr-dev
}

# Function to install dependencies on FreeBSD
install_dependencies_freebsd() {
    pkg install -y gmake pkgconf rtl-sdr bladerf hackrf
}

prepare_build() {
    local distro=$1

    case $distro in
        "bullseye" | "buster" | "stretch")
            ./prepare-build.sh $distro
            cd package-$distro
            dpkg-buildpackage -b --no-sign
            ;;
        *)
            echo "skipping: $distro"
            ;;
    esac
}

# entrypoint
if [ "$OS" == "Darwin" ]; then
    # Darwin steps
    install_dependencies_mac
elif [ "$OS" == "Linux" ]; then
    # Linux steps
    DISTRO=$(lsb_release -c | awk '{print $2}')
    install_dependencies_debian
    prepare_build $DISTRO
elif [ "$OS" == "FreeBSD" ]; then
    # FreeBSD steps
    install_dependencies_freebsd
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

exit 0
