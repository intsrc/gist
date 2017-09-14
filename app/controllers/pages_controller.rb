class PagesController < ApplicationController

  def index
    @snippets = Snippet.order(id: :desc).all
  end

end
