class CommentsController < ApplicationController
  def create
    # binding.pry
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
