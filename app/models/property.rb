class Property < ActiveRecord::Base
  self.include_root_in_json = false
  extend Application
  attr_accessor :accept_terms
  attr_accessor :post_as_anonymous
  
  default_scope order("updated_at desc")
  
  #relations
  has_many :feedbacks
  has_many :comments
  belongs_to :user
  belongs_to :propertytype
  has_many :entries, :through => :feedbacks, :source => :entries
  #validation
  validates :address, :presence => true, :uniqueness => true, :length => { :within => 10..100 }
  validates :postcode, :presence => true, :format => { :with => /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]?\s*[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/i }
  validates :lat, :presence => true, :numericality => true
  validates :lng, :presence => true, :numericality => true
  validates :propertytype_id, :presence => true, :numericality => true
  validates :accept_terms, :acceptance => {:message => "of use must be accepted"}
  validates :user_id, login_validation_parameters
  validate  :within_uk_boundary
  #methods
  def photos
    begin
      feedbacks.last.photos
    rescue
      []
    end
  end
  def rating
    feedback_range = feedbacks.collect{ |f| f.id }
    Entry.average('rating', :conditions => { :feedback_id => feedback_range }).to_i
  end
  #callbacks
  before_save :on_before_save
  def on_before_save
    #trim/uppercase postcode
    postcode.upcase!.gsub!(/ /, '')
    #trim address
    address.strip!
  end
  private
  def within_uk_boundary
    errors.add(:address, "location is outside UK boundary") if !uk_boundary[:lat].include?(lat) || !uk_boundary[:lng].include?(lng)
  end
  
  def uk_boundary
    {:lat => 49.82..58.75, :lng=>-8.22..1.58}
  end
end
