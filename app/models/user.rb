class User < ApplicationRecord
  has_secure_password
  has_one :playlist
  has_many :songs, through: :playlist
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email, :first_name, :last_name, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :email, uniqueness: true
  validates :password, length: {in: 8..32}
  validates :password, presence: true

  def name
    return "#{self.first_name} #{self.last_name}"
  end

  before_save :email_lowercase
  def email_lowercase
    self.email.downcase!
  end


end
