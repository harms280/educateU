class Language < ActiveRecord::Base
  has_many :language_courses, dependent: :destroy
  has_many :courses, through: :language_courses
end
