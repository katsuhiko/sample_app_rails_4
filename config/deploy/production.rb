require 'aws-sdk-core'

# Shared Credentials を利用する。 see: http://muramasa64.fprog.org/diary/?date=20150217
ec2 = Aws::EC2::Client.new(region: fetch(:aws_region))

# タグと起動中の EC2 で対象を絞り込む。
ec2_filtered = ec2.describe_instances(
    filters:[
        {name: "tag:env", values: [fetch(:rails_env)]},
        {name: "tag:role", values: [fetch(:aws_tag_role)]},
        {name: 'instance-state-name', values: ['running']}
    ])

# TODO deploy 用のサーバーを用意し、private_ip_address を利用して、VPC内から SSH したほうが良い。
instances = ec2_filtered.reservations.map(&:instances).flatten.map(&:public_ip_address)

role :app, *instances
role :web, *instances
role :db, [instances.first]
server *instances,
    user: fetch(:deploy_user),
    ssh_options: {
        forward_agent: true,
        auth_methods: ['publickey'],
        # if you want to debug capistrano set verbose to debug
        # verbose: :debug,
        keys: fetch(:deploy_ssh_keys)
    }

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
