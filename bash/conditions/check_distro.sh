#!/bin/bash




GetDistro



function GetDistro() {
    GetOSVersion
        if [[ "$os_VENDOR" =~ (Ubuntu) ]]; then
              DISTRO=$os_CODENAME
        elif [[ "$os_VENDOR" =~ (Fedora) ]]; then
              DISTRO="f$os_RELEASE"
        else
              DISTRO="$os_VENDOR-$os_RELEASE.$os_UPDATE"
        fi
             export DISTRO
}




if [[ ! ${DISTRO} =~ (oneiric|precise|quantal|f16|f17) ]]; then
        echo "WARNING: this script has not been tested on $DISTRO"
            if [[ "$FORCE" != "yes" ]]; then
                        echo "If you wish to run this script anyway run with FORCE=yes"
                                exit 1
                                    fi
                                fi

