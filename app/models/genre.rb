class Genre < ActiveRecord::Base
	validates :genre, presence: true,
					uniqueness: true
  attr_accessible :genre
  has_many :movies
end
