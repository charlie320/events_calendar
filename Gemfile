source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use postgres as database for ActiveRecord
gem 'pg'
# Passenger
gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# for rails console
gem 'hirb'

# Use simple_form to make creation of forms simple_form
gem 'simple_form'

#bootstrap-sass is a css library to allow use of bootstrap without using cdn
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

# carrierwave is used to simplify uploading of files
gem 'carrierwave'

# other useful gems
gem 'rspec'

# rails-footnote
# gem 'rails-footnotes', '>= 4.0.0', '<5'

# graphviz
# gem 'graphviz', '~> 0.4.0'
# gem 'ruby-graphviz', '~> 1.2', '>= 1.2.3'

# validate date and time
gem 'validates_timeliness', '~> 4.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem "rails-erd"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
end
