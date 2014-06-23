class ApplicationController < ActionController::Base
  before_action :identification
  protect_from_forgery

  def identification
    redirect_to log_in_path unless session[:user_id]
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end