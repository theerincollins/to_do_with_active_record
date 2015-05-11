ENV['RACK_ENV'] = 'test'

require ('rspec')
require ('pg')
require('pry')
require('sinatra/activerecord')
require ('task')
require ('list')

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
  end
end
