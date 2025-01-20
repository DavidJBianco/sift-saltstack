{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-libvmdk:
  pkg.installed:
    - name: libvmdk
    - require:
      - sls: sift.repos.gift
{% elif arch == "arm64" %}
sift-package-libvmdk:
  pkg.installed:
    - name: libvmdk1
{% endif %}