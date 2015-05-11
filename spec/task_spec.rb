require('spec_helper')

describe (Task) do
  describe("#list") do
    it("tells which list it belongs to") do
      list = List.create(name: "list")
      task = Task.create(description: "task", list_id: list.id)
      expect(task.list).to(eq(list))
    end
  end

  describe(".not_done") do
    it ("returns the task that are not done") do
      not_done_task1 = Task.create({:description => "get this thing done", :done => false})
      not_done_task2 = Task.create(description: "get this other thing done", done: false)
      not_done_tasks = [not_done_task1, not_done_task2]
      done_task = Task.create(description: "i'm done with this", done: true)
      expect(Task.not_done()).to(eq(not_done_tasks))
    end
  end



  # describe("#list_id") do
  #   it("lets you read the list ID out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.list_id()).to(eq(1))
  #   end
  # end


end
