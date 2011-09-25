class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.references :settable, :polymorphic => true
      t.string :name
      t.string :value_type
      t.text :default

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
