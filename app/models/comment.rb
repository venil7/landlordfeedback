class Comment < ActiveRecord::Base
  extend Application
  
  attr_accessor :post_as_anonymous

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  #scopes
  default_scope order("updated_at desc")
  #validation
  validates :text, :presence => true, :length => { :within => 0..400 }
  validates :user_id, login_validation_parameters
  validates :commentable_id, :presence => true
  validates :commentable_type, :presence => true
  
  #validate  :belongs_to_item
  #private
  #def belongs_to_item
  #    errors.add(:text, "comment should belong to an item") if feedback_id==nil && property_id==nil && entry_id==nil
  #end
  
end
