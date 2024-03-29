source 'https://rubygems.org'

ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Use dotenv to manage environment variables
gem 'dotenv-rails', groups: %i[development test], require: 'dotenv/rails-now'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# User Slim for HTML Template
gem 'slim-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use Simple Form for extended form builder
gem 'simple_form'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use Repsonders for responses to different formats
gem 'responders'
# Use WillPaginate for pagination
gem 'will_paginate-bootstrap'
# Use Devise for authentication
gem 'devise'
# Use CB ActiveAdmin for default backend
gem 'activeadmin', '~> 1.0.0'
gem 'material_active_admin', git: 'https://github.com/cleverbanana/cl0000-cb06-cb-backend-theme.git', tag: '1.0.4pre'

# Use fontawesome for default icons
gem 'font-awesome-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Use Bootstrap as the CSS framework
gem 'bootstrap-sass', '~> 3.2.0.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Draper as decorator - Using 3.0.0.pre1 for Rails 5 compatibility issue
gem 'draper', '3.0.0.pre1'
# Use Google Analytics
gem 'google-analytics-rails', '1.1.0'
# Generate Sitemap
gem 'sitemap'
# Use Rest-Client for 3rd Party API
gem 'rest-client'
# Use RORvsWild for app monitoring
gem 'rorvswild'

# Uploader
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-mimetype-fu'
gem 'fog'
gem 'rmagick'

# Tagging
gem 'acts-as-taggable-on', '~> 4.0'
# Use Friendly ID for slugs
gem 'friendly_id', '~> 5.1.0'
# Browser detection
gem 'browser'
# Adobe Typekit
gem 'typekit-rails'
# Use ActAsList for sorting records
gem 'acts_as_list'
# Use Responsive Images
gem 'responsive_images'

# Mailchimp Mailer
gem 'gibbon'
gem 'mandrill-api'

# Image Placeholder
gem 'holder_rails'

# Rails 5 missing gem support
# gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use Faker to create fake data
  gem 'faker'
  # Use Interactive Editor for browser debug
  gem 'interactive_editor'
  # Use Letter Opener to debug email on development
  gem 'letter_opener'
end

group :test do
  # Validation
  gem 'shoulda-matchers', '~> 3.0', require: false
  # Use RSpec as Testing Framework
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.6'
  # Use FactoryBot to generate fake data
  gem 'factory_bot_rails'
  # Browser testing
  gem 'capybara'
  # gem 'capybara-webkit', '~> 1.14.0'
  # gem 'capybara-screenshot'
  gem 'database_cleaner'
end

group :development do
  # Rename Rails Project
  gem 'rename'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
