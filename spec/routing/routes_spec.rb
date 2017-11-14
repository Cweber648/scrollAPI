require 'rails_helper'

RSpec.describe "Routes", type: :routing do

  describe 'scrollio' do
    it 'routes /scrollios/:id to scrollios#show for id' do
      expect(:get => "/scrollios/1").to route_to(
        :controller => "scrollios",
        :action => "show",
        :id => "1"
      )
    end

    it 'routes /scrollios/:id to scrollios#destroy for id' do
      expect(:delete => "/scrollios/1").to route_to(
        :controller => "scrollios",
        :action => "destroy",
        :id => "1"
      )
    end
  end


  describe 'article' do
    it 'routes /scrollios/:scrollio_id/articles to articles#create for scrollio_id' do
      expect(:post => "/scrollios/1/articles").to route_to(
        :controller => "articles",
        :action => "create",
        :scrollio_id => "1"
      )
    end

    it 'routes /scrollios/:scrollio_id/articles/id to articles#destroy for scrollio_id and id' do
      expect(:delete => "/scrollios/1/articles/3").to route_to(
        :controller => "articles",
        :action => "destroy",
        :scrollio_id => "1",
        :id => "3"
      )
    end
  end

end
