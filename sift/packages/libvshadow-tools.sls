{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libvshadow-tools:
  pkg.installed:
    - name: libvshadow-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libvshadow-tools:
  pkg.installed:
    - name: libvshadow-utils
{% endif %}