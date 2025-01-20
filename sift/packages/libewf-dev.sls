{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libewf-dev:
  pkg.installed:
    - name: libewf-dev
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe 
  - sift.packages.libewf 

libewf-dev:
  pkg.installed:
    - name: libewf-dev 
    - require:
      - sls: sift.repos.ubuntu-universe 
      - sls: sift.packages.libewf
{% endif %}