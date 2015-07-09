# Sample app Rails 4

http://railstutorial.jp/book/ruby-on-rails-tutorial?version=4.0#cha-static-pages

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [Ansible](http://www.ansible.com)

## How To Build The Virtual Machine

Vagrant:

    host $ vagrant plugin install vagrant-vbguest

Building the virtual machine:

    host $ git clone https://github.com/katsuhiko/template-rails-ansible.git
    host $ cd template-rails-ansible
    host $ vagrant up

## How to run RSpec

    guest $ bundle install
    guest $ bundle exec rake db:create
    guest $ bundle exec rake db:migrate
    quest $ bundle exec rspec

## How To New Rails Plugin

* https://gist.github.com/tomoyukiinoue/7968556
* http://www.andrewhavens.com/posts/27/how-to-create-a-new-rails-engine-which-uses-rspec-and-factorygirl-for-testing/
