class AddUserToTimeEntry < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :user_id, :integer
  end

  def self.down
    remove_column :time_entries, :user_id
  end
end
