module ApplicationHelper
  # track app activity with clicky
  def clicky_tracking_code
    # only in production
    return unless Rails.env.production?
    
    %Q(<script src="http://static.getclicky.com/js" type="text/javascript"></script>
       <script type="text/javascript">clicky.init(66576);</script>
       <noscript><p><img alt="Clicky" width="1" height="1" src="http://in.getclicky.com/66576ns.gif" /></p></noscript>).html_safe
  end
end
