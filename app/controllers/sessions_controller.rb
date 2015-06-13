class SessionsController < ApplicationController
  skip_before_filter :identification

  def create# TODO
    auth = env["omniauth.auth"]


    if auth.try :uid
      user = User.from_omniauth(auth)
      session[:user_id] = user.id
      session[:image]= auth['info']['image']
    end


    if auth.try :uid
      user = User.from_omniauth(auth)
      user = User.find(2)
      p '*'*100;p '*'*100;p '*'*100;p '*'*100;
      p session[:user_id] = user.id
      p '*'*100
      session[:user_id] = user.id
      session[:image] = auth['info']['image']
    end


    redirect_to root_url
  end

  def log_in

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

