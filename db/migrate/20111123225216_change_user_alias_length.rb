class ChangeUserAliasLength < ActiveRecord::Migration
  def self.up
    change_column :users, :alias, :string, :limit => 255
  end

  def self.down
    change_column :users, :alias, :string, :limit => 16
  end
end

