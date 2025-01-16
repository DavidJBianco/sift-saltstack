# Name: bulk_extractor
# Website: https://github.com/simsong/bulk_extractor/
# Description: Extract interesting strings from binary files.
# Category:
# Author: https://github.com/simsong/bulk_extractor/blob/master/AUTHORS
# License: Portions Public Domain, portions MIT License: https://github.com/simsong/bulk_extractor/blob/master/LICENSE.md
# Notes: 

{% from "sift/arch.sls" import arch with context %}

include:
  - sift.repos.sift
  - sift.repos.openjdk
{% if arch == "arm64" %}
  - sift.packages.build-essential
{% endif %}

{% if arch == "amd64" %} 
sift-package-bulk-extractor:
  pkg.installed:
    - name: bulk-extractor
    - require:
      - pkgrepo: sift-repo
      - pkgrepo: openjdk-repo
{% elif arch == "arm64" %}
automake:
  pkg.installed

libssl-dev:
  pkg.installed

flex:
  pkg.installed

zlib1g-dev:
  pkg.installed

pkg-config:
  pkg.installed

libre2-dev:
  pkg.installed

bulk-extractor:
  cmd.run:
    - name: |
        mkdir -p /var/cache/sift/archives
        cd /var/cache/sift/archives
        git clone --recurse-submodules https://github.com/simsong/bulk_extractor.git
        cd bulk_extractor
        ./bootstrap.sh 
        ./configure
        make
        make install
    - require:
      - pkg: automake
      - pkg: pkg-config
      - pkg: libssl-dev
      - pkg: flex 
      - pkg: zlib1g-dev
      - pkg: libre2-dev
{% endif %}