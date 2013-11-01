source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
    gem 'uglifier'
end
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem "haml"
gem 'haml-rails'
gem 'jquery-rails'
gem 'state_machine'
gem 'rest-client'
gem 'simple_form'
group :test do
  gem 'rspec', :require => false
  gem "rspec-rails", :require => false
  gem "webmock"
  gem 'factory_girl_rails'
  gem "wrong"
end
gem 'addressable', :require => 'addressable/uri'
gem 'unicorn-rails'
gem "active_model_serializers", "~> 0.7.0"
group :development do
  gem "pry"
end
