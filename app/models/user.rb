class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates_presence_of :first_name
  validates_presence_of :last_name
  has_many :curriculums
  # has_many :courses
  has_many :reviews
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
