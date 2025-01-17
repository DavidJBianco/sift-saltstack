{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libesedb-tools:
  pkg.installed:
    - name: libesedb-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
  include:
    - sift.repos.ubuntu-universe
    - sift.packages.libesedb

  sift-package-libesedb-tools:
    pkg.installed:
      - name: libesedb-utils
      - require:
        - sls: sift.repos.ubuntu-universe
        - sls: sift.packages.libesedb
{% endif %}