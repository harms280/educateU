class Curriculum < ActiveRecord::Base
  belongs_to :user
  has_many :language_curriculums
  has_many :languages, through: :language_curriculums
  has_many :posts
end
