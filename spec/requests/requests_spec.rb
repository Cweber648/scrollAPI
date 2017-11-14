require 'rails_helper'


RSpec.describe 'Scroll API', type: :request do

  # DELETE /scrollios/:scrollio_id/articles/:id
  it 'deletes an Article' do
    this_is_a_scrollio = create(:scrollio)
    this_is_an_article = build(:article)
    this_is_a_scrollio.articles << this_is_an_article

    headers = {
      "ACCEPT" => "application/json"
    }
    delete "/scrollios/#{this_is_a_scrollio.id}/articles/#{this_is_an_article.id}",
      :headers => headers
    expect(response).to have_http_status(:no_content)
  end

  # GET /scrollios/:id
  it 'returns a Scrollio' do
    this_is_a_scrollio = create(:scrollio)
    article_one = build(:article)
    article_two = build(:article)
    this_is_a_scrollio.articles << article_one
    this_is_a_scrollio.articles << article_two

    get "/scrollios/#{this_is_a_scrollio.id}"
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:ok)
  end

  # DELETE /scrollios/:id
  it 'deletes a scrollios associated articles' do
    this_is_a_scrollio = create(:scrollio)
    article_one = build(:article)
    article_two = build(:article)
    this_is_a_scrollio.articles << article_one
    this_is_a_scrollio.articles << article_two

    headers = {
      "ACCEPT" => "application/json"
    }
    delete "/scrollios/#{this_is_a_scrollio.id}",
      :headers => headers
    expect(response).to have_http_status(:no_content)
    expect(this_is_a_scrollio.articles.count).to eq 0
  end

    # POST   /scrollios/:scrollio_id/articles articles#create
  it 'creates an Article when given a valid URL' do
    this_is_a_scrollio = create(:scrollio)
    headers = {
      "ACCEPT" => "application/json"
    }
    post "/scrollios/#{this_is_a_scrollio.id}/articles", :params => { url: "http://www.cnn.com/2017/11/14/politics/abortion-first-amendment/index.html" },
      :headers => headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

  # POST   /scrollios/:scrollio_id/articles articles#create
  it 'returns status 422 and an error when given a blank string for URL' do
    this_is_a_scrollio = create(:scrollio)
    headers = {
      "ACCEPT" => "application/json"
    }
    post "/scrollios/#{this_is_a_scrollio.id}/articles", :params => { url: "" },
      :headers => headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

  # POST   /scrollios/:scrollio_id/articles articles#create
  it 'returns status 422 and an error when given an invalid URL' do
    this_is_a_scrollio = create(:scrollio)
    headers = {
      "ACCEPT" => "application/json"
    }
    post "/scrollios/#{this_is_a_scrollio.id}/articles", :params => { url: "hotdog" },
      :headers => headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

    # POST   /scrollios/:scrollio_id/articles articles#create
  it 'returns status 422 and an error when given a duplicate URL' do
    this_is_a_scrollio = create(:scrollio)
    headers = {
      "ACCEPT" => "application/json"
    }
    post "/scrollios/#{this_is_a_scrollio.id}/articles", :params => { url: "http://www.cnn.com/2017/11/14/politics/abortion-first-amendment/index.html" },
      :headers => headers
    post "/scrollios/#{this_is_a_scrollio.id}/articles", :params => { url: "http://www.cnn.com/2017/11/14/politics/abortion-first-amendment/index.html" },
      :headers => headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:unprocessable_entity)
  end

end

