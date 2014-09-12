## vagrant-gitlab

### Vagrant 
The vagrant implementation will allow you to use gitlab locally.

```
git clone https://github.com/MadisonHub/vagrant-gitlab.git
cd varant-gitlab
vagrant up gitlab --provision
```

##### Login to the vagrant machine
```
vagrant ssh gitlab
```

##### Install gitlab

```
sudo salt-call -l debug --local state.highstate
```

##### Access Gitlab
Then, navigate to [http://localhost:8888](http://localhost:8888) and login with 
the username: ```root```, password: ```5iveL!fe```

##### Backup Gitlab

```
sudo gitlab-rake gitlab:backup:create
```

##### Fix Gitlab
In case webhooks arent working or issues with realtime event

```
sudo gitlab-ctl restart
sudo gitlab-rake gitlab:check
```

##### Add LDAP

Edit the file **/etc/gitlab/gitlab.rb** and add

```
gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_host'] = 'dc1'
gitlab_rails['ldap_port'] = 389
gitlab_rails['ldap_uid'] = 'sAMAccountName'
gitlab_rails['ldap_method'] = 'plain'
gitlab_rails['ldap_bind_dn'] = 'CN=gitlab,CN=Users,DC=domain,DC=net'
gitlab_rails['ldap_password'] = 'password'
gitlab_rails['ldap_allow_username_or_email_login'] = true
gitlab_rails['ldap_base'] = 'CN=Users,DC=domain,DC=net'
```

Then run

```
sudo gitlab-ctl reconfigure
```
