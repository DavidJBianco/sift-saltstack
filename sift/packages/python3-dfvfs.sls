{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-python3-dfvfs:
  pkg.installed:
    - name: python3-dfvfs
    - version: latest
    - hold: False
    - refresh: True
    - update_holds: True
    - allow_updates: True
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-python3-dfvfs:
  pkg.installed:
    - name: python3-dfvfs
{% endif %}