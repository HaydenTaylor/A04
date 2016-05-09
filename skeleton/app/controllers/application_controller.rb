class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def sign_in(user)
    session[:session_token] = user.reset_session_token
    #had an erroneous @ for user here.
  end

  def current_user
    User.find_by(session_token: session[:session_token])
    # was assigning this to @user. big no-no. messed up whatever was already @user
  end

  def logged_in?
    !!current_user
  end



end
