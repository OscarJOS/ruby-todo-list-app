require 'sinatra'

class NewToDo
  attr_accessor :todo, :completed

  def initialize(todo)
    @todo = todo
    @completed = false
  end

  def new_todo
    {
      todo: @todo,
      completed: @completed
    }
  end
end
