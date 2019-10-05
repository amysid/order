source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# gem 'sqlite3','~> 1.3.6'
# Use Puma as the app server
gem 'puma', '~> 3.12'
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1', '>= 4.1.20'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'pry', '~> 0.12.2'
gem 'turbolinks', '~> 5.2'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.8'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'alertifyjs-rails', '~> 1.11', '>= 1.11.1'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'jquery-validation-rails', '~> 1.19'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'

gem 'momentjs-rails', '~> 2.20', '>= 2.20.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17', '>= 4.17.47'
gem 'nested_form', '~> 0.3.2'
gem 'cloudinary', '~> 1.11', '>= 1.11.1'
gem 'fast_jsonapi', '~> 1.5'
gem 'oj', '~> 3.9', '>= 3.9.1'
gem 'pagy', '~> 3.5', '>= 3.5.1'
# gem 'elasticsearch-model', '~> 7.0'
# gem 'elasticsearch-rails', '~> 7.0'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4', '>= 1.4.1', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.0', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'capistrano3-nginx', '~> 2.1', '>= 2.1.6'
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rvm', '~> 0.1.2', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '~> 1.5', require: false
  gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1',   require: false

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 3.7'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.14'
  gem 'selenium-webdriver', '~> 3.141'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '~> 2.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'wicked_pdf', '~> 1.2', '>= 1.2.2'
gem 'wkhtmltopdf-binary'
gem 'roo'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
