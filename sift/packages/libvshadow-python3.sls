{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libvshadow-python3:
  pkg.installed:
    - name: libvshadow-python3
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libvshadow-python3:
  pkg.installed:
    - name: python3-libvshadow
{% endif %}