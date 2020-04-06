source 'https://rubygems.org'

gem 'rails', '~> 5.2.0'
gem 'sqlite3'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '>= 4.2'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '>= 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails-i18n', '~> 5.0.0'
gem 'bootsnap', require: false

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-yarn'
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'guard-rails'
  gem 'guard-bundler'
  gem 'web-console', '~> 3.0'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'dotenv'
  gem 'guard-rspec', require: false
  gem 'byebug'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_rewinder'
  gem 'capybara'
  gem 'poltergeist'
end

group :production do
  gem 'mysql2'
end

gem 'simple_form'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers', branch: 'master'
gem 'font-awesome-sass'
gem 'cancancan'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: '4-0-stable'
gem 'wobaduser', git: 'https://github.com/swobspace/wobaduser.git', branch: 'master'
gem 'immutable-struct'
gem 'record_tag_helper', '~> 1.0'
gem 'rails-controller-testing'
