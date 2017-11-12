class ScrolliosController < ApplicationController

  # Might need if we get fancy later
            # def create
            #   @scroll = Scrollio.new(scroll_params)
            #   if @scroll.save
            #     redirect_to '/'
            #   else
            #     render 'new'
            #   end
            # end

  def show
    @scrollio = Scrollio.find(params[:id])
    json_response(@scrollio.assemble)
  end

end

