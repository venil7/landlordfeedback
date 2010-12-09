class CreateReferencetypes < ActiveRecord::Migration
  def self.up
    create_table :referencetypes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :referencetypes
  end
end
