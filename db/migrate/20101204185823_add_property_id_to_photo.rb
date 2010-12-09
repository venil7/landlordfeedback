class AddPropertyIdToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :property_id, :int
  end

  def self.down
    remove_column :photos, :property_id
  end
end
