class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_date
  
  def set_current_date
    DurationLimited.current_date = Date.parse(params[:current_date])
  end
end
