require('sinatra/activerecord')
require('./lib/list')
require('./lib/task')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')
require('pg')


get('/') do
  @tasks = Task.all()
  erb(:index)
end

# get('/list/add') do
#   erb(:add_list)
# end
#
# post('/save/list') do
#   list_name = params.fetch('list_name')
#   new_list = List.new({:name => list_name, :id => nil})
#   new_list.save()
#   @lists = List.all
#   erb(:index)
# end
#
# get('/list/:id') do
#   id = params.fetch("id").to_i
#   @list = List.find(id)
#   erb(:list)
# end
#
post('/save/task') do
  description = params.fetch("task")
  # list_id = params.fetch("list_id").to_i()
  # @list = List.find(list_id)
  @task = Task.new({:description => description, :done => false})
  @task.save()
  @tasks = Task.all()
  erb(:index)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i)
  erb(:task_edit)
end

patch('/tasks/:id') do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i)
  @task.update(description: description)
  @tasks = Task.all()
  erb(:index)
end
