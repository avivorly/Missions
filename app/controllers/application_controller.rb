class ApplicationController < ActionController::Base
  before_action :identification
  protect_from_forgery

  def identification
    # only for home use
   # @current_user = User.first
   # session[:user_id] = true
    redirect_to log_in_path unless session[:user_id]
  end

  private
  def current_user
    p "current_user startet and session id #{session[:user_id]}"
    if session[:user_id]
      user = (@current_user ||= User.find_by_id(session[:user_id]))
      if user
        p "user#{user.id} found "
      else
        p "puck useris#{user.inspect} shit "
      end
    end

    p "after sesion========#{user.inspect}========#{user.try(&:name)}================"
    user
  end
  helper_method :current_user
end