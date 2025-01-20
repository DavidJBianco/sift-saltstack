{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libewf-tools:
  pkg.installed:
    - name: libewf-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe
  - sift.packages.libewf 

libewf-tools:
  pkg.installed:
    - name: ewf-tools
    - require:
      - sls: sift.repos.ubuntu-universe
      - sls: sift.packages.libewf
{% endif %} 