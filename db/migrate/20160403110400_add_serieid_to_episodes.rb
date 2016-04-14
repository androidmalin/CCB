class AddSerieidToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :serie_id, :mediumint
  end
end
