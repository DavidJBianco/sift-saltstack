{% from "sift/arch.sls" import arch with context %}

{# renovate: datasource=github-release-attachments depName=Powershell/Powershell #}
{%- set version = "7.4.1" -%}
{%- set hash = {"amd64": "625B7EE0B71147421723CB6022A41B5D8FC0D6E19DF25B1240008EE491BF6997", "arm64": "719c11544a1f6322f2c58f5591ff7abb7768aef97ef0a382e3711f89fa2ade22"} -%}
{%- set filename = "powershell_" ~ version ~ "-1.deb_amd64.deb" -%}
{%- set base_url = "https://github.com/Powershell/Powershell/releases/download/v" -%}

include:
  - sift.packages.libicu

{% if arch == 'arm64' %}
sift-powershell-create-dir-arm64:
  cmd.run:
    - name: mkdir -p /opt/microsoft/powershell/7
    - creates: /opt/microsoft/powershell/7

sift-powershell-source-arm64:
  cmd.run:
    - name: curl -L -o /var/cache/sift/archives/powershell-arm64.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v{{ version }}/powershell-{{ version }}-linux-arm64.tar.gz
    - creates: /var/cache/sift/archives/powershell-arm64.tar.gz

sift-powershell-validate-hash-arm64:
  cmd.run:
    - name: echo "{{ hash['arm64'] }}  /var/cache/sift/archives/powershell-arm64.tar.gz" | sha256sum -c -
    - require:
      - cmd: sift-powershell-source-arm64

sift-powershell-extract-arm64:
  cmd.run:
    - name: tar -xzf /var/cache/sift/archives/powershell-arm64.tar.gz -C /opt/microsoft/powershell/7
    - creates: /opt/microsoft/powershell/7/pwsh
    - require:
      - cmd: sift-powershell-create-dir-arm64
      - cmd: sift-powershell-validate-hash-arm64

sift-powershell-symlink-arm64:
  file.symlink:
    - name: /usr/bin/pwsh
    - target: /opt/microsoft/powershell/7/pwsh
    - require:
      - cmd: sift-powershell-extract-arm64

sift-powershell-symlink-local-arm64:
  file.symlink:
    - name: /usr/local/bin/pwsh
    - target: /opt/microsoft/powershell/7/pwsh
    - require:
      - file: sift-powershell-symlink-arm64
{% elif arch == 'amd64' %}
sift-powershell-source:
  file.managed:
    - name: /var/cache/sift/archives/{{ filename }}
    - source: "{{ base_url }}{{ version }}/{{ filename }}"
    - source_hash: sha256={{ hash["amd64"] }}
    - makedirs: True

sift-powershell:
  pkg.installed:
    - sources:
      - powershell: /var/cache/sift/archives/{{ filename }}
    - watch:
      - file: sift-powershell-source
    - require:
      - sls: sift.packages.libicu

sift-powershell-symlink-local:
  file.symlink:
    - name: /usr/local/bin/pwsh
    - target: /usr/bin/pwsh
    - require:
      - pkg: sift-powershell
{% endif %}