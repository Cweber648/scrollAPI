require 'rails_helper'

RSpec.describe Scrollio, type: :model do
  let(:scroll) { Scrollio.create }
  let(:site1) { Article.create(url: "http://www.cnn.com/2017/07/16/tennis/wimbledon-mens-final-federer-cilic/index.html") }
  let(:site2) { Article.create(url: "http://www.cnn.com/2017/07/14/tennis/roger-federer-fans-wimbledon-tennis/index.html") }

  describe 'associations' do
    it { should have_many(:articles) }
  end

  describe '#assemble instance method' do
    it 'creates an array of article object hashes' do
      scroll.articles << site1
      scroll.articles << site2
      expect(scroll.assemble).to be_an_instance_of(Array)
      expect(scroll.assemble[0]).to be_an_instance_of(Hash)
    end

    it 'does not mutate the original article objects' do
      expect(site1).to be_an_instance_of(Article)
    end
  end

end