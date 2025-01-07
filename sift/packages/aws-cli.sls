# Name: AWS CLI
# Website: https://docs.aws.amazon.com/cli/
# Description: Command Line Interface for interacting with AWS Cloud components
# Category: 
# Author: Amazon
# License: Apache License v2.0 (https://github.com/aws/aws-cli/blob/develop/LICENSE.txt)
# Version: 2.15.24
# Notes:

{% set hash = '0950d84094bcb5d5deef9c5bf4d59bccc2efb26927a586da5066047d3e9ef63f' %}
{% set version = '2.15.24' %}

aws-cli-download:
  file.managed:
    - name: /tmp/awscli-exe-linux-{{ architecture }}-{{ version }}.zip
    - source: https://awscli.amazonaws.com/awscli-exe-linux-{{ architecture }}-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aws-cli-extract:
  archive.extracted:
    - name: /tmp/
    - source: /tmp/awscli-exe-linux-{{ architecture }}-{{ version }}.zip
    - enforce_toplevel: False
    - overwrite: True
    - trim_output: True
    - require:
      - file: aws-cli-download

aws-cli-install:
  cmd.run:
    - name: /tmp/aws/install -u
    - shell: /bin/bash
    - require:
      - file: aws-cli-download
      - archive: aws-cli-extract

aws-cli-cleanup:
  file.absent:
    - names:
      - /tmp/awscli-exe-linux-{{ architecture }}-{{ version }}.zip
      - /tmp/aws/
    - require:
      - cmd: aws-cli-install
