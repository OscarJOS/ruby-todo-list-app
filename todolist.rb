require 'sinatra'

class ToDoList
  attr_accessor :todos

  def initialize
    @todos = []
  end

  def add_new_todo(todo)
    newtodo = NewToDo.new(todo)
    @todos << newtodo.new_todo
  end

  def edit_todo(index, todo)
    item_index = index.to_i - 1
    @todos[item_index][:todo] = todo
  end

  def delete_todo(index)
    item_index = index.to_i - 1
    @todos.delete_at(item_index)
  end

  def complete_todo(index)
    item_index = index.to_i - 1
    @todos[item_index][:completed] = true
  end

  def incomplete_todo(index)
    item_index = index.to_i - 1
    @todos[item_index][:completed] = false
  end
end
