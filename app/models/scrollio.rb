class Scrollio < ApplicationRecord
  has_many :articles

  def assemble
    self.articles.map do |article|
      article.format_me_baby
    end
  end

end
