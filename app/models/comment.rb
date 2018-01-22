class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :course
#  belongs_to :school

#  validates :user_id, presence: true
#  validates :course_id, presence: true
#  validates :school_id, presence: true

end
