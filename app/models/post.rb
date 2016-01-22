class Post < ActiveRecord::Base
  belongs_to :curriculum
  acts_as_list scope: :curriculum

  validates :title, :url, :position, :cost, presence: true



end
