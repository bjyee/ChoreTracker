class Task < ActiveRecord::Base
    attr_accessible :id, :name, :points, :active
	
	belongs_to :chore
	validates_numericality_of :id
	validates_presence_of :name
	validates_as_positive_integer :points
	validates_inclusion_of :active, :in => [true,false]
end
