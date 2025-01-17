{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libbde-tools:
  pkg.installed:
    - name: libbde-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe
  - sift.packages.libbde

libbde-tools:
  pkg.installed:
    - name: libbde-utils
    - require: 
      - sls: sift.repos.ubuntu-universe
      - sls: sift.packages.libbde
{% endif %}