{% from "sift/arch.sls" import arch with context %}

{% if arch == "arm64" %}
sift-package-automake:
    pkg.installed:
        - name: automake
{% endif %}