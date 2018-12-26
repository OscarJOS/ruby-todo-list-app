require 'todolist'

RSpec.describe ToDoList do

  todo_list = nil
  before(:each) do
    todo_list = ToDoList.new()
  end


  it "creates a new instance of the ToDoList class" do
    expect(todo_list.is_a?Object).to eq(true)
  end

  it "adds a new todo as a hash to @todos" do
    todo_list.add_new_todo("Buy milk")
    expect(todo_list.todos[0]).to eq({
      todo: "Buy milk",
      completed: false,
      id: 0,
    })
  end
end
