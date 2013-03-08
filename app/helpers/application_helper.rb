module ApplicationHelper

  # this includes any @javascripts and @stylesheets as needed
  def extra_css_and_js_includes
    ''.tap do |extras|
      extras << stylesheet_link_tag(*@stylesheets) if @stylesheets
      extras << javascript_include_tag(*@javascripts) if @javascripts
    end.html_safe
  end 

  # track app activity with clicky
  def clicky_tracking_code
    # only in production
    # uncomment the line below, and insert your clicky tracking script.
    return #unless Rails.env.production?
    
    %Q( clicky-tracking-script-here ).html_safe
  end
end
