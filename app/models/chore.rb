class Chore < ActiveRecord::Base
    attr_accessible :child_id, :task_id, :due_on, :completed
	
	belongs_to :child
	belongs_to :task
	
	validates_date :due_on
	
	scope :all, :order => :due_on
	scope :upcoming, :conditions => [:due_on > Time.now.strftime("%Y-%m-%d")]
	scope :past, :conditions => [:due_on < Time.now.strftime("%Y-%m-%d")]
	scope :incomplete, :conditions => [:completed = false]
	scope :completed, :conditions => [:completed = true]

	def status
		return "Pending" if !completed
		"Completed"
	end
end
