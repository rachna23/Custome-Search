class CustomSearch
  
  def perform(category,color)
  	search = category.name+' '+color
  	results = GoogleCustomSearchApi.search(search, {"searchType" => "image"})
    History.create(history_hash(category,color,results))
    @images = results["items"].first(5).collect{|im| im["image"]["thumbnailLink"]}
  end	

  def history_hash(category,color,results)
  	{
  		noun: category.name,
  		color: color,
  		response: results["searchInformation"]["searchTime"]
  	}
  end	

end	