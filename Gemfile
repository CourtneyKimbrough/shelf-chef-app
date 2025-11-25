source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.5'

gem 'redcarpet'
gem 'rubocop'
gem 'ruby-openai'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# use active record
gem 'sinatra-activerecord'

gem 'dotenv'
gem 'http'

group :development do
  gem 'appdev_support'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'table_print'
end

group :development, :test do
  gem 'grade_runner', '~> 0.0.13'
  gem 'pry'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'capybara'
  gem 'draft_matchers'
  gem 'i18n'
  gem 'rspec'
  gem 'rspec-html-matchers'
  gem 'webdrivers'
  gem 'webmock'
end
