require "active_record"
require "./connect_db.rb"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end
  def overdue?
    due_date<Date.today
  end
  def due_later?
    due_date>Date.today
  end  
  def self.overdue
    where(due_date:Date.today)
  end

  def self.due_today
    where(due_date: Date.today)
  end

  def self.due_later
    where(due_date: Date.today)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.map { |todolist| todolist.to_displayable_string }
    puts "\n\n"
    puts "Due Today\n"
    puts due_today.map { |todolist| todolist.to_displayable_string }
    puts "\n\n"
    puts "Due Later\n"
    puts due_later.map { |todolist| todolist.to_displayable_string }
    puts "\n\n"
  end

  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  def self.add_task(todo)
    todo_text = todo[:todo_text]
    due_date = Date.today + todo[:due_in_days]
    create!(todo_text: todo_text, due_date: due_date, completed: false)
  end

  
  def self.mark_as_complete(todo_id)
    todo_list = find(todo_id)
    todo_list.completed = true
    todo_list.save
    return todo_list
  end
end
end
