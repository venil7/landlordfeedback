class CreateFeedbackproperties < ActiveRecord::Migration
  def self.up
    create_table :feedbackproperties do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbackproperties
  end
end
