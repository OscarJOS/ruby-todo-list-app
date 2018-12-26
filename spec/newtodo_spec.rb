require 'newtodo'

RSpec.describe NewToDo do
  new_todo = nil

  before(:each) do
    new_todo = NewToDo.new("Wash clothes")
  end

  it "creates a new instance of the NewToDo class" do
    expect(new_todo.is_a?Object).to eq(true)
  end

  it "creates a new instance of the NewToDo class with 'Wash clothes' as the value of @todo'" do
    expect(new_todo.todo).to eq("Wash clothes")
  end

  it "creates a new instance of the NewToDo class with false as the value of @completed" do
    expect(new_todo.completed).to eq(false)
  end


  #
  # it "creates a new instance of the NewToDo class" do
  #   new_todo = NewToDo.new("Wash clothes")
  #   expect(new_todo.todo).to eq("Wash clothes")
  # end


end
