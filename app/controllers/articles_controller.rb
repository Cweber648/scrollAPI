class ArticlesController < ApplicationController

  def create
    article_url = params[:url]
    @scrollio = Scrollio.find_or_create_by(device_identifier: params[:scrollio_id])
    @article = Article.new(scrollio: @scrollio, url: article_url)
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
