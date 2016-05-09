class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    flash[:errors] = comment.errors.full_messages
    link_id = params[:comment][:link_id]
    redirect_to link_url(link_id)
  end

  def destroy
    comment = Comment.find(params[:id])
    #id is in the PARAMS OF BUTTON
    comment.destroy
    redirect_to link_url(comment.link_id)
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :link_id)
  end

end
