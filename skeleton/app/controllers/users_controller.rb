class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to links_url
      # Will get error below if you don't have links/index view created
    else
      flash.now[:errors] = @user.errors.full_messages
      #easy to forget that one
      render :new
    end
  end



  private
  def user_params
    params.require(:user).permit(:password, :username)
  end


end
