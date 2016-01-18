class Post < ActiveRecord::Base
  belongs_to :curriculum

  validates :title, :url, :position, presence: true

end
