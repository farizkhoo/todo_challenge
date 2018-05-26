# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #
input_array = ARGV

p Task.all.count

if input_array[0] == '--add'
	description = input_array[1]
	status = input_array[2]
	idx = "#{Task.all.count+1}."
	task = Task.new(idx: idx, description: description, status: status)
	task.save
elsif input_array[0] == '--list'
	all_tasks = Task.select("idx, description, status")
	p all_tasks

end

# p 	task = Task.new(index:'1.', description:'buy groceries', status:'undone')
# 	task.save
