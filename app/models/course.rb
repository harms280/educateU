class Course < ActiveRecord::Base
  has_many :language_courses, dependent: :destroy
  has_many :languages, through: :language_courses

  has_many :reviews
  belongs_to :user

  def self.search(search)
  	if search
  		where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%").order(:name)
  	else
  		Course.all.order(:name)
  	end
  end
end
