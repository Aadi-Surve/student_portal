json.status "success"
json.count @courses.count
json.data @courses do |course|
  json.name course.name
  json.code course.code
  json.credits course.credits
  json.teacher course.teacher.name if course.teacher.present?
end
