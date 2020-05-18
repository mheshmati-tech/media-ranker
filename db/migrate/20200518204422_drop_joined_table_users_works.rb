class DropJoinedTableUsersWorks < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :users, :works
  end
end
