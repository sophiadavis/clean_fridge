# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :username, :password, :password_confirmation, :delete_count
  has_secure_password
  
  has_many :fridges, dependent: :destroy
  has_many :foods, through: :fridges
  
  before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
#   def increment_delete_count
#   	self.delete_count += 1
#   	
#   end
  
#   private
#   	def create_remember_token
# 		self.remember_token = SecureRandom.urlsafe_base64
#   	end
  private
  	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
  	end
end