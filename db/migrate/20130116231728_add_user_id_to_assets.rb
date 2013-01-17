class AddUserIdToAssets < ActiveRecord::Migration
  def self.up
   add_column :assets, :user_id, :integer
   add_foreign_key( :assets, :user_id)

  end

  def self.down
   remove_column :assets, :user_id
   remove_foreign_key( :assets, :user_id)
  end
end
