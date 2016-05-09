class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
    params[:user][:username],
    params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Invalid username and/or password"]
      render :new
    else
      sign_in(user)
      redirect_to links_url
    end
  end

  def destroy
    user = User.find_by(session_token: session[:session_token])
    user.reset_session_token
    session[:sesison_token] = nil
    redirect_to new_session_url
  end


end
