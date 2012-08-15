#!/bin/bash

GetOSVersion() {
   if [[ -n "`which sw_vers 2>/dev/null`" ]]; then
         os_VENDOR=`sw_vers -productName`
         os_RELEASE=`sw_vers -productVersion`
         os_UPDATE=${os_RELEASE##*.}
         os_RELEASE=${os_RELEASE%.*}
         os_PACKAGE=""
         if [[ "$os_RELEASE" =~ "10.7" ]]; then
         os_CODENAME="lion"
         elif [[ "$os_RELEASE" =~ "10.6" ]]; then
         os_CODENAME="snow leopard"
         elif [[ "$os_RELEASE" =~ "10.5" ]]; then
         os_CODENAME="leopard"
         elif [[ "$os_RELEASE" =~ "10.4" ]]; then
         os_CODENAME="tiger"
         elif [[ "$os_RELEASE" =~ "10.3" ]]; then
         os_CODENAME="panther"
         else
         os_CODENAME=""
         fi
         elif [[ -x $(which lsb_release 2>/dev/null) ]]; then
         os_VENDOR=$(lsb_release -i -s)
         os_RELEASE=$(lsb_release -r -s)
         os_UPDATE=""
         if [[ "Debian,Ubuntu" =~ $os_VENDOR ]]; then
             os_PACKAGE="deb"
         else
             os_PACKAGE="rpm"
         fi
         os_CODENAME=$(lsb_release -c -s)
     elif [[ -r /etc/redhat-release ]]; then
                                                                                                                                                                        os_CODENAME=""
         for r in "Red Hat" CentOS Fedora; do
             os_VENDOR=$r
             if [[ -n "`grep \"$r\" /etc/redhat-release`" ]]; then
                  ver=`sed -e 's/^.* \(.*\) (\(.*\)).*$/\1\|\2/' /etc/redhat-release`
                  os_CODENAME=${ver#*|}
                  os_RELEASE=${ver%|*}
                  os_UPDATE=${os_RELEASE##*.}
                  os_RELEASE=${os_RELEASE%.*}
                  break
             fi
            os_VENDOR=""
        done
        os_PACKAGE="rpm"
    fi
   export os_VENDOR os_RELEASE os_UPDATE os_PACKAGE os_CODENAME
}




function GetDistro() {
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

GetDistro
