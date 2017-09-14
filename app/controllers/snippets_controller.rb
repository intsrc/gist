class SnippetsController < ApplicationController

  def new
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def edit
    @snippet = Snippet.find(params[:id])
    render :new
  end

  def create
    return head 403 unless logged_in?

    @snippet = Snippet.new(snippet_params)
    @snippet.user_id = current_user.id

    if @snippet.save()
      redirect_to root_path
    else
      render new
    end
  end

  def update
    return head 403 unless logged_in?

    @snippet = Snippet.find(params[:id])
    if @snippet.update_attributes(snippet_params)
      redirect_to @snippet
    else
      render new
    end
  end

  def destroy
    Snippet.find(params[:id]).destroy

    redirect_to root_path
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :content, :language)
  end

end
