class ActionController::Base
  before_filter :detect_ie6
  
protected
  def detect_ie6
    if request.env['HTTP_USER_AGENT'].downcase =~ /msie 6/ && cookies[:ie6_warning_given].blank?
      cookies[:ie6_warning_given] = { :value => "yes", :expires => 1.year.from_now }
      @next_page = request.url
      render :file => "ie6/diaf", :layout => false
    end
  end
end
