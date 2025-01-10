{# sift/arch.sls #}
{% if grains['osarch'] in ['amd64', 'x86_64'] %}
  {% set arch = 'amd64' %}
{% elif grains['osarch'] in ['arm64', 'aarch64'] %}
  {% set arch = 'arm64' %}
{% else %}
  {% set arch = 'unknown' %}
{% endif %}
