class User < ActiveRecord::Base
  attr_accessible :user_address, :user_name,:project_ids
  has_many :user_project_relations,:dependent=>:destroy
  has_many :projects ,:through => :user_project_relations
  has_many :tasks
  validates :user_name, :format => { :with => /\A[a-zA-Z]+\z/} 
end
