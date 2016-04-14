class AddInterfaceToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :interface, :string
  end
end
