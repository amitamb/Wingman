class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :current_person

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_person
    @current_person ||= current_user.person
  end
end
