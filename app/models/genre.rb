class Genre < ActiveRecord::Base
	validates :genre, presence: true,
					uniqueness: true
  attr_accessible :genre
end
