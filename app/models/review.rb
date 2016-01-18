class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :curriculum
  belongs_to :user

  validates_presence_of :rating, :user_id, :course_id

end
