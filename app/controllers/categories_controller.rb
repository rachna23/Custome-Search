class CategoriesController < ApplicationController

 def new
 	@category = Category.new
 end	

 def index
 	@color = params["color"]
 	@category = Category.new
 	respond_to do |format|
    format.js
  end
 end	

 def create
 	@color = params["color"]
 	@categories = params["category_names"]
 	search = @categories.join(" ") +' '+@color
  results = GoogleCustomSearchApi.search(search, {"searchType" => "image"})
  name = params[:category_names].first
  @category = Category.find_by_name(name)
  @images = []
  results["items"].first(5).each do |item|
  	img = @category.images.create(image: item["link"])
  	@images << img
  end
  @images
  respond_to do |format|
    format.js
  end
 end	

 def history
 	@images = Image.all
 end	

end	
