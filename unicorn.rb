app_name = 'appreviews'
dir = File.expand_path('..', __FILE__)

worker_processes 2
working_directory dir

timeout 30

listen 3000
listen "/tmp/#{app_name}_unicorn.sock"

pid "/tmp/#{app_name}_unicorn.pid"

stderr_path "/var/log/#{app_name}/unicorn.log"
stdout_path "/var/log/#{app_name}/unicorn.log"
