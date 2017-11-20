class ScrolliosController < ApplicationController

  def show
    @scrollio = Scrollio.find_or_create_by(device_identifier: params[:id])
    json_response(@scrollio.assemble)
  end

  def destroy
    @scrollio = Scrollio.find_by(device_identifier: params[:id])
    @scrollio.articles.destroy_all
    head :no_content #-this returns status 200 header with no body
  end

end