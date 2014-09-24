class Movie < ActiveRecord::Base
  belongs_to :user
  belongs_to :genre
  belongs_to :language
  attr_accessible :description, :title, :genre_id, :language_id, :user_id
  validates :title, presence: true   			
  validates :description, presence: true
end
