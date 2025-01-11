# Enable execution of x86_64 binaries on arm64 systems. 

{% from "sift/arch.sls" import arch with context %}

{% if arch == 'arm64' %}

qemu-user-static:
    pkg.installed:
        - name: qemu-user-static

qemu-binfmt-support:
    pkg.installed:
        - name: binfmt-support
        - require:
            - pkg: qemu-user-static 

qemu-add-amd64-architecture:
    cmd.run:
        - name: dpkg --add-architecture amd64
        - shell: /bin/bash
        - require:
            - pkg: qemu-binfmt-support
            - pkg: qemu-user-static

qemu-edit-sources-list:
    file.replace:
        - name: /etc/apt/sources.list
        - pattern: '^deb '
        - repl: 'deb [arch=arm64] '
        - append_if_not_found: False
        - require:
            - cmd: qemu-add-amd64-architecture

qemu-add-amd64-sources:
    file.append:
        - name: /etc/apt/sources.list
        - text: |
            # For AMD64 (x86_64) package support
            deb [arch=amd64] http://archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
            deb [arch=amd64] http://archive.ubuntu.com/ubuntu jammy-updates main restricted universe multiverse
            deb [arch=amd64] http://archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse
            deb [arch=amd64] http://archive.ubuntu.com/ubuntu jammy-security main restricted universe multiverse
        - require:
            - cmd: qemu-add-amd64-architecture

qemu-update-package-list:
    cmd.run:
        - name: apt-get update
        - shell: /bin/bash
        - require:
            - cmd: qemu-add-amd64-architecture
            - cmd: qemu-add-amd64-sources
            - cmd: qemu-edit-sources-list

qemu-install-libc6-amd64:
    cmd.run:
        - name: apt-get install -y libc6:amd64
        - shell: /bin/bash
        - require:
            - cmd: qemu-update-package-list

qemu-install-hello-amd64:
    package.installed:
        - name: hello:amd64
        - require:
            - cmd: qemu-install-libc6-amd64

{% endif %}



