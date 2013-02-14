class Task < ActiveRecord::Base
  attr_accessible :end_date, :milestone_id, :name, :start_date, :status,:user_id
  belongs_to :milestone
  belongs_to :user
  belongs_to :project 
  validates :name, :presence => true
  validates :status, :inclusion => { :in => %w(Not_Started Started In_Progress Finished),
    :message => "%{value} is not a valid status" }

  def set_status
  	self.status="Finished"
  end
end

