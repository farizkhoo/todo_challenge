# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #
def LongestString(array)
	longest_string = ''
	array.each do |string|
		if string.length > longest_string.length
			longest_string = string
		end
	end
	return longest_string.length
end

def list_tasks
	task_array = []
	tasks = Task.all
	tasks.each do |task|
		task_array << task
	end

	desc_array = []
	task_array.each do |task|
		desc_array << task[:description]
	end

	longest_desc = LongestString(desc_array)
	if longest_desc < 11
		longest_desc = 11
	end
	
	puts "No.   " + "Description".ljust(longest_desc) + "   Status"
	puts "===   " + "===========".ljust(longest_desc) + "   ======"
	tasks.each_with_index do |task,index|
		puts "#{index+1}.".ljust(6) + "#{task[:description]}".split.map(&:capitalize).join(' ').ljust(longest_desc) + "   " + "#{task[:status]}".capitalize
	end
end

def list_instructions
	puts ""
	puts "=============================================="
	puts "Below are the list of commands you can execute"
	puts "=============================================="
	puts ""
	puts "  --add (description) (status)            -> adds an entry into the todo list"
	puts "  --help                                  -> displays commands"
	puts "  --list                                  -> list all the tasks in the database"
	puts "  --remove (index)                        -> remove tasks using index"
	puts "  --update (index) (description) (status) -> updates tasks using index"
	puts ""
end

input_array = ARGV

if input_array[0] == '--add'
	description = input_array[1]
	status = input_array[2]
	# idx = "#{Task.all.count+1}."
	task = Task.new(description: description, status: status)
	task.save
elsif input_array[0] == '--list'
	list_tasks
elsif input_array[0] == '--update'
	if Task.count < input_array[1]
		puts "Task number #{input_array[1]} is not found. Are you sure that this is the right task number?"
	else
		task = Task.first(input_array[1]).last
		task.update(description: input_array[2], status: input_array[3])
	end

elsif input_array[0] == '--remove'
	if Task.count < input_array[1]
		puts "Task number #{input_array[1]} is not found. Are you sure that this is the right task number?"
	else
		task = Task.first(input_array[1]).last
		task.destroy
	end
elsif input_array[0] == '--help'
	list_instructions
else
	puts "type --help for help"
end

