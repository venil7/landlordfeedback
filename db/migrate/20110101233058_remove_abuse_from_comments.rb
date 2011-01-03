class RemoveAbuseFromComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :abuse
    remove_column :comments, :entry_id
    remove_column :comments, :feedback_id
    remove_column :comments, :property_id
  end

  def self.down
    add_column :comments, :property_id, :integer
    add_column :comments, :feedback_id, :integer
    add_column :comments, :entry_id, :integer
    add_column :comments, :abuse, :integer
  end
end
