class Project < ActiveRecord::Base
  attr_accessible :project_description, :project_name, :start_date, :end_date, :user_ids,:status
  has_many :user_project_relations,:dependent=>:destroy
  has_many :users ,:through => :user_project_relations
  has_many :milestones,:dependent=>:destroy
  has_many :tasks ,:through => :milestones
  validates :project_name, :presence => true
  validates :status, :inclusion => { :in => %w(Not_Started Started In_Progress Finished),
    :message => "%{value} is not a valid status" }
  validate :end_date_less_than_start_date
  
  def end_date_less_than_start_date
  	if start_date > end_date
  		self.errors.add(:end_date,"End date cannot be less than start date")
  	end  	
  end  

  def set_status
    self.status="Finished"
  end
end
