class Curriculum < ActiveRecord::Base

  # scope :cost, -> (cost) {where cost: cost}
  scope :cur_skill_level, -> (skill_level) {where skill_level: skill_level }
  scope :cur_rating, -> (rating) {where("average_rating >= ?", rating.to_f)}
  scope :cur_organize, -> (organize) {order(organize)}

  belongs_to :user
  has_many :language_curriculums, dependent: :destroy
  has_many :languages, through: :language_curriculums
  has_many :posts, dependent: :destroy

  validates :title, :description, :languages, :user_id, presence: true

  def self.search(search)
  	if search
  		where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%").order(:title)
  	else
  		Curriculum.all.order(:title)
  	end
  end
end
