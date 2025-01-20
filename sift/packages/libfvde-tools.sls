{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libfvde-tools:
  pkg.installed:
    - name: libfvde-tools
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
libfvde-tools:
  pkg.installed:
    - name: libfvde-utils
{% endif %}