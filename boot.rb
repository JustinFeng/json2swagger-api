require 'bundler'

Bundler.require :default, (ENV['RACK_ENV'] || :development).to_sym

Dir[File.dirname(__FILE__) + '/lib/ext/*.rb'].each { |f| require f }
