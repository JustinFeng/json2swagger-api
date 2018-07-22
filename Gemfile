source 'http://rubygems.org'

ruby '2.5.0'

gem 'grape'
gem 'grape-swagger'
gem 'rack-cors', require: 'rack/cors'
gem 'rake'

group :development, :test do
  gem 'byebug'
end

group :test, :ci do
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop', require: false
end
