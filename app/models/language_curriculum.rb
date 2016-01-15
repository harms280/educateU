class LanguageCurriculum < ActiveRecord::Base
  belongs_to :language
  belongs_to :curriculum
end
