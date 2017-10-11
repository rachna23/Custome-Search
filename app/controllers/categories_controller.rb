class CategoriesController < ApplicationController
  before_action :find_color_and_category
  before_action :custome_search, only: %i[create search_again] 
  after_action :responding

  def index
	  @category = Category.new
  end	

  def create;  end	

  def search_again; end 

  def history
    @histories = History.all
  end	

  private

  def responding
    respond_to do |format|
     format.js
     format.html
    end
  end

  def custome_search
    @search = CustomSearch.new
    return unless @color.present? && @category.present?
    resp = @search.find_response(@category, @color)
      if resp['items'].present?
        @images = @search.perform(@category, @color, resp)
      else
        flash[:notice] = resp['error']['errors'].collect{ |ms| ms['message'] }.join(',')
        @images = []
      end
  end

  def find_color_and_category
    @color = params['color']
    @category = if params['category'].present? && params['category']['id'].present?
      Category.find(params['category']['id'])
    else
      Category.find_by_name(params['noun'])
    end    
  end

end
