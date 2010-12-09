class CreatePropertytypes < ActiveRecord::Migration
  def self.up
    create_table :propertytypes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :propertytypes
  end
end
