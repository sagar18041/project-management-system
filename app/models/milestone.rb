class Milestone < ActiveRecord::Base
  attr_accessible :end_date, :name, :project_id, :start_date, :status
  has_many :tasks,:dependent=>:destroy
  belongs_to :project
  validates :name, :presence => true
  validates :status, :inclusion => { :in => %w(Not_Started Started In_Progress Finished),
    :message => "%{value} is not a valid status" }

    def set_status
    	self.status="Finished"
    end
end
