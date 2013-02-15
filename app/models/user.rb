class User < ActiveRecord::Base
  attr_accessible :user_address, :user_name,:project_ids,:password_hash,:password_salt
  has_many :user_project_relations,:dependent=>:destroy
  has_many :projects ,:through => :user_project_relations
  has_many :tasks
  validates :user_name, :format => { :with => /\A[a-zA-Z]+\z/} 

  scope :by_name ,lambda{|names|where("user_name like ?","%#{names}%") if names.present?}
  scope :by_address ,lambda{|address|where("user_address like ?","%#{address}%") if address.present?}
end
