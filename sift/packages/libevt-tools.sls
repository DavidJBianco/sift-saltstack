{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libevt-tools:
  pkg.installed:
    - name: libevt-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe 
  - sift.packages.libevt

libevt-tools:
  pkg.installed:
    - name: libevt-utils
    - require:
      - sls: sift.repos.ubuntu-universe
      - sls: sift.packages.libevt
{% endif %}