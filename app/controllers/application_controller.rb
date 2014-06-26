class ApplicationController < ActionController::Base
  before_action :identification
  protect_from_forgery

  def identification
    redirect_to log_in_path unless session[:user_id]
  end

  private
  def current_user
    p "current_user startet and session id #{session[:user_id]}"
    user = (@current_user ||= User.find(session[:user_id]) if session[:user_id])
    p "========#{user.inspect}========#{user.try(&:name)}================"
    user
  end
  helper_method :current_user
end