require 'todolist'

RSpec.describe ToDoList do

  todo_list = nil
  before(:each) do
    todo_list = ToDoList.new()
  end


  it "creates a new instance of the ToDoList class" do
    expect(todo_list.is_a?Object).to eq(true)
  end
end
