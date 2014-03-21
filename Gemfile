source 'http://rubygems.org'

ruby '1.9.2'
gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

if RUBY_PLATFORM =~ /java/
    gem 'activerecord-jdbc-adapter'
    gem 'activerecord-jdbcpostgresql-adapter'
    gem 'jdbc-postgres'
else
    gem 'pg'
end

gem 'i18n'

gem 'will_paginate'

gem "paperclip", "~> 2.3"

gem 'dynamic_form'

gem 'jquery-rails'

gem 'sass'

gem 'coffee-script'

gem 'responders'

gem 'haml'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

group :assets do
  gem 'therubyracer'
  gem 'uglifier'
end

