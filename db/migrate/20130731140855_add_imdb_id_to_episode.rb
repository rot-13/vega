class AddImdbIdToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :imdb_id, :integer
  end
end
