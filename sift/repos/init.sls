include:
  - sift.repos.sift
  - sift.repos.ubuntu-multiverse
  - sift.repos.ubuntu-universe


sift-repos:
  test.nop:
    - name: sift-repos
    - require:
      - sls: sift.repos.sift
      - sls: sift.repos.ubuntu-multiverse
      - sls: sift.repos.ubuntu-universe
      
