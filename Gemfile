source 'https://rubygems.org'

gem 'rails', '~> 7.1.0'
gem 'sqlite3' #, '~> 1.4'
gem 'puma'
gem "sprockets-rails"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails-i18n', '~> 7.0.0'
gem 'bootsnap', require: false

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-yarn'
  gem 'guard'
  gem 'web-console', '>= 4.1.0'
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
end

group :production do
  gem 'mysql2'
end

gem 'simple_form'
gem 'wobapphelpers', git: 'https://github.com/swobspace/wobapphelpers', branch: 'master'
gem 'cancancan'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: 'master'
gem 'wobaduser', git: 'https://github.com/swobspace/wobaduser.git', branch: 'master'
gem 'immutable-struct'
gem 'record_tag_helper', '~> 1.0'
gem 'rails-controller-testing'


# Use Redis for Action Cable
gem 'redis', '>= 4.0'

gem "turbo-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "stimulus-rails"

# for deployment
gem "ed25519"
gem "bcrypt_pbkdf"

gem "rack", "<= 2.99"

