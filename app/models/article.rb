require 'open-uri'

class Article < ApplicationRecord
  belongs_to :scrollio

  validates :url, presence: true
  validates :url, uniqueness: { scope: :scrollio,
    message: "is already part of your reading list"}
  validate :url_must_be_valid

  def url_must_be_valid
    if url != ""
      begin
        if open(url).status[0] != "200"
          errors.add(:url, "must be valid")
        end
      rescue
        errors.add(:url, "must be valid")
      end
    end
  end

  def format_me_baby
    { id: self.id, title: self.title, body: self.body }
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
    elsif url.hostname == "www.washingtonpost.com"
      selector = '#article-body p'
    elsif url.hostname == "www.theatlantic.com"
      selector = '.article-body p'
    elsif url.hostname == "www.chicagotribune.com"
      selector = '.trb_ar_page p'
    elsif url.hostname == "www.medium.com"
      selector = '.postArticle-content p'
    elsif url.hostname == 'www.npr.org'
      selector = '#storytext p'
    elsif url.hostname == "www.politico.com"
      selector = '.story-text > p'
    elsif url.hostname == 'www.newyorker.com'
      selector = '#articleBody p'
    elsif url.hostname == 'www.breitbart.com'
      return ["Anger nonsense verb verb appeal to emotion.", "Irrational anger, yelling, hypertension, Obama and Hillary.", "Nonsensical conclusion, etc.", "(Article conveniently summarized.)"]
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