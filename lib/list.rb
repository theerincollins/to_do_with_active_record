class List < ActiveRecord::Base
  has_many(:tasks)

#
#
#   define_singleton_method(:find) do |id|
#     found_list = nil
#     List.all().each() do |list|
#       if list.id().==(id)
#         found_list = list
#       end
#     end
#     found_list
#   end
#
#   define_method(:get_tasks) do
#     list_tasks = []
#     tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
#     tasks.each() do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       list_tasks.push(Task.new({:description => description, :list_id => list_id}))
#     end
#     list_tasks
#   end
end
