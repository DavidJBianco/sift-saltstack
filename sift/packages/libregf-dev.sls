{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libregf-dev:
  pkg.installed:
    - name: libregf-dev
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libregf-dev:
  pkg.installed:
    - name: libregf-dev
{% endif %}