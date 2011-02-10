class Child < ActiveRecord::Base
    attr_accessible :id :first_name, :last_name, :active
	
	belongs_to :chore
	validates_numericality_of :id
	validates_presence_of :first_name, :last_name
	validates_inclusion_of :active, :in => [true,false]
	
	def name
		"#{first_name} #{last_name}"
	end

end
