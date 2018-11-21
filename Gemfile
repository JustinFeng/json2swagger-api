source 'http://rubygems.org'

ruby '2.5.1'

gem 'grape'
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
