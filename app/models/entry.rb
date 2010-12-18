class Entry < ActiveRecord::Base
    extend Application
    
    default_scope order("updated_at desc")
    
    belongs_to :feedback
    belongs_to :user
    belongs_to :entrytype
    has_many   :comments
    #validations
    validates :feedback_id, :presence => true, :numericality=>true
    validates :entrytype_id, :presence => true, :numericality=>true
    validates :description, :presence => true, :length => {:within => 10..1000}
    validates :rating, :presence => true, :numericality=>true
    validates :user_id, login_validation_parameters
    #methods
    def owner
      feedback.owner
    end
end
