class CreateGroupFriends < ActiveRecord::Migration
  def change
    create_table :group_friends do |t|
      t.belongs_to :group
      t.belongs_to :friend
      t.string :name
      t.timestamps
    end
    add_index :group_friends, [:group_id, :friend_id]
  end
end
