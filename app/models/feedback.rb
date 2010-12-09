class Feedback < ActiveRecord::Base
    extend Application
    
    attr_accessor :accept_terms
    attr_accessor :post_as_anonymous
    
    default_scope order("updated_at desc")
    
    has_many :entries
    has_many :comments
    belongs_to :property
    belongs_to :user 
    validates :property_id, :presence=>true, :numericality=>true
    validates :totalmonths, :presence=>true, :numericality=>true
    validates :landlord, :length => {:within => 0..30}
    validates :agency, :length => {:within => 0..30}
    validates :lastdate, :presence=>true, :format=>{ :with=> /^(19|20)\d\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/i }
    validates :user_id, login_validation_parameters
    validate  :landlord_or_agency
    #methods
    def rating
      @rating = 0
      @count = 0
      entries.each do |e|
        @rating += e.rating
        @count += 1
      end
      if @count > 0
        (@rating / @count).round
      else
        @rating
      end
    end
    private
    #validators
    def landlord_or_agency
      errors.add(:landlord, "and/or agency should be specified") if landlord.empty? && agency.empty?
    end
end

#feedback
#set_table_name 'feedback'
#    
#    def self.get_feedbacks_for_property(id)
#        sql = (join_entry + ["where feedback.propertyid=%s group by feedback.id" % id.to_i]).join(" ")
#        self.find_by_sql(sql)
#    end
#    
#    def self.get_feedback(id)
#        sql = (join_entry + ["where feedback.id=%s group by feedback.id" % id.to_i]).join(" ")
#        self.find_by_sql(sql)
#    end
#    
#    private
#    def self.join_entry
#        ["select feedback.* , round(avg(feedbackentry.rating)) as rating",
#         "from feedback",
#         "left outer join feedbackentry on feedbackentry.feedbackid=feedback.id"]
#    end
