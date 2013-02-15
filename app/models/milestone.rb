class Milestone < ActiveRecord::Base
  attr_accessible :end_date, :name, :project_id, :start_date, :status
  has_many :tasks,:dependent=>:destroy
  belongs_to :project
  validates :name, :presence => true
  validates :status, :inclusion => { :in => %w(Not_Started Started In_Progress Finished),
    :message => "%{value} is not a valid status" }

  scope :by_name ,lambda{|names|where("name like ?","%#{names}%") if names.present?}
  scope :by_start_date ,lambda{|start|where("start_date >= ?",Date.parse(start)) if start.present?}
  scope :by_status ,lambda{|stat|where("status like ?","%#{stat}%") if stat.present?}


    def set_status
    	self.status="Finished"
    end
end
