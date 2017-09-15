class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comments_params)
    @comment.assign_attributes(user_id: current_user.id, snippet_id: params[:snippet_id])
    @comment.save

    redirect_to snippet_path(params[:snippet_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comments_params)
      redirect_to snippet_path(@comment.snippet_id)
    else
      render :edit
    end
  end

  def destroy
    Comment.find(params[:id]).destroy

    redirect_to snippet_path(params[:snippet_id])
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
