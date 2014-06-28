class SessionsController < ApplicationController
  skip_before_filter :identification

  def create
    auth = env["omniauth.auth"]
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    session[:image]= auth['info']['image']
    redirect_to root_url
  end

  def log_in

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

