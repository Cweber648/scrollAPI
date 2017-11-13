class ScrolliosController < ApplicationController

  def show
    @scrollio = Scrollio.find(params[:id])
    json_response(@scrollio.assemble)
  end

  def destroy
    @scrollio = Scrollio.find(params[:id])
    @scrollio.articles.destroy_all
    head :no_content #-this returns status 200 header with no body
  end

end