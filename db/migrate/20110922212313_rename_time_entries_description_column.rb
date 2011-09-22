class RenameTimeEntriesDescriptionColumn < ActiveRecord::Migration
  def self.up
    rename_column :time_entries, :decription, :description
  end

  def self.down
    rename_column :time_entries, :description, :decription
  end
end
