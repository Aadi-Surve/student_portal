class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :subject
  has_many :courses
end