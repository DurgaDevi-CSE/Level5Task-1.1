class Todo < ActiveRecord::Base
  def self.today_day
    where("ddate = ?", Date.today)
    where(ddate: Date.today)
  end
  def today_day?
    ddate == Date.today
  end
  def self.overduedate
    where("ddate < ?", Date.today)
  end

  def self.ldate
    where("ddate > ?", Date.today)
  end
  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], ddate: Date.today + h[:due_in_days], completed: false)
  end

  def self.mark_as_complete!(todo_id)
    todolist= Todo.find(todo_id)
    todolist.completed = true
    todolist.save
    todolist
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overduedate.map { |x| x.to_displayable_string }
    puts "\n\n"
    puts "Due Today\n"
    puts today_day.map { |x| x.to_displayable_string }
    puts "\n\n"
    puts "Due Later\n"
    puts ldate.map { |x| x.to_displayable_string }
    puts "\n\n"
  end
  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = today_day? ? nil : ddate
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  def self.add_task(x)
    todo_text = x[:todo_text]
    ddate = Date.today + todo[:due_in_days]
    create!(todo_text: todo_text, ddate: ddate, completed: false)
  end
  def self.mark_as_complete(todo_id)
    todo_list = find(todo_id)
    todo_list.completed = true
    todo_list.save
    return todo_list
  end
end
end
