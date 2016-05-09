class LinksController < ApplicationController

before_action :ensure_logged_in

  def index
    @links = Link.all
    render :index
  end

  def new
    @link = Link.new
    # this below will not work! TODO remember
    # @link ||= Link.new(link_params)
    render :new
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    #TODO don't forget that line above
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    #how do we know at this point that id is in params? is it left over?
    #OH YEAH, it's part of the query string
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end


  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end

end
