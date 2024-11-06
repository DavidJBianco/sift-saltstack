include:
  - sift.python3-packages.pip

sift-python3-packages-wheel:
  pip.installed:
    - name: wheel
    - bin_env: /usr/bin/python3
    - require:
      - sls: sift.python3-packages.pip
