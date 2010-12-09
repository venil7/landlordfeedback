class Feedbackproperty < ActiveRecord::Base
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
        result = []
        props.each{ |p|
            r = {}
            self.column_names.each { |c| 
                r[c.to_sym] = p[c]
            }
            result.push r
        }
        return result
    end
    
#    def self.for_map_bounds(start_lat, start_lng, end_lat, end_lng)
#        sql = (self.feedback_join +
#               ["where lat >= %s and lng >= %s and lat <= %s and lng <= %s",
#                "group by properties.id"]).join(" ") % [start_lat.to_f, start_lng.to_f, end_lat.to_f, end_lng.to_f]
#        props = self.find_by_sql(sql);
#        column_names = self.column_names + ["rating"]
#        result = []
#        props.each{ |p|
#            r = {}
#            column_names.each { |c| 
#                r[c.to_sym] = p[c]
#            }
#            result.push r
#        }
#        return result
#    end
#    
#    def self.get_property(id)
#        sql = (self.feedback_join + [ "where properties.id = '%s'"]).join(" ") % id.to_s
#        self.find_by_sql(sql);
#    end
#    
#    private 
#    def self.feedback_join
#        ["select round(avg(entries.rating)) as rating, properties.*",
#         "from properties",
#         "left outer join feedbacks on feedbacks.property_id=properties.id",
#         "left outer join entries on entries.feedback_id=feedbacks.id"]
#    end
end
