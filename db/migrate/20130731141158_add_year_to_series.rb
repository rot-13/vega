class AddYearToSeries < ActiveRecord::Migration
  def change
    add_column :series, :year, :integer
  end
end
