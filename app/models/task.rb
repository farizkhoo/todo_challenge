require_relative '../../config/application'

class Task < ActiveRecord::Base

	def description
		return self.description
	end
end

# require_relative '../../db/config'
# require 'date'

# class Student < ActiveRecord::Base
# # implement your Student model here
# 	validates :email, format: { with: /\w+@\w+\.\w{2}/}
# 	validates :email, uniqueness: true
# 	validate :validate_age

# 	def name
# 		return "#{self.first_name} #{self.last_name}"
# 	end

# 	def age
# 		now = Date.today
#     	age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
# 		return age
# 	end

# 	def validate_age
# 		if self.age < 5
# 			errors.add(:age, 'needs to be older than 5')
# 		end
# 	end

# 	def validate
		
# 	end
# end
