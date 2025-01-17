{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libevtx-tools:
  pkg.installed:
    - name: libevtx-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe
  - sift.packages.libevtx 
  
libevtx-tools:
  pkg.installed:
    - name: libevtx-utils
    - require:
      - sls: sift.repos.ubuntu-universe
      - sls: sift.packages.libevtx
{% endif %}