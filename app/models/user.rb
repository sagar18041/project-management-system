class User < ActiveRecord::Base
  attr_accessible :user_address, :user_name,:project_ids,:password,:password_confirmation
  has_many :user_project_relations,:dependent=>:destroy
  has_many :projects ,:through => :user_project_relations
  has_many :tasks
  validates :user_name, :format => { :with => /\A[a-zA-Z]+\z/} 
  attr_accessor :password
  scope :by_name ,lambda{|names|where("user_name like ?","%#{names}%") if names.present?}
  scope :by_address ,lambda{|address|where("user_address like ?","%#{address}%") if address.present?}
  validates :user_name, :presence => true
  validates :password, :presence => true

  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  def self.authenticate(name, password)
      #binding.pry
    user = find_by_user_name(name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
