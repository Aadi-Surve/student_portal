class Student < ApplicationRecord
  has_many :grades
  has_many :courses, through: :grades
  
  # 👇 Add Active Storage association
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true
  validates :phone, presence: true

  # 👇 Custom scopes
  scope :search, ->(query) do
    where("name ILIKE :query OR email ILIKE :query OR phone ILIKE :query", query: "%#{query}%")
  end

  scope :by_course, ->(course_id) do
    joins(:courses).where(courses: { id: course_id }) if course_id.present?
  end

  # 👇 Method to generate public image URL
  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
