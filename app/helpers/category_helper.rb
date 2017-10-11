module CategoryHelper

 def date(image)
  image.created_at.strftime('%d-%m-%y')
 end

 def time(image)
   image.created_at.strftime('%H:%M')
 end

 def noun(image)
  image.category.name
 end

end
