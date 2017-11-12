class ApplicationController < ActionController::API
  include Response

  def title(article_url)
    mechanize = Mechanize.new
    page = mechanize.get(article_url)
    page.title
  end

  def body(article_url)
    mechanize = Mechanize.new
    page = mechanize.get(article_url)

    if url.hostname == "www.cnn.com"
      selector = 'div .zn-body__paragraph'
    elsif url.hostname == "www.nytimes.com"
      selector = '.story-body-text'
    elsif url.hostname == "www.foxnews.com"
      selector = 'p'
    end

    content = []
    page.search(selector).each do |div|
      content << div.text.strip
    end
    content
  end

end