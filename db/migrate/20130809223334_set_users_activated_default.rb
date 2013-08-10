class SetUsersActivatedDefault < ActiveRecord::Migration
  def up
    change_column :users, :activated, :boolean, :default => false
    change_column :users, :is_admin, :boolean, :default => false
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Default not editable"
  end
end
