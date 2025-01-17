{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libbde:
  pkg.installed:
    - name: libbde
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe
  
libbde:
  pkg.installed:
    - name: libbde-dev
    - require: 
      - sls: sift.repos.ubuntu-universe
{% endif %}
