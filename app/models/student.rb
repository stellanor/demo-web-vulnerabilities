class Student < ActiveRecord::Base
  validates :name, :github_username, presence: true
  validates :github_username, uniqueness: true
end
