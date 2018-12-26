require 'newtodo'

RSpec.describe NewToDo do
  it "creates a new instance of the NewToDo class" do
    new_todo = NewToDo.new("Wash clothes")
    expect(new_todo.todo).to eq("Wash clothes")
  end


end
