class Course < ApplicationRecord
  belongs_to :teacher
  has_many :grades
  has_many :students, through: :grades
  
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  validates :credits, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
