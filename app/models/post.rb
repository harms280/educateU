class Post < ActiveRecord::Base
  belongs_to :curriculum

  validates :title, :url, :position, :cost, presence: true

end
