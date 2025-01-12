{% from "sift/arch.sls" import arch with context %}

include:
  - sift.python-packages.analyzemft
{% if arch != 'arm64' %}
  - sift.python-packages.appcompatprocessor
{% endif %}
  - sift.python-packages.argparse
  - sift.python-packages.bitstring
  - sift.python-packages.colorama
  - sift.python-packages.construct
  - sift.python-packages.distorm3
  - sift.python-packages.docopt
  - sift.python-packages.geoip2
  - sift.python-packages.indxparse
  - sift.python-packages.ioc_writer
  - sift.python-packages.lxml
  - sift.python-packages.ntdsxtract
  - sift.python-packages.pefile
{% if arch != 'arm64' %}
  - sift.python-packages.pillow
{% endif %}
  - sift.python-packages.poster
  - sift.python-packages.pysocks
  - sift.python-packages.python-dateutil
  - sift.python-packages.python-magic
  - sift.python-packages.python-registry
  - sift.python-packages.setuptools
  - sift.python-packages.shellbags
  - sift.python-packages.six
  - sift.python-packages.unicodecsv
  - sift.python-packages.usnparser
  - sift.python-packages.volatility
  - sift.python-packages.wheel
  - sift.python-packages.windowsprefetch

sift-python-packages:
  test.nop:
    - name: sift-python-packages
    - require:
      - sls: sift.python-packages.analyzemft
{% if arch != 'arm64' %}
      - sls: sift.python-packages.appcompatprocessor
{% endif %}
      - sls: sift.python-packages.argparse
      - sls: sift.python-packages.bitstring
      - sls: sift.python-packages.colorama
      - sls: sift.python-packages.construct
      - sls: sift.python-packages.distorm3
      - sls: sift.python-packages.docopt
      - sls: sift.python-packages.geoip2
      - sls: sift.python-packages.indxparse
      - sls: sift.python-packages.ioc_writer
      - sls: sift.python-packages.lxml
      - sls: sift.python-packages.ntdsxtract
      - sls: sift.python-packages.pefile
{% if arch != 'arm64' %}
      - sls: sift.python-packages.pillow
{% endif %}
      - sls: sift.python-packages.poster
      - sls: sift.python-packages.pysocks
      - sls: sift.python-packages.python-dateutil
      - sls: sift.python-packages.python-magic
      - sls: sift.python-packages.python-registry
      - sls: sift.python-packages.setuptools
      - sls: sift.python-packages.shellbags
      - sls: sift.python-packages.six
      - sls: sift.python-packages.unicodecsv
      - sls: sift.python-packages.usnparser
      - sls: sift.python-packages.volatility
      - sls: sift.python-packages.wheel
      - sls: sift.python-packages.windowsprefetch
