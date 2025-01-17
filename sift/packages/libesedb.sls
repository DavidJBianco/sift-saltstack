{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libesedb:
  pkg.installed:
    - name: libesedb
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
include:
  - sift.repos.ubuntu-universe

sift-package-libesedb:
  pkg.installed:
    - name: libesedb-dev
    - require:
      - sls: sift.repos.ubuntu-universe
{% endif %}