class Course < ApplicationRecord
  belongs_to :school
  has_many :comments

  validates :school_id, presence: true

  validates :price, presence: true, length: { maximum: 255 }
  validates :term, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }

end
