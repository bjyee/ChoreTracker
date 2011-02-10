class Child < ActiveRecord::Base
    attr_accessible :id, :first_name, :last_name, :active
	
	belongs_to :chore
	validates_presence_of :first_name, :last_name
	
	def name
		"#{first_name} #{last_name}"
	end

end
