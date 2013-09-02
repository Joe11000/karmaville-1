class RemoveColumnKarma < ActiveRecord::Migration
  def up
    remove_column :users, :karma
  end

  def down
    add_column :users, :karma, :string
  end
end
