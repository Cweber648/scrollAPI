class Article < ApplicationRecord
  belongs_to :scrollio

  def format_me_baby
    { title: self.title, body: self.body }
  end

  def title
    mechanize = Mechanize.new
    page = mechanize.get(self.url)
    page.title
  end

  def body
    url = URI.parse(self.url)
    mechanize = Mechanize.new
    page = mechanize.get(url)

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