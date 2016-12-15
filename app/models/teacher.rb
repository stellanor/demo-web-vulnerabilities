require 'bcrypt'

class Teacher < ActiveRecord::Base
  validates :name, :username, presence: true
  validates :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(username, plain_text_password)
    user = Teacher.find_by(username: username)
    if user && user.password == plain_text_password
      user
    else
      nil
    end
  end
end
