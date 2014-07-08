require 'digest/sha1'

class AdminUser < ActiveRecord::Base
  attr_accessible :username, :first_name, :last_name, :email, :password
  attr_accessor :password

  has_many :pictures, foreign_key: "author_id"
  has_many :news, foreign_key: "user_id" 
  # only on create, so other attributes of this user can be changed
  validates :username, presence: true, length: { maximum: 100 }
  validates :password, presence: true
  # validates_presence_of :first_name
  # validates_length_of :first_name, :maximum => 100

  # validates_presence_of :last_name
  # validates_length_of :first_name, :maximum => 100

  # validates_presence_of :email
  # validates_length_of :first_name, :maximum => 100

  # validates_length_of :password, :within => 8..25, :on => :create

  before_save :create_hashed_password
  after_save :clear_password
  before_create :create_remember_token

 	scope :sorted, AdminUser.order("first_name ASC")

  def self.authenticate(username="", password="")
  	user = AdminUser.find_by_username(username)
  	if user && user.password_match?(password)
  		return user
  	else
  		return false
  	end
  end

  def password_match?(password="")
  	hashed_password == AdminUser.hash_with_salt(password, salt)
  end


  def self.make_salt(username="")
  	Digest::SHA1.hexdigest("Use #{username} and date #{Time.now}")
  end

  def self.hash_with_salt(password="", salt="")
  	Digest::SHA1.hexdigest("Use #{password} with #{salt}")
  end

  def full_name(username="")
  	user = AdminUser.find_by_username(username)
  	if user.first_name || user.last_name != nil
			return "#{user.first_name} #{user.last_name}"	
  	else
  		return "nil"
  	end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64 
  end

  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end

end
