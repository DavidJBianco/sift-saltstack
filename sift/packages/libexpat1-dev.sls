{% from "sift/arch.sls" import arch with context %}

{% if arch == "arm64" %}
sift-package-libexpat1-dev:
    pkg.installed:
        - name: libexpat1-dev
{% endif %}