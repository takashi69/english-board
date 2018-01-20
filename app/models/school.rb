class School < ApplicationRecord
  has_many :courses
  has_many :comments

end
