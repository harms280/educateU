class Review < ActiveRecord::Base
  belongs_to :course
  belongs_to :curriculum
  belongs_to :user
end
