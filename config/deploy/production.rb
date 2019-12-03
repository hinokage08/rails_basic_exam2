server '52.198.200.136', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yamazakiyouichi/.ssh/id_rsa'