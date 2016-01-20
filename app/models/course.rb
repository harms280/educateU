class Course < ActiveRecord::Base

  scope :cost, -> (cost) {where cost: cost}
  scope :skill_level, -> (skill_level) {where skill_level: skill_level }
  scope :rating, -> (rating) {where("average_rating >= ?", rating.to_f)}



  has_many :language_courses, dependent: :destroy
  has_many :languages, through: :language_courses

  has_many :reviews
  belongs_to :user

  validates :name, :url, :description, :cost, :skill_level, :languages, presence: true
  validates :url, :name, uniqueness: true

  def self.search(search)
  	if search
  		where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  	else
  		Course.all
  	end
  end
end
