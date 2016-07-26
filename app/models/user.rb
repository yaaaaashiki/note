class User < ActiveRecord::Base
  attr_accessor :email_or_name
  acts_as_paranoid
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #update のときは認証なしに変更可能に
  validates :password, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, on: :update, allow_blank: true
  validates :joinyear, :role, :status, presence: :true
  has_secure_password

  has_one :admin_user

  enum role: { professor: 1, assistant_professor: 2, master: 3, bachelor: 4 }
  enum status: { enrolled: 1, graduation: 2 }

  def self.email?(string)
    string =~ VALID_EMAIL_REGEX
  end

  # current_user_id にすべき
  def self.current_user=(user)
    Thread.current[:user_id] = user.id
  end

  def self.current_user
    User.find_by id: Thread.current[:user_id]
  end

  def self.reset_current_user
    Thread.current[:user_id] = nil
  end

  def admin?
    admin_user.present?
  end
end
