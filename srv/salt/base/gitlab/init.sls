get latest deb:
  cmd.run:
    - name: cd /opt; wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.2.1-omnibus-1_amd64.deb
    - unless: test -e /opt/gitlab_7.2.1-omnibus-1_amd64.deb

gitlab:
  cmd.run:
    - name: mkdir /etc/gitlab; cp /vagrant/gitlab.rb /etc/gitlab/gitlab.rb; dpkg -i /opt/gitlab_7.2.1-omnibus-1_amd64.deb; gitlab-ctl reconfigure
    - unless: dpkg -s gitlab
    - require:
      - cmd: get latest deb
