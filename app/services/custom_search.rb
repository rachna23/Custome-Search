#Service for search
class CustomSearch
  
  def perform(category, color, results)
    History.create(history_hash(category, color, results))
    results['items'].first(5).collect{ |im| im['image']['thumbnailLink'] }
  end	

  def find_response(category, color)
    search = category.name+' '+color
    GoogleCustomSearchApi.search(search, { 'searchType' => 'image' })
  end

  def history_hash(category, color, results)
  {
		noun: category.name,
		color: color,
		response: results['searchInformation']['searchTime']
	}
  end

end