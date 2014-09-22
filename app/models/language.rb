class Language < ActiveRecord::Base
	validates	:language, presence: true,
				uniqueness: true
  attr_accessible :language
  has_many :movies
end
