class CommentsController < ApplicationController
  def create
    comment=Comment.new(comment_params)
    if comment.save
      @item.transaction do 
        @item = comment.item
        @item.status = "trans"
        @item.save
      end
      redirect_to item_path(comment.item.id)
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
