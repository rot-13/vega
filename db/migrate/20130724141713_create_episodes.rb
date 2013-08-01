class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :season
      t.integer :episode
      t.string :name
      t.integer :series_id

      t.timestamps
    end
  end
end
