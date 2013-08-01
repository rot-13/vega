class Series < ActiveRecord::Base
  attr_accessible :name, :imdb_id, :year, :actors, :plot, :poster_url
  has_many :episodes
end
