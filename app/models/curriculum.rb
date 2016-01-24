class Curriculum < ActiveRecord::Base

  # scope :cost, -> (cost) {where cost: cost}
  scope :cur_skill_level, -> (skill_level) {where skill_level: skill_level }
  scope :cur_rating, -> (rating) {where("average_rating >= ?", rating.to_f)}
  scope :cur_organize, -> (organize) {order(organize)}

  belongs_to :user
  has_many :language_curriculums, dependent: :destroy
  has_many :languages, through: :language_curriculums
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :description, :languages, :user_id, presence: true

  def self.search(search)
  	if search
  		where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  	else
  		Curriculum.all
  	end
  end
end
