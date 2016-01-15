class Language < ActiveRecord::Base
  has_many :language_courses, dependent: :destroy
  has_many :courses, through: :language_courses

  has_many :language_curriculums, dependent: :destroy
  has_many :curriculums, through: :language_curriculums
end
