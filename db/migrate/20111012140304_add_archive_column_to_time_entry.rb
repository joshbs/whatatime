class AddArchiveColumnToTimeEntry < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :archived, :boolean, default: false
  end

  def self.down
    remove_column :time_entries, :archived
  end
end
