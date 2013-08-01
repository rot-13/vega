class AddMoreDataToSeries < ActiveRecord::Migration
  def change
    add_column :series, :actors, :string
    add_column :series, :plot, :text
    add_column :series, :poster_url, :string
  end
end
