{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libfsapfs-tools:
  pkg.installed:
    - name: libfsapfs-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libfsapfs-tools:
  pkg.installed:
    - name: libfsapfs-utils
{% endif %}
