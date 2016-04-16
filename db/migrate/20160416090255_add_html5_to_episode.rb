class AddHtml5ToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :html5, :string
  end
end
