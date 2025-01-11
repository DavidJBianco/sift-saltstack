{% from "sift/arch.sls" import arch with context %}

{% if arch == 'amd64' %}
  {% set url = 'archive.ubuntu.com/ubuntu/' %}
{% elif arch == 'arm64' %}
  {% set url = 'ports.ubuntu.com/ubuntu-ports/' %}
{% else %}
  {% set url = 'ports.ubuntu.com/ubuntu-ports' %}
{% endif %}

sift-universe-repo:
  pkgrepo.managed:
    - name: deb http://{{ url }} {{ grains['lsb_distrib_codename'] }} universe
    - refresh_db: true
