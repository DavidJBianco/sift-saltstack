{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libregf:
  pkg.installed:
    - name: libregf
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libregf:
  pkg.installed:
    - name: libregf1
{% endif %}