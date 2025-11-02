json.status "success"
json.count @students.count

json.data @students do |student|
  json.name student.name
  json.email student.email
  json.phone student.phone
  json.enrollment_date student.enrollment_date.strftime("%Y-%m-%d") if student.enrollment_date
end
