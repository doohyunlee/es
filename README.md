# elastic 5.0  [ 작성중 ] 
vagrant development environment construct

## Setting Info
Type | VM Spec | Data Shared | spec | php.ini setting
------------ | ------------- | ------------- | ------------- | -------------
php7 | memory:1024, cpus:1 | /var/www/html/data | apache2, php7, php gd, curl, redis, php mcrypt | short_open_tag=on, timezone=Asia/Seoul


> Update Logs
> - 2017-02-24 1.0.0 Version PHP7


## WINDOWS

### File Download
   * virtualBox install( https://www.virtualbox.org/ )
   * vagrant install( https://www.vagrantup.com/ )
   
### bk_vagrant git clone or download
   
### "vagrant up --provision" command input [ workspace root ]  // Use --provision option only at first setting

Vagrant Account
* user : vagrant / vagrant
* root : root / vagrant

Vagrant Instruction
* workspace root move
* vagrant instruction action
  - vagrant up ( vagrant start ) or config.vm.provision add -> vagrant up --provision
  - vagrant halt ( vagrant halt )
  - vagrant reload ( vagrant reload )
  - vagrant box list ( vagrant box list )
  - vagrant box remove {vagrant name} ( vagrant box remove )
* vagrant up check -> vm

![Image of Yaktocat](http://bkjeon1614.vps.phps.kr/bkjeon/uploads/cache/post/2017/02/thumb-994f09ae65ffed35f3690f4c33b080d0_600x0.png)
