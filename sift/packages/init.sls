{% from "sift/arch.sls" import arch with context %}

include:
  - sift.packages.dbus-x11
  - sift.packages.aeskeyfind
  - sift.packages.afflib-tools
  - sift.packages.aircrack-ng
  - sift.packages.apache2
  - sift.packages.arp-scan
  - sift.packages.autopsy
  - sift.packages.aws-cli
  - sift.packages.avfs
  - sift.packages.bless
  - sift.packages.blt
  - sift.packages.build-essential
  - sift.packages.bulk-extractor
  - sift.packages.cabextract
  - sift.packages.ccrypt
  - sift.packages.chromium-browser
  - sift.packages.cifs-utils
  - sift.packages.clamav
{% if arch != "arm64" %}
  - sift.packages.cmospwd
{% endif %}
  - sift.packages.cryptcat
  - sift.packages.cryptsetup
  - sift.packages.curl
  - sift.packages.dc3dd
  - sift.packages.dcfldd
  - sift.packages.default-jre
  - sift.packages.disktype
  - sift.packages.dislocker
  - sift.packages.docker
  - sift.packages.driftnet
  - sift.packages.dsniff
  - sift.packages.e2fsprogs
  - sift.packages.ent
  - sift.packages.epic5
  - sift.packages.etherape
  - sift.packages.ettercap-graphical
  - sift.packages.exfat-extras
  - sift.packages.exfat-fuse
  - sift.packages.exif
  - sift.packages.extundelete
  - sift.packages.fdupes
  - sift.packages.feh
  - sift.packages.flasm
  - sift.packages.flex
  - sift.packages.foremost
  - sift.packages.g++
  - sift.packages.gawk
  - sift.packages.gcc
  - sift.packages.gdb
  - sift.packages.gddrescue
  - sift.packages.ghex
  - sift.packages.git
  - sift.packages.graphviz
  - sift.packages.grepcidr
  - sift.packages.gthumb
  - sift.packages.gzrt
  - sift.packages.hashdeep
  - sift.packages.hexedit
  - sift.packages.htop
  - sift.packages.hydra
  - sift.packages.hydra-gtk
  - sift.packages.ipython3
  - sift.packages.jq
  - sift.packages.kdiff3
  - sift.packages.knocker
  - sift.packages.kpartx
  - sift.packages.lft
  - sift.packages.libafflib-dev
  - sift.packages.libafflib
  - sift.packages.libbcprov-java
  - sift.packages.libbde
  - sift.packages.libbde-tools
  - sift.packages.libcommons-lang3-java
  - sift.packages.libdatetime-perl
  - sift.packages.libesedb
  - sift.packages.libesedb-tools
  - sift.packages.libevt
  - sift.packages.libevt-tools
  - sift.packages.libevtx
  - sift.packages.libevtx-tools
  - sift.packages.libewf-dev
  - sift.packages.libewf-python3
  - sift.packages.libewf
  - sift.packages.libewf-tools
  - sift.packages.libext2fs2
  - sift.packages.libffi-dev
{% if arch != "arm64" %}
  - sift.packages.libfsapfs-tools
{% endif %}
  - sift.packages.libfuse-dev
{% if arch != "arm64" %}
  - sift.packages.libfvde
  - sift.packages.libfvde-tools
{% endif %}
{% if arch != "arm64" %}
  - sift.packages.liblightgrep
{% endif %}
{% if arch != "arm64" %}
  - sift.packages.libmsiecf
{% endif %}
  - sift.packages.libncurses
  - sift.packages.libnet1
{% if arch != "arm64" %}
  - sift.packages.libolecf
{% endif %}
  - sift.packages.libparse-win32registry-perl
  - sift.packages.libpff
  - sift.packages.libpff-dev
  - sift.packages.libplist-utils
{% if arch != "arm64" %}
  - sift.packages.libregf
  - sift.packages.libregf-dev
  - sift.packages.libregf-python3
  - sift.packages.libregf-tools
{% endif %}
  - sift.packages.libssl-dev
  - sift.packages.libtext-csv-perl
{% if arch != "arm64" %}
  - sift.packages.libvmdk
{% endif %}
{% if arch != "arm64" %}
  - sift.packages.libvshadow
  - sift.packages.libvshadow-dev
  - sift.packages.libvshadow-python3
  - sift.packages.libvshadow-tools
{% endif %}
  - sift.packages.libxml2-dev
  - sift.packages.libxslt-dev
  - sift.packages.magnus
  - sift.packages.nbd-client
  - sift.packages.nbtscan
  - sift.packages.netcat
  - sift.packages.netpbm
  - sift.packages.netsed
  - sift.packages.netwox
  - sift.packages.net-tools
  - sift.packages.nfdump
  - sift.packages.ngrep
  - sift.packages.nikto
  - sift.packages.ntfs-3g
  - sift.packages.okular
  - sift.packages.onboard
  - sift.packages.open-iscsi
  - sift.packages.openjdk
  - sift.packages.ophcrack
  - sift.packages.ophcrack-cli
  - sift.packages.orca
  - sift.packages.outguess
  - sift.packages.p0f
  - sift.packages.p7zip-full
  - sift.packages.pdftk-java
  - sift.packages.perl
  - sift.packages.pev
  - sift.packages.pff-tools
  - sift.packages.phonon
  - sift.packages.pkg-config
{% if arch != 'arm64' %}
  - sift.packages.plaso-tools
{% endif %}
  - sift.packages.powershell
  - sift.packages.pv
  - sift.packages.python-flowgrep
  - sift.packages.python3
  - sift.packages.python3-dev
{% if arch != 'arm64' %}
  - sift.packages.python3-dfvfs
{% endif %}
  - sift.packages.python3-fuse
  - sift.packages.python3-pefile
  - sift.packages.python3-pip
  - sift.packages.python3-pypff
{% if arch != 'arm64' %}
  - sift.packages.python3-pytsk3
{% endif %}
  - sift.packages.python3-pyqt5
  - sift.packages.python3-redis
  - sift.packages.python3-tk
  - sift.packages.python3-virtualenv
  - sift.packages.python3-xlsxwriter
  - sift.packages.python3-yara
  - sift.packages.pst-utils
  - sift.packages.qemu
  - sift.packages.qemu-utils
  - sift.packages.qemu-user-static
  - sift.packages.radare2
  - sift.packages.rar
  - sift.packages.rsakeyfind
  - sift.packages.safecopy
  - sift.packages.samba
  - sift.packages.samdump2
  - sift.packages.scalpel
  - sift.packages.silversearcher-ag
  - sift.packages.sleuthkit
  - sift.packages.socat
  - sift.packages.ssdeep
  - sift.packages.ssldump
  - sift.packages.sslsniff
  - sift.packages.stunnel4
  - sift.packages.tcl
  - sift.packages.tcpflow
  - sift.packages.tcpick
  - sift.packages.tcpreplay
  - sift.packages.tcpslice
  - sift.packages.tcpstat
  - sift.packages.tcptrace
  - sift.packages.tcptrack
  - sift.packages.tcpxtract
  - sift.packages.testdisk
  - sift.packages.tofrodos
  - sift.packages.transmission
  - sift.packages.unrar
  - sift.packages.unity-control-center
  - sift.packages.upx-ucl
  - sift.packages.vbindiff
  - sift.packages.vim
  - sift.packages.virtuoso-minimal
  - sift.packages.vmfs-tools
  - sift.packages.winbind
  - sift.packages.wine
  - sift.packages.wireshark
  - sift.packages.xdot
  - sift.packages.xfsprogs
  - sift.packages.xmount
  - sift.packages.zenity
  - sift.packages.python3-debian

sift-packages:
  test.nop:
    - name: sift-packages
    - require:
      - sls: sift.packages.dbus-x11
{%if arch != "arm64" %}
      - sls: sift.packages.aeskeyfind
{%endif %}
      - sls: sift.packages.afflib-tools
      - sls: sift.packages.aircrack-ng
      - sls: sift.packages.apache2
      - sls: sift.packages.arp-scan
      - sls: sift.packages.autopsy
      - sls: sift.packages.aws-cli
      - sls: sift.packages.avfs
      - sls: sift.packages.bless
      - sls: sift.packages.blt
      - sls: sift.packages.build-essential
{% if arch != "arm64" %}
      - sls: sift.packages.bulk-extractor
{% endif %}
      - sls: sift.packages.cabextract
      - sls: sift.packages.ccrypt
      - sls: sift.packages.chromium-browser
      - sls: sift.packages.cifs-utils
      - sls: sift.packages.clamav
{% if arch != "arm64" %}
      - sls: sift.packages.cmospwd
{% endif %}
      - sls: sift.packages.cryptcat
      - sls: sift.packages.cryptsetup
      - sls: sift.packages.curl
      - sls: sift.packages.dc3dd
      - sls: sift.packages.dcfldd
      - sls: sift.packages.default-jre
      - sls: sift.packages.disktype
      - sls: sift.packages.dislocker
      - sls: sift.packages.docker
      - sls: sift.packages.driftnet
      - sls: sift.packages.dsniff
      - sls: sift.packages.e2fsprogs
      - sls: sift.packages.ent
      - sls: sift.packages.epic5
      - sls: sift.packages.etherape
      - sls: sift.packages.ettercap-graphical
      - sls: sift.packages.exfat-extras
      - sls: sift.packages.exfat-fuse
      - sls: sift.packages.exif
      - sls: sift.packages.extundelete
      - sls: sift.packages.fdupes
      - sls: sift.packages.feh
      - sls: sift.packages.flasm
      - sls: sift.packages.flex
      - sls: sift.packages.foremost
      - sls: sift.packages.g++
      - sls: sift.packages.gawk
      - sls: sift.packages.gcc
      - sls: sift.packages.gdb
      - sls: sift.packages.gddrescue
      - sls: sift.packages.ghex
      - sls: sift.packages.git
      - sls: sift.packages.graphviz
      - sls: sift.packages.grepcidr
      - sls: sift.packages.gthumb
      - sls: sift.packages.gzrt
      - sls: sift.packages.hashdeep
      - sls: sift.packages.hexedit
      - sls: sift.packages.htop
      - sls: sift.packages.hydra
      - sls: sift.packages.hydra-gtk
      - sls: sift.packages.ipython3
      - sls: sift.packages.jq
      - sls: sift.packages.kdiff3
      - sls: sift.packages.knocker
      - sls: sift.packages.kpartx
      - sls: sift.packages.lft
      - sls: sift.packages.libafflib-dev
      - sls: sift.packages.libafflib
      - sls: sift.packages.libbcprov-java
{% if arch != "arm64" %}
      - sls: sift.packages.libbde
      - sls: sift.packages.libbde-tools
{% endif %}
      - sls: sift.packages.libcommons-lang3-java
      - sls: sift.packages.libdatetime-perl
{% if arch != "arm64" %}
      - sls: sift.packages.libesedb
      - sls: sift.packages.libesedb-tools
{% endif %}
{% if arch != "arm64" %}
      - sls: sift.packages.libevt
      - sls: sift.packages.libevt-tools
{% endif %}
{% if arch != "arm64" %}
      - sls: sift.packages.libevtx
      - sls: sift.packages.libevtx-tools
{% endif %}
{% if arch != "arm64" %}
      - sls: sift.packages.libewf
      - sls: sift.packages.libewf-dev
      - sls: sift.packages.libewf-python3
      - sls: sift.packages.libewf-tools
{% endif %}
      - sls: sift.packages.libext2fs2
      - sls: sift.packages.libffi-dev
{% if arch != "arm64" %}
      - sls: sift.packages.libfsapfs-tools
{% endif %}
      - sls: sift.packages.libfuse-dev
{% if arch != "arm64" %}
      - sls: sift.packages.libfvde
      - sls: sift.packages.libfvde-tools
{% endif %}
{% if arch != "arm64" %}
      - sls: sift.packages.liblightgrep
{% endif %}
{% if arch != "arm64" %}
      - sls: sift.packages.libmsiecf
{% endif %}
      - sls: sift.packages.libncurses
      - sls: sift.packages.libnet1
{% if arch != "arm64" %}
      - sls: sift.packages.libolecf
{% endif %}
      - sls: sift.packages.libparse-win32registry-perl
      - sls: sift.packages.libpff
      - sls: sift.packages.libpff-dev
      - sls: sift.packages.libplist-utils
{% if arch != "arm64" %}
      - sls: sift.packages.libregf
      - sls: sift.packages.libregf-dev
      - sls: sift.packages.libregf-python3
      - sls: sift.packages.libregf-tools
{% endif %}
      - sls: sift.packages.libssl-dev
      - sls: sift.packages.libtext-csv-perl
{% if arch != "arm64" %}
      - sls: sift.packages.libvmdk
{% endif %}
{% if arch != "arm64" %}
      - sls: sift.packages.libvshadow
      - sls: sift.packages.libvshadow-dev
      - sls: sift.packages.libvshadow-python3
      - sls: sift.packages.libvshadow-tools
{% endif %}
      - sls: sift.packages.libxml2-dev
      - sls: sift.packages.libxslt-dev
      - sls: sift.packages.magnus
      - sls: sift.packages.nbd-client
      - sls: sift.packages.nbtscan
      - sls: sift.packages.netcat
      - sls: sift.packages.netpbm
      - sls: sift.packages.netsed
      - sls: sift.packages.netwox
      - sls: sift.packages.net-tools
      - sls: sift.packages.nfdump
      - sls: sift.packages.ngrep
      - sls: sift.packages.nikto
      - sls: sift.packages.ntfs-3g
      - sls: sift.packages.okular
      - sls: sift.packages.onboard
      - sls: sift.packages.open-iscsi
      - sls: sift.packages.openjdk
      - sls: sift.packages.ophcrack
      - sls: sift.packages.ophcrack-cli
      - sls: sift.packages.orca
      - sls: sift.packages.outguess
      - sls: sift.packages.p0f
      - sls: sift.packages.p7zip-full
      - sls: sift.packages.pdftk-java
      - sls: sift.packages.perl
      - sls: sift.packages.pev
      - sls: sift.packages.pff-tools
      - sls: sift.packages.phonon
      - sls: sift.packages.pkg-config
{% if arch != 'arm64' %}
      - sls: sift.packages.plaso-tools
{% endif %}
      - sls: sift.packages.powershell
      - sls: sift.packages.pv
      - sls: sift.packages.python-flowgrep
      - sls: sift.packages.python3
      - sls: sift.packages.python3-dev
{% if arch != 'arm64' %}
      - sls: sift.packages.python3-dfvfs
{% endif %}
      - sls: sift.packages.python3-fuse
      - sls: sift.packages.python3-pefile
      - sls: sift.packages.python3-pip
      - sls: sift.packages.python3-pypff
{% if arch != 'arm64' %}
      - sls: sift.packages.python3-pytsk3
{% endif %}
      - sls: sift.packages.python3-pyqt5
      - sls: sift.packages.python3-redis
      - sls: sift.packages.python3-tk
      - sls: sift.packages.python3-virtualenv
      - sls: sift.packages.python3-xlsxwriter
      - sls: sift.packages.python3-yara
      - sls: sift.packages.pst-utils
      - sls: sift.packages.qemu
      - sls: sift.packages.qemu-utils
      - sls: sift.packages.radare2
      - sls: sift.packages.rar
      - sls: sift.packages.rsakeyfind
      - sls: sift.packages.safecopy
      - sls: sift.packages.samba
      - sls: sift.packages.samdump2
      - sls: sift.packages.scalpel
      - sls: sift.packages.silversearcher-ag
      - sls: sift.packages.sleuthkit
      - sls: sift.packages.socat
      - sls: sift.packages.ssdeep
      - sls: sift.packages.ssldump
      - sls: sift.packages.sslsniff
      - sls: sift.packages.stunnel4
      - sls: sift.packages.tcl
      - sls: sift.packages.tcpflow
      - sls: sift.packages.tcpick
      - sls: sift.packages.tcpreplay
      - sls: sift.packages.tcpslice
      - sls: sift.packages.tcpstat
      - sls: sift.packages.tcptrace
      - sls: sift.packages.tcptrack
      - sls: sift.packages.tcpxtract
      - sls: sift.packages.testdisk
      - sls: sift.packages.tofrodos
      - sls: sift.packages.transmission
      - sls: sift.packages.unity-control-center
      - sls: sift.packages.unrar
      - sls: sift.packages.upx-ucl
      - sls: sift.packages.vbindiff
      - sls: sift.packages.vim
      - sls: sift.packages.virtuoso-minimal
      - sls: sift.packages.vmfs-tools
      - sls: sift.packages.winbind
      - sls: sift.packages.wine
      - sls: sift.packages.wireshark
      - sls: sift.packages.xdot
      - sls: sift.packages.xfsprogs
      - sls: sift.packages.xmount
      - sls: sift.packages.zenity
      - sls: sift.packages.python3-debian
