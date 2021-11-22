# todos_conntroller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_details_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todolist = Todo.create!(todo_text: todo_text, due_date: ddate, completed: false)
    response = "Hey, your new todo is created with the id #{new_todolist.id}"
    render plain: response
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo_list = Todo.find(id)
    todo_list.completed = completed
    todo_list.save!
    render plain: "Updated todo completed status to #{completed}"
  end
end
