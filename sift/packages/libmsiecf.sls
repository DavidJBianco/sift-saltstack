{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libmsiecf:
  pkg.installed:
    - name: libmsiecf
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
libmsiecf:
  pkg.installed:
    - name: libmsiecf1
{% endif %}