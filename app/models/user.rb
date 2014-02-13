require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@\w+\.\w+/}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
