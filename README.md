🧑‍💻 Student Portal – Backend (Ruby on Rails)

A simple Student Management System built using Ruby on Rails, allowing you to manage students, their grades, courses, and images efficiently.
Supports both web interface and RESTful APIs for integration with frontend or Postman.

🚀 Features

Add, edit, view, and delete students

Upload and display profile images using Active Storage

Assign courses and grades to students

Search and filter students by course or name

Fully functional API endpoints (JSON) for integration

Database: PostgreSQL / SQLite (development)

🏗️ Tech Stack
Component	Technology
Backend	Ruby on Rails 6 / 7
Database	PostgreSQL / SQLite
File Storage	Active Storage
API Testing	Postman
Authentication	Devise (optional)
⚙️ Setup Instructions

Clone the repository

git clone https://github.com/<your-username>/student_portal.git
cd student_portal


Install dependencies

bundle install


Setup database

rails db:create db:migrate


Start the Rails server

rails server


Visit 👉 http://localhost:3000

Run API using Postman

Base URL: http://localhost:3000/api/v1/students

Methods:

GET /students → list all students

POST /students → create student

PATCH /students/:id → update student

DELETE /students/:id → delete student

📸 Image Upload (Active Storage)

Upload image when creating/updating a student

Image preview visible on both dashboard and show page

Works via both Rails form and Postman multipart upload

📄 API Response Example
{
  "status": "success",
  "message": "Student updated successfully",
  "data": {
    "id": 1,
    "name": "Aaditya Surve",
    "email": "surveaadi232004@gmail.com",
    "image_url": "http://localhost:3000/rails/active_storage/blobs/..."
  }
}

👨‍💻 Author

Aaditya Surve
