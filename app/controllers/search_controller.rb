class SearchController < PageController
  #searches for properties
  before_filter :set_variables

  def index
    @search = params[:term]
    @term = "%#{@search}%"
    @properties =  Property
                   .joins{feedbacks.outer}
                   .joins{entries.outer}
                   .where{
                     (address.matches my{@term}) |
                     (postcode.matches my{@term}) |
                     (feedbacks.landlord.matches my{@term}) |
                     (feedbacks.agency.matches my{@term}) |
                     (entries.description.matches my{@term})
                   }
                   .select{"distinct `properties`.*"}
                   .page(@page)
                   .per(@page_size)
  end


  def feedbacks

  end

  private
  def set_variables
    @page = params[:page] || 0
    @page_size = 10
  end
end

