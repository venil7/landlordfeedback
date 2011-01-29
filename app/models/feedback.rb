class Feedback < ActiveRecord::Base
    extend Application
    
    attr_accessor :accept_terms
    #attr_accessor :post_as_anonymous
    
    default_scope order("updated_at desc")
    
    has_many :entries
    has_many :comments, :as => :commentable

    has_many :photos
    belongs_to :property
    belongs_to :user 
    validates :property_id, :presence=>true, :numericality=>true
    validates :totalmonths, :presence=>true, :numericality=>true
    validates :landlord, :length => {:within => 0..30}
    validates :agency, :length => {:within => 0..30}
    validates :lastdate, :presence=>true, :format=>{ :with=> /^(19|20)\d\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/i }
    validates :accept_terms, terms_must_be_accepted 
    validates :user_id, login_validation_parameters
    validate  :landlord_or_agency
    #methods
    def owner
      value = user  
      value[:alias], value[:name], value[:surname] = nil, "Anonymous", "Poster" if anonymous
      return value
    end
    
    def rating
      Entry.average(:rating, :conditions=>{:feedback_id => id}).to_i
    end
    private
    #validators
    def landlord_or_agency
      errors.add(:landlord, "and/or agency should be specified") if landlord.empty? && agency.empty?
    end
end
