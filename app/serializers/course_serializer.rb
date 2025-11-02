class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :description
  belongs_to :teacher
  has_many :grades
  has_many :students, through: :grades
end