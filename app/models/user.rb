require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@\w+\.\w+/}

  has_many :created_events, :class_name => 'Event', foreign_key: 'user_id'
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
