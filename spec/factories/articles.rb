FactoryBot.define do

urls = [
  "http://www.cnn.com/2017/11/14/politics/sessions-roy-moore/index.html",
  "http://www.cnn.com/2017/11/14/politics/paul-ryan-roy-moore/index.html",
  "https://www.nytimes.com/2017/11/14/us/politics/jeff-sessions-congress-russia.html",
  "https://www.nytimes.com/2017/11/13/opinion/president-trump-authoritarianism.html",
  "https://www.nytimes.com/2017/11/14/opinion/global-warming-paris-climate-agreement.html",
  "https://medium.com/@matt_11659/matt-barrie-australias-economy-is-a-house-of-cards-6877adb3fb2f",
  "https://medium.com/swlh/marketing-is-not-about-your-companys-values-2f76794b7f8b",
  "https://www.politico.com/story/2017/11/14/jeff-sessions-no-trump-influence-doj-clinton-244885",
  "https://www.politico.com/story/2017/11/14/roy-moore-editorial-alabama-244878"
]

  factory :article do |url|
    scrollio_id 1
    url urls.sample
  end
end