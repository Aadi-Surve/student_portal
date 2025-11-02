class Teacher < ApplicationRecord
  has_many :courses
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :subject, presence: true

  scope :search, ->(query) do
    where("name ILIKE :query OR email ILIKE :query OR phone ILIKE :query OR subject ILIKE :query", 
          query: "%#{query}%")
  end

  scope :by_subject, ->(subject) do
    where(subject: subject) if subject.present?
  end
end
