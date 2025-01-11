# Enable execution of x86_64 binaries on arm64 systems. 

{% from "sift/arch.sls" import arch with context %}

{% if arch == 'arm64' %}

qemu-user-static:
    pkg.installed:
        - name: qemu-user-static

binfmt-support:
    pkg.installed:
        - name: binfmt-support
        - require:
            - pkg: qemu-user-static 

add-amd64-architecture:
    cmd.run:
        - name: dpkg --add-architecture amd64
        - shell: /bin/bash
        - require:
            - pkg: binfmt-support
            - pkg: qemu-user-static
        - watch_in:
            - pkg: qemu-user-static
            - pkg: binfmt-support

update-package-list:
    cmd.run:
        - name: apt update
        - shell: /bin/bash
        - require:
            - cmd: add-amd64-architecture

install-libc6-amd64:
    cmd.run:
        - name: apt-get install -y libc6:amd64
        - shell: /bin/bash
        - require:
            - cmd: update-package-list

{% endif %}



