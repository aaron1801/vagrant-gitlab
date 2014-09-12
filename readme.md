## vagrant-gitlab

### Vagrant 
The vagrant implementation will allow you to use gitlab locally.

```
git clone git@gitlab.madisonhub.org:madisonhub/do-gitlab.git
cd do-gitlab
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

