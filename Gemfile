source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.6'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'carrierwave'

gem 'mini_magick'

gem "jquery-rails"

gem 'devise'

gem 'geocoder'

gem 'cancancan'

gem 'rails_admin'

gem "ruby-openai" 

gem 'high_voltage'

gem 'fog-aws'

gem "aws-sdk-s3", require: false 

gem 'dotenv-rails'

gem 'unicorn'

gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'

gem 'rack-timeout', require: "rack/timeout/base"

gem 'sassc-rails'

gem 'rexml'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  gem 'capistrano', '3.16.0' 
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'

  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  #gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  #gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
