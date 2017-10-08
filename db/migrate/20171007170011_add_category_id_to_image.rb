class AddCategoryIdToImage < ActiveRecord::Migration[5.1]
  def change
  	add_column :images, :category_id, :integer
  end
end
