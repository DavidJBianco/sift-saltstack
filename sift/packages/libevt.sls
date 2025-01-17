{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libevt:
  pkg.installed:
    - name: libevt
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe

libevt:
  pkg.installed:
    - name: libevt-dev
    - require:
      - sls: sift.repos.ubuntu-universe
{% endif %}