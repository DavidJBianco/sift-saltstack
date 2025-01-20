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
  - sift.packages.pkg-config
  - sift.packages.libssl-dev
  - sift.packages.flex
  - sift.packages.libewf-dev
  - sift.packages.automake
  - sift.packages.zlib1g-dev 
  - sift.packages.libre2-dev 
  - sift.packages.libexpat1-dev  
{% endif %}

{% if arch == "amd64" %} 
sift-package-bulk-extractor:
  pkg.installed:
    - name: bulk-extractor
    - require:
      - pkgrepo: sift-repo
      - pkgrepo: openjdk-repo
{% elif arch == "arm64" %}
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
      - sls: sift.packages.automake
      - sls: sift.packages.zlib1g-dev 
      - sls: sift.packages.libre2-dev 
      - sls: sift.packages.libexpat1-dev
      - pkg: pkg-config
      - pkg: libssl-dev
      - pkg: flex 
      - sls: sift.packages.libewf-dev
{% endif %}