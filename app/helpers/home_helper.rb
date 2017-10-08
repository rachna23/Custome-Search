module HomeHelper
def options_colors(colors)
  colors.collect do |color, code| 
    "<option value='#{code}' style='background-color:#{code};'>#{color}</option> "
  end.join
end
end
