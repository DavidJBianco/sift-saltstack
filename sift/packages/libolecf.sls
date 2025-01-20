{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libolecf:
  pkg.installed:
    - name: libolecf
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libolecf:
  pkg.installed:
    - name: libolecf1
{% endif %}