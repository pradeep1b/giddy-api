# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg', '~> 0.18.2'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0', '>= 5.0.2'
gem 'redis', '~> 3.0'

gem 'aws-sdk', '~> 2.3'
gem 'paperclip', '~> 5.0.0'

gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'fabrication'
  gem 'faker', '~> 1.7', '>= 1.7.3'
  gem 'rspec-rails', '~> 3.5.0'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'mailcatcher', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
