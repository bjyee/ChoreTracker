class Task < ActiveRecord::Base
    attr_accessible :id, :name, :points, :active
	
	belongs_to :chore
	validates_presence_of :name
end
