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
	tasks = Task.all.select('id, idx, description, status')
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
	task_array.each do |task|
		puts "#{task[:idx]}".ljust(6) + "#{task[:description]}".split.map(&:capitalize).join(' ').ljust(longest_desc) + "   " + "#{task[:status]}".capitalize
	end
end

def update_index
	def_index = 1
	tasks = Task.all.select('id, idx')
	tasks.each do |task|
		updated_task = Task.find(task[:id])
		updated_task.update(idx: "#{def_index}.")
		def_index += 1
	end
end

input_array = ARGV

if input_array[0] == '--add'
	description = input_array[1]
	status = input_array[2]
	idx = "#{Task.all.count+1}."
	task = Task.new(idx: idx, description: description, status: status)
	task.save
elsif input_array[0] == '--list'
	list_tasks
elsif input_array[0] == '--update'
	task = Task.find_by(idx: "#{input_array[1]}.")
	if task != nil
		task.update(description: input_array[2], status: input_array[3])
	else
		puts "Task number #{input_array[1]} is not found. Are you sure that this is the right task number?"
	end
elsif input_array[0] == '--remove'
	task = Task.find_by(idx: "#{input_array[1]}.")
	if task != nil
		task.destroy
		update_index
	else
		puts "Task number #{input_array[1]} is not found. Are you sure that this is the right task number?"
	end
end

