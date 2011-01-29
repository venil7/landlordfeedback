class Post < ActiveRecord::Base
  default_scope order("updated_at desc")
  has_many :comments, :as => :commentable
 
end
