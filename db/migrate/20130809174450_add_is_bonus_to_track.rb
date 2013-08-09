class AddIsBonusToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :is_bonus, :boolean
  end
end
