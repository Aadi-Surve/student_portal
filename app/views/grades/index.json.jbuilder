json.status "success"
json.count @grades.count
json.data @grades do |grade|
  json.student grade.student.name
  json.course grade.course.name
  json.grade grade.value  # ← changed from grade.grade to grade.value
end
