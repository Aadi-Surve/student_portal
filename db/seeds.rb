# Create sample students
students_data = [
  {
    name: "John Smith",
    email: "john.smith@example.com",
    enrollment_number: "2025001",
    date_of_birth: "2003-05-15",
    phone: "1234567890",
    address: "123 College St, City"
  },
  {
    name: "Emma Johnson",
    email: "emma.j@example.com",
    enrollment_number: "2025002",
    date_of_birth: "2004-03-20",
    phone: "2345678901",
    address: "456 University Ave, City"
  },
  {
    name: "Michael Brown",
    email: "michael.b@example.com",
    enrollment_number: "2025003",
    date_of_birth: "2003-08-10",
    phone: "3456789012",
    address: "789 Campus Road, City"
  },
  {
    name: "Sarah Wilson",
    email: "sarah.w@example.com",
    enrollment_number: "2025004",
    date_of_birth: "2004-01-25",
    phone: "4567890123",
    address: "321 School Lane, City"
  },
  {
    name: "David Lee",
    email: "david.lee@example.com",
    enrollment_number: "2025005",
    date_of_birth: "2003-11-30",
    phone: "5678901234",
    address: "654 Education Blvd, City"
  }
]

puts "Creating students..."
students_data.each do |student_data|
  student = Student.create!(student_data)
  puts "Created student: #{student.name}"
end

# Create sample teachers
teachers_data = [
  {
    name: "Dr. Robert Anderson",
    email: "r.anderson@example.com",
    phone: "6789012345",
    subject: "Mathematics"
  },
  {
    name: "Prof. Maria Garcia",
    email: "m.garcia@example.com",
    phone: "7890123456",
    subject: "Physics"
  },
  {
    name: "Dr. James Wilson",
    email: "j.wilson@example.com",
    phone: "8901234567",
    subject: "Computer Science"
  }
]

puts "\nCreating teachers..."
teachers_data.each do |teacher_data|
  teacher = Teacher.create!(teacher_data)
  puts "Created teacher: #{teacher.name}"
end

# Create sample courses
courses_data = [
  {
    name: "Advanced Mathematics",
    code: "MATH301",
    description: "Advanced topics in mathematics including calculus and linear algebra"
  },
  {
    name: "Physics Fundamentals",
    code: "PHYS201",
    description: "Introduction to basic physics concepts and mechanics"
  },
  {
    name: "Programming Basics",
    code: "CS101",
    description: "Introduction to programming concepts and algorithms"
  }
]

puts "\nCreating courses..."
courses_data.each_with_index do |course_data, index|
  course = Course.create!(course_data.merge(teacher: Teacher.all[index]))
  puts "Created course: #{course.name}"
end

# Create sample grades
puts "\nCreating grades..."
Student.all.each do |student|
  Course.all.each do |course|
    grade = Grade.create!(
      student: student,
      course: course,
      score: rand(60..100)  # Random score between 60 and 100
    )
    puts "Created grade for #{student.name} in #{course.name}: #{grade.score}"
  end
end

puts "\nSeeding completed successfully!"
