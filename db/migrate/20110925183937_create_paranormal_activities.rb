class CreateParanormalActivities < ActiveRecord::Migration
  def self.up
    create_table :paranormal_activities do |t|
      t.references :time_entry
      t.references :service
      t.string :url
      t.text :description
      t.text :raw
      t.boolean :deleted
      t.datetime :happened_at

      t.timestamps
    end
  end

  def self.down
    drop_table :paranormal_activities
  end
end
