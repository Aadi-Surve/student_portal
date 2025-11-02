class GradeSerializer < ActiveModel::Serializer
  attributes :id, :value
  belongs_to :student
  belongs_to :course
end