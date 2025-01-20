{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libvshadow:
  pkg.installed:
    - name: libvshadow
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libvshadow:
  pkg.installed:
    - name: libvshadow1
{% endif %}