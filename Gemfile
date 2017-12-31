source 'https://rubygems.org'

gem 'rails', '~> 5.1.0'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'simple_form', '~> 3.3'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers', branch: 'master'
gem 'bower-rails', '~> 0.10.0'

group :development do
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-passenger'
  gem 'puma', '~> 3.0'
  gem 'spring'
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'guard-rails'
  gem 'guard-bundler'
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'dotenv'
  gem 'guard-rspec', require: false
  gem 'byebug'
  gem 'rails-controller-testing'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
  gem 'database_rewinder'
  gem 'capybara'
  gem 'poltergeist'
end

group :production do
  gem 'mysql2'
end

gem 'cancancan'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: 'master'
gem 'immutable-struct'
gem 'wobaduser', git: 'https://github.com/swobspace/wobaduser.git', branch: 'master'
gem 'record_tag_helper', '~> 1.0'
