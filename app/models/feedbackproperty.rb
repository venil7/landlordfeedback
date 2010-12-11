class Feedbackproperty < ActiveRecord::Base
    self.include_root_in_json = false
    has_many :feedbacks
    belongs_to :propertytype
    belongs_to :user
    has_many :entries, :through => :feedbacks, :source => :entries
    
    default_scope order('updated_at desc,  rating desc')
    
    set_table_name 'feedbackproperties'
    
    def self.for_map_bounds(opts)
        limit = 25
        default_bounds = {"start_lat"=>0.0, "start_lng"=>0.0, "end_lat"=>0.0, "end_lng"=>0.0}
        default_bounds.merge!(opts)
        props = self.where("lat >= #{default_bounds["start_lat"].to_f} and lng >= #{default_bounds["start_lng"].to_f} and lat <= #{default_bounds["end_lat"].to_f} and lng <= #{default_bounds["end_lng"].to_f}")
                    .limit(limit)
    end
end
