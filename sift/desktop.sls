include:
  - sift.include-desktop

sift-desktop-version-file:
  file.managed:
    - name: /etc/sift-version
    - source:
      - salt://sift/VERSION # note: this is here for when sift is a submoduled to salt://sift/
      - salt://VERSION
    - user: root
    - group: root
    - require:
      - sls: sift.include-desktop
