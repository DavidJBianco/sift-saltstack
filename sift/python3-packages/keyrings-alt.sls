include:
  - sift.python3-packages.core

sift-python3-packages-keyrings-alt:
  pip.installed:
    - name: keyrings.alt
    - bin_env: /usr/bin/python3
    - require:
      - sls: sift.python3-packages.core
