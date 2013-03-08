module ApplicationHelper


  # track app activity with clicky
  def clicky_tracking_code
    # only in production
    # uncomment the line below, and insert your clicky tracking script.
    return #unless Rails.env.production?
    
    %Q( clicky-tracking-script-here ).html_safe
  end
end
