class CreateFeedbacktypes < ActiveRecord::Migration
  def self.up
    create_table :feedbacktypes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacktypes
  end
end
