{% from "sift/arch.sls" import arch with context %}

{% if arch == "arm64" %}
sift-package-libre2-dev:
    pkg.installed:
        - name: libre2-dev
{% endif %}