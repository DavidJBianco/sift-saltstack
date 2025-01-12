{% from "sift/arch.sls" import arch with context %}

{# renovate: datasource=github-release-attachments depName=Powershell/Powershell #}
{%- set version = {"amd64": "7.4.1", "arm64": "7.4.6"} -%}
{%- set hash = {"amd64": "625B7EE0B71147421723CB6022A41B5D8FC0D6E19DF25B1240008EE491BF6997", "arm64": "C0159B03E85F44AE1E7697818A011558DA6C813D0AAE848BF5AC13BF435D8624"} -%}
{%- set filename = {"amd64": "powershell_" ~ version["amd64"] ~ "-1.deb_amd64.deb", "arm64": "powershell-" ~ version["arm64"] ~ "-linux-arm64.tar.gz"} -%}
{%- set base_url = "https://github.com/Powershell/Powershell/releases/download/v" -%}

include:
  - sift.packages.libicu

sift-powershell-source:
  file.managed:
    - name: /var/cache/sift/archives/{{ filename[arch] }}
    - source: "{{ base_url }}{{ version[arch] }}/{{ filename[arch] }}"
    - source_hash: sha256={{ hash[arch] }}
    - makedirs: True

{% if arch == 'arm64' %}
sift-powershell-create-dir-arm64:
  cmd.run:
    - name: mkdir -p /opt/microsoft/powershell/7
    - creates: /opt/microsoft/powershell/7

sift-powershell-extract-arm64:
  cmd.run:
    - name: tar -xzf /var/cache/sift/archives/{{ filename[arch] }} -C /opt/microsoft/powershell/7
    - creates: /opt/microsoft/powershell/7/pwsh
    - require:
      - cmd: sift-powershell-create-dir-arm64
      - file: sift-powershell-source

sift-powershell-make-executable-arm64:
  file.managed:
    - name: /opt/microsoft/powershell/7/pwsh
    - mode: 755
    - require:
      - cmd: sift-powershell-extract-arm64

sift-powershell-symlink-arm64:
  file.symlink:
    - name: /usr/bin/pwsh
    - target: /opt/microsoft/powershell/7/pwsh
    - require:
      - file: sift-powershell-make-executable-arm64

sift-powershell-symlink-local-arm64:
  file.symlink:
    - name: /usr/local/bin/pwsh
    - target: /opt/microsoft/powershell/7/pwsh
    - require:
      - file: sift-powershell-symlink-arm64
{% elif arch == 'amd64' %}
sift-powershell:
  pkg.installed:
    - sources:
      - powershell: /var/cache/sift/archives/{{ filename[arch] }}
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