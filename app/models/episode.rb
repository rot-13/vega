class Episode < ActiveRecord::Base
  attr_accessible :episode, :name, :season, :series_id
  belongs_to :series
end
