{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libewf-python:
  pkg.installed:
    - name: libewf-python3
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-multiverse
  - sift.packages.libewf

libewf-python:
  pkg.installed:
    - name: python3-libewf
    - require:
      - sls: sift.repos.ubuntu-universe
      - sls: sift.packages.libewf
{% endif %}