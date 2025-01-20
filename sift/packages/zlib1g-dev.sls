{% from "sift/arch.sls" import arch with context %}

{% if arch == "arm64" %}
sift-package-zlib1g-dev:
    pkg.installed:
        - name: zlib1g-dev
{% endif %}