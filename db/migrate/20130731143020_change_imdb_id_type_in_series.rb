class ChangeImdbIdTypeInSeries < ActiveRecord::Migration
  def up
    change_column :series, :imdb_id, :string
  end

  def down
    change_column :series, :imdb_id, :integer
  end
end
