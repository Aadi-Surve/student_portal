class Grade < ApplicationRecord
  belongs_to :course
  belongs_to :student
  
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
