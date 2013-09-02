class AddColumnKarma < ActiveRecord::Migration
  def up
    add_column :users, :karma, :integer
  end

  def down
    remove_column :users, :karma
  end
end
