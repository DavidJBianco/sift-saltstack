{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libvshadow-dev:
  pkg.installed:
    - name: libvshadow-dev
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libvshadow-dev:
  pkg.installed:
    - name: libvshadow-dev
{% endif %}