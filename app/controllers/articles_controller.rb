class ArticlesController < ApplicationController

  def create
    frapplyblonk = params[:url]
    @scrollio = Scrollio.find(params[:scrollio_id])

    @article = Article.new(scrollio: @scrollio, url: frapplyblonk)
    if @article.save
      json_response(@article, :created)
    else
      json_response(@article.errors.full_messages, :unprocessable_entity)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    head :no_content
  end

end
