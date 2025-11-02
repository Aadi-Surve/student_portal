# Top-level response metadata
json.status "success"
json.count @teachers.count

# Main data array
json.data @teachers do |teacher|
  json.name teacher.name
  json.email teacher.email
  json.phone teacher.phone
  json.subject teacher.subject
end
