class CategoriesController < ApplicationController
before_action :find_color

 def index
 	@category = Category.new
 	respond_to do |format|
    format.js
  end
 end	

 def create
  @category = Category.find(params['category']['id']) rescue nil
  if @color.present? && @category.present?
    custome_search = CustomSearch.new
    @images = custome_search.perform(@category,@color)
    flash[:success] = "Welcome to the Sample App!"
    respond_to do |format|
      format.js
    end
  else
    @images = []
    flash[:error] = "Please select category"
  end  
 end	

 def search_again
  color = params['color']
  noun = params['noun']
  @category = Category.find_by_name(noun) rescue nil
  custome_search = CustomSearch.new
  @images = custome_search.perform(@category,color)
  respond_to do |format|
    format.js
  end
 end 


 def history
  @histories = History.all
 end	

 private

 def find_color
    @color = params["color"]
 end 

end	
