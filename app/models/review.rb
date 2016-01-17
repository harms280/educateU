class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :curriculum
  belongs_to :user

  validates_presence_of :rating
  
end
