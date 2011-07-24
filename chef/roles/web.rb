name 'web'
description 'server'
run_list 'recipe[git]', 'recipe[mysql::server]', 'recipe[nginx]', 'recipe[varnish]', 'recipe[bigshow]'
