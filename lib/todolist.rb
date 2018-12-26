class ToDoList
  attr_accessor :todos

  def initialize
    @todos = []
    @counter = 0
  end

  def add_new_todo(todo)
    newtodo = NewToDo.new(todo, @counter)
    @counter += 1
    @todos << newtodo.new_todo
  end

  def edit_todo(index, todo)
    @todos[index.to_i][:todo] = todo
  end

  def delete_todo(index)
    @todos.delete_at(index.to_i)
  end

  def complete_todo(index)
    @todos[index.to_i][:completed] = true
  end

  def incomplete_todo(index)
    @todos[index.to_i][:completed] = false
  end

  def delete_done_todos
    @todos.delete_if do |todo|
      todo[:completed] == true
    end
  end
end
