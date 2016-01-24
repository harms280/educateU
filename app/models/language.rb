class Language < ActiveRecord::Base
  has_many :language_courses, dependent: :destroy
  has_many :courses, through: :language_courses

  has_many :language_curriculums, dependent: :destroy
  has_many :curriculums, through: :language_curriculums

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.language_search(search)
  	if search
  		where("lower(name) LIKE ?", "%#{search.downcase}%").order(:name)
  	else
  		Language.all.order('lower(name)')
  	end
  end

  def self.search(search)
  	if search
  		where("lower(name) LIKE ?", "%#{search.downcase}%").order(:name)
  	else
  		Language.all.order('lower(name)')
  	end
  end

end
