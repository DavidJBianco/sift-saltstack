{% from "sift/arch.sls" import arch with context %}

{% if arch == "amd64" %}
include:
  - sift.repos.gift

sift-package-removed-pytsk3:
  pkg.removed:
    - name: pytsk3

sift-package-python-pytsk3:
  pkg.installed:
    - name: python3-pytsk3
    - required:
      - pkg: sift-package-removed-pytsk3
      - sls: sift.repos.gift
{% elif arch == "arm64" %}

sift-python3-pip:
  pkg.installed:
    - name: python3-pip 
    
sift-package-python-pytsk3:
  cmd.run:
    - name: pip3 install pytsk3
    - require:
      - pkg: sift-python3-pip
{% endif %}