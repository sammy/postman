module ApplicationHelper
  
  def urlize(url)
    url.starts_with?('http://') ? url : "http://#{url}" 
  end

end
