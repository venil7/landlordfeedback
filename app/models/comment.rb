class Comment < ActiveRecord::Base
  extend Application
  
  attr_accessor :post_as_anonymous

  belongs_to :feedback
  belongs_to :entry
  belongs_to :property
  belongs_to :user
  #scopes
  def self.abuse_threshold
    5
  end
  default_scope where("abuse < #{self.abuse_threshold}").order("updated_at desc")
  scope :abused, where("abuse >= #{self.abuse_threshold}").order("updated_at desc")
  #validation
  validates :text, :presence => true, :length => { :within => 0..400 }
  validates :user_id, login_validation_parameters
  
  validate  :belongs_to_item
  private
  def belongs_to_item
      errors.add(:text, "comment should belong to an item") if feedback_id==nil && property_id==nil && entry_id==nil
  end
  
end
