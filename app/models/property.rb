class Property < ActiveRecord::Base
  self.include_root_in_json = false
  extend Application

  attr_accessor :accept_terms
  #attr_accessor :post_as_anonymous

  default_scope order("'properties'.'updated_at' desc")

  #relations
  has_many :feedbacks
  has_many :comments, :as => :commentable

  belongs_to :user
  belongs_to :propertytype
  has_many :entries, :through => :feedbacks, :source => :entries
  has_many :photos,  :through => :feedbacks
  #validation
  validates :address, :presence => true, :uniqueness => true, :length => { :within => 10..100 }
  validates :postcode, :presence => true, :format => { :with => /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]?\s*[0-9][ABD-HJLN-UW-Z]{2}\s*)$/i }
  validates :lat, :presence => true, :numericality => true
  validates :lng, :presence => true, :numericality => true
  validates :propertytype_id, :presence => true, :numericality => true
  validates :accept_terms, terms_must_be_accepted
  validates :user_id, login_validation_parameters
  validate  :within_uk_boundary

  def rating
    feedback_range = feedbacks.collect{ |f| f.id }
    Entry.average('rating', :conditions => { :feedback_id => feedback_range }).to_i
  end

  #callbacks
  before_save :on_before_save
  def on_before_save
    #trim/uppercase postcode
    postcode = postcode.upcase.gsub(/ /, '') if postcode
    #trim address
    address.strip! if address
  end

  def self.for_map_bounds(opts)
    @limit = 25
    @bounds = {:start_lat=>0.0, :start_lng=>0.0, :end_lat=>0.0, :end_lng=>0.0}.merge(opts)
    @props = self.extended_properties
                 .where{(lat.gteq my{@bounds[:start_lat].to_f})&(lng.gteq my{@bounds[:start_lng].to_f})&(lat.lteq my{@bounds[:end_lat].to_f})&(lng.lteq my{@bounds[:end_lng].to_f})}
                 .limit(@limit)
  end

  def self.test_me
    self.extended_properties.where{(lat.gteq 0) & (lng.gteq 0)}.to_sql
  end

  private
  def within_uk_boundary
    errors.add(:address, "location is outside UK boundary") if !uk_boundary[:lat].include?(lat) || !uk_boundary[:lng].include?(lng)
  end

  def uk_boundary
    {:lat => 49.82..58.75, :lng=>-8.22..1.58}
  end

  def self.extended_properties
    self
    .joins{feedbacks.outer}
    .joins{entries.outer}
    .select{[id,address,lat,lng,propertytype_id,updated_at,user_id]}
    .select{"ifnull(round(avg(`entries`.`rating`),0),0) as `rating`"}
    .select{"upper(`properties`.`postcode`) as `postcode`"}
    .group{id}
  end
end

