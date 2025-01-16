# Name: AESKeyFinder
# Website: https://citp.princeton.edu/our-work/memory/
# Description: Find 128-bit and 256-bit AES keys in a memory image.
# Category: 
# Author: Nadia Heninger, Alex Halderman
# License: Free, unknown license
# Notes: aeskeyfind

{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
aeskeyfind:
  pkg.installed
{% elif arch == "arm64" %}
include:
  - sift.packages.build-essential

aeskeyfind:
  cmd.run:
    - name: |
        mkdir -p /var/cache/sift/archives
        cd /var/cache/sift/archives
        git clone https://git.launchpad.net/ubuntu/+source/aeskeyfind
        cd aeskeyfind
        make
        cp aeskeyfind /usr/local/bin/aeskeyfind
        chmod +x /usr/local/bin/aeskeyfind
{% endif %}