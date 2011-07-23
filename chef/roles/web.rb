name 'web'
description 'server'
run_list 'recipe[mysql]', 'recipe[nginx]', 'recipe[varnish]'
