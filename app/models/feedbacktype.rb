class Feedbacktype < ActiveRecord::Base
  has_many :feedbacks
  def self.for_select
    @result = []
    self.all.each do |type|
      @result.push([type[:name], type[:id]])
    end
    @result
  end
end
