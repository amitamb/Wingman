class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_person

  before_filter :set_current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_person
    @current_person ||= current_user.person
  end

  # try to use http://stackoverflow.com/questions/7896298/safety-of-thread-current-usage-in-rails
  def set_current_user
    User.current = current_user
  end
end
