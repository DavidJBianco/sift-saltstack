{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libregf-python3:
  pkg.installed:
    - name: libregf-python3
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libregf-python3:
  pkg.installed:
    - name: python3-libregf
{% endif %}