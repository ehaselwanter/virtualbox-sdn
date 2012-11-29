# Software Defined Networking Environment with Trema

## Rational 

Explore OpenFlow in reproducible development environment. This box is based on Ubuntu and installs everything needed to get started with [Trema](http://trema.github.com/trema/) and complements this [trema turotial](http://trema-tutorial.heroku.com/) 

## Install

be sure to install vagrant from [[http://downloads.vagrantup.com/]], NOT the gem version!

- install rvm and trust environment ([[https://rvm.io]])
- `bundle install` ([[http://gembundler.com]])
- `bundle exec librarian-chef install` ([[https://github.com/applicationsonline/librarian]])
- `vagrant up`

## Use

Use `vagrant ssh` to connect to the vm and open three terminals

Run the controller in terminal 1:

```bash
cd examples
trema run learning_switch.rb -c learning-switch.conf 
```

Watch the network in terminal 2:

```bash
vagrant@vagrant:~$ trema dump_flows 0xabc
NXST_FLOW reply (xid=0x4):

vagrant@vagrant:~$ trema show_stats host2
Sent packets:

Received packets:

vagrant@vagrant:~$  watch trema show_stats host2
```

Send packets in terminal 3:	

```bash
trema send_packet --source host1 --dest host2
trema send_packet --source host1 --dest host2
trema send_packet --source host2 --dest host1
trema send_packet --source host2 --dest host1
```

Check again in terminal 2:

```bash
vagrant@vagrant:~$ trema dump_flows 0xabc
vagrant@vagrant:~$ trema show_stats host1
vagrant@vagrant:~$ trema show_stats host2
```

