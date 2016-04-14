class AddAuthorLinkToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :author_link, :string
  end
end
