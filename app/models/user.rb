class User < ActiveRecord::Base
  has_many :curriculums
  has_many :courses
  has_many :reviews
  
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
