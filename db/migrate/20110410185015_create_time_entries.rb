class CreateTimeEntries < ActiveRecord::Migration
  def self.up
    create_table :time_entries do |t|
      t.datetime :started_at
      t.datetime :stopped_at
      t.string :name
      t.text :decription
      t.text :note
      t.string :user

      t.timestamps
    end
  end

  def self.down
    drop_table :time_entries
  end
end
