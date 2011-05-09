class Post < ActiveRecord::Base
  default_scope order("updated_at desc")
  named_scope :asc, order("updated_at asc")
  
  has_many :comments, :as => :commentable
 
 
  validates :title,  :presence=>true
  validates :author, :presence=>true
  validates :entry,  :presence=>true  
end
