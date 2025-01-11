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

qemu-update-package-list:
    cmd.run:
        - name: apt update
        - shell: /bin/bash
        - require:
            - cmd: qemu-add-amd64-architecture

qemu-install-libc6-amd64:
    cmd.run:
        - name: apt-get install -y libc6:amd64
        - shell: /bin/bash
        - require:
            - cmd: qemu-update-package-list

{% endif %}



