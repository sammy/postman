module ApplicationHelper
  
  def urlize(url)
    url.starts_with?('http://') ? url : "http://#{url}" 
  end

  def datestamp(obj)
    from_time = Time.now
    distance_of_time_in_words(from_time,obj.created_at)
  end

end
