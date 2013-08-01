class AddImdbIdToSeries < ActiveRecord::Migration
  def change
    add_column :series, :imdb_id, :integer
  end
end
