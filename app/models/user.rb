class User < ActiveRecord::Base
  acts_as_paranoid
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_secure_password

  def self.current_user=(user)
    Thread.current[:user_id] = user
  end

  def self.current_user
    Thread.current[:user_id]
  end
end
