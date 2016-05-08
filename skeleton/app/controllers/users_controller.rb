class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #login user probably
      redirect_to links_url
    else
      # flash[:errors] = ["an error"]
      flash.now[:errors] = @user.errors.full_messages
      #easy to forget that one
      render :new
    end
  end



  private
  def user_params
    params.require(:user).permit(:username, :password)
  end


end
