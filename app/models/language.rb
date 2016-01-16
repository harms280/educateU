class Language < ActiveRecord::Base
  has_many :language_courses, dependent: :destroy
  has_many :courses, through: :language_courses

  has_many :language_curriculums, dependent: :destroy
  has_many :curriculums, through: :language_curriculums

  def self.search(search)
  	if search
  		where("lower(name) LIKE ?", "%#{search.downcase}%")
  	else
  		find(:all)
  	end
  end

end
