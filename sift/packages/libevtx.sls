{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libevtx:
  pkg.installed:
    - name: libevtx
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe

libevtx:
  pkg.installed:
    - name: libevtx-dev
    - require:
      - sls: sift.repos.ubuntu-universe
{% endif %}