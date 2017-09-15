class PagesController < ApplicationController

  def index
    @snippets = Snippet.order(id: :desc).page(params[:page])
  end

end
