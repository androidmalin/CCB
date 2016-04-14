class ChangeSerie < ActiveRecord::Migration
  def change
  add_column :series, :title, :string
  add_column :series, :image, :string
  end
end
