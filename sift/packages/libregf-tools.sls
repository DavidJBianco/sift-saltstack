{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libregf-tools:
  pkg.installed:
    - name: libregf-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libregf-tools:
  pkg.installed:
    - name: libregf-utils
{% endif %}