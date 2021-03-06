[![Circle CI](https://circleci.com/gh/katsuhiko/sample_app_rails_4.svg?style=shield)](https://circleci.com/gh/katsuhiko/sample_app_rails_4)
[![Code Climate](https://codeclimate.com/github/katsuhiko/sample_app_rails_4/badges/gpa.svg)](https://codeclimate.com/github/katsuhiko/sample_app_rails_4)
[![Test Coverage](https://codeclimate.com/github/katsuhiko/sample_app_rails_4/badges/coverage.svg)](https://codeclimate.com/github/katsuhiko/sample_app_rails_4/coverage)
[![Dependency Status](https://gemnasium.com/katsuhiko/sample_app_rails_4.svg)](https://gemnasium.com/katsuhiko/sample_app_rails_4)

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

## Create files

~/.ssh/amazon.pem

~/.aws/credentials

    [default]
    aws_access_key_id = XXXXXXXX
    aws_secret_access_key = XXXXXXXX

## How to run RSpec

    guest $ bundle install
    guest $ bundle exec rake rails:update:bin
    guest $ bundle exec rake db:create
    guest $ bundle exec rake db:migrate
    quest $ bundle exec rspec
    
    guest $ bundle exec spring rspec
    
    quest $ bundle exec guard -p -l 10
