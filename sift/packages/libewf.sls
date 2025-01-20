{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libewf:
  pkg.installed:
    - name: libewf
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe

libewf:
  pkg.installed:
    - name: libewf2
    - require: 
      - sls: sift.repos.ubuntu-universe
{% endif %}