class Chore < ActiveRecord::Base
    attr_accessible :child_id, :task_id, :due_on, :completed
	
	belongs_to :child
	belongs_to :task
	
	scope :all, :order => :due_on
	scope :upcoming, where('due_on > ?', Time.now.strftime("%Y-%m-%d"))
	scope :past, where('due_on < ?', Time.now.strftime("%Y-%m-%d"))
	scope :incomplete, where('completed = ?', false)
	scope :completed, where('completed = ?', true)

	def status
		return "Pending" if !completed
		"Completed"
	end
end
