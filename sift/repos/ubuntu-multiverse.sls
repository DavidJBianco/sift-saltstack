{% from "sift/arch.sls" import arch with context %}

{% if arch == 'amd64' %}
  {% set url = 'archive.ubuntu.com/ubuntu/' %}
{% elif arch == 'arm64' %}
  {% set url = 'ports.ubuntu.com/ubuntu-ports/' %}
{% else %}
  {% set url = 'ports.ubuntu.com/ubuntu-ports' %}
{% endif %}

sift-multiverse-repo:
  pkgrepo.managed:
    - name: deb http://{{ url }} {{ grains['lsb_distrib_codename'] }} multiverse
    - refresh_db: true

sift-multiverse-repo-security:
  pkgrepo.managed:
    - name: deb http://{{ url }} {{ grains['lsb_distrib_codename'] }}-security multiverse
    - refresh_db: true

