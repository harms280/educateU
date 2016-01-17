class Post < ActiveRecord::Base
  belongs_to :curriculum

  validates :title, :url, :number, presence: true

end
