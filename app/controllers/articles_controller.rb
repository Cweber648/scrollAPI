class ArticlesController < ApplicationController

  def create
    frapplyblonk = params[:url]
    @scrollio = Scrollio.find(params[:scrollio_id])

    @article = Article.new(scrollio: @scrollio, url: frapplyblonk)
    if @article.save
      json_response(@article, :created)
    end

  end


end
