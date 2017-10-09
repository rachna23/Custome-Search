require "open-uri"
class Image < ApplicationRecord
	belongs_to :category
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	 has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }

      
end


