class Course < ActiveRecord::Base
  has_many :language_courses, dependent: :destroy
  has_many :languages, through: :language_courses

  has_many :reviews
  belongs_to :user
end
