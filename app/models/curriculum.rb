class Curriculum < ActiveRecord::Base
  belongs_to :user
  has_many :language_curriculums, dependent: :destroy
  has_many :languages, through: :language_curriculums
  has_many :posts, dependent: :destroy

  validates :title, :description, presence: true

  def self.search(search)
  	if search
  		where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%").order(:title)
  	else
  		Curriculum.all.order(:name)
  	end
  end
end
