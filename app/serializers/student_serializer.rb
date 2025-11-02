class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :enrollment_date
  has_many :grades
  has_many :courses, through: :grades
end