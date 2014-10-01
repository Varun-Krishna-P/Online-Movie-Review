class Movie < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre
  belongs_to :language
  attr_accessible :description, :title, :genre_id, :language_id, :user_id, :tag_list
  validates :title, presence: true   			
  validates :description, presence: true

  has_reputation :votes, source: :user, aggregated_by: :sum 

  acts_as_taggable

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
	  Tag.find_by_name!(name).movies
	end


end
