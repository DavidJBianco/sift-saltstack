{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

libfvde:
  pkg.installed:
    - require:
      - pkgrepo: gift-repo
{% elif arch == "arm64" %}
libfvde:
  pkg.installed:
    - name: libfvde1
{% endif %}