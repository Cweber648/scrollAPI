require 'open-uri'

class Article < ApplicationRecord
  belongs_to :scrollio

  validates :url, presence: true
  validates :url, uniqueness: { scope: :scrollio,
    message: "is already part of your reading list"}
  validate :url_must_be_valid

  def url_must_be_valid
      begin
        if open(url).status[0] != "200"
          errors.add(:url, "must be valid")
        end
      rescue
        errors.add(:url, "must be valid")
      end
  end

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
    else
      selector = 'p'
    end

    content = []
    page.search(selector).each do |div|
      content << div.text.strip
    end
    content
  end

end