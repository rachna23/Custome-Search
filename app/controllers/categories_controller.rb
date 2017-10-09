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
  @category = Category.find(params['category']['id'])
 	search = @category.name+' '+@color
  results = GoogleCustomSearchApi.search(search, {"searchType" => "image"})
  @images = []
  results["items"].first(5).each do |item|
  	img = @category.images.create(image: item["image"]["thumbnailLink"])
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
