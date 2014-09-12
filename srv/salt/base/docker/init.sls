docker dependencies:
  pkg:
    - installed
    - pkgs: [python-pip]

docker-py:
  pip.installed:
    - require:
      - pkg: docker dependencies
      - cmd: install docker

net.ipv4.ip_forward:
  sysctl.present:
    - value: 1

docker_fwd:
  file.sed:
    - name: '/etc/default/ufw'
    - before: 'DEFAULT_FORWARD_POLICY="DROP"'
    - after: 'DEFAULT_FORWARD_POLICY="ACCEPT"'

install docker:
  cmd.run:
    - name: curl -sL https://get.docker.io/ | sudo sh && sudo usermod -aG docker vagrant
    - unless: test -e /usr/bin/docker
