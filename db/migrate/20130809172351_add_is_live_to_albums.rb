class AddIsLiveToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :is_live, :boolean
  end
end
