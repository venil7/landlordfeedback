class Post < ActiveRecord::Base
  default_scope order("updated_at asc")
  has_many :comments, :as => :commentable

  def next
    begin
      Post.find(id+1)
    rescue
      nil
    end
  end
  
  def prev
    begin
      Post.find(id-1)
    rescue
      nil
    end
  end
  
  def hasprev?
    prev != nil
  end
  
  def hasnext?
    self.next != nil
  end
end
