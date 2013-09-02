class AddIndexToKarmaPoints < ActiveRecord::Migration
  def change
    add_index :karma_points, [:value, :user_id]
  end
end
