# config/puma.rb

max_threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
min_threads_count = max_threads_count
threads min_threads_count, max_threads_count

worker_count = Integer(ENV['WEB_CONCURRENCY'] || 2)

if RbConfig::CONFIG['host_os'] !~ /mswin|mingw|cygwin/
  workers worker_count
end

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'production'

on_worker_boot do
  # Configurar la conexión a la base de datos para cada worker.
  ActiveRecord::Base.establish_connection
end
