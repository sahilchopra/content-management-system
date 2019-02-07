# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
begin
  require 'sidekiq/web'
rescue 
  puts 'error'
end
run Rails.application
