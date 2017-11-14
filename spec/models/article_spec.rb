require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:site1) { Article.create(scrollio_id: 1, url: "http://www.cnn.com/2017/07/16/tennis/wimbledon-mens-final-federer-cilic/index.html") }
  let(:body) { site1.body }
  let(:formatted) { site1.format_me_baby }

  describe 'associations' do
    it { should belong_to(:scrollio) }
  end

  describe 'validations' do

    it { should validate_presence_of(:url) }

    it 'validates that the url is unique within the scope of a scroll' do
      site2 = Article.new(scrollio_id: 1, url: "http://www.cnn.com/2017/07/16/tennis/wimbledon-mens-final-federer-cilic/index.html")
      expect(site2).to_not be_valid
    end

    it 'validates that a url returns a status code of 200' do
      site3 = Article.new(scrollio_id: 1, url: "this-is-not-a-website-potato")
      expect(site3).to_not be_valid
    end
  end

  describe 'instance methods' do
    it '#title returns the title of a given article' do
      expect(site1.title).to include("Roger Federer: Swiss star defeats Marin Cilic")
    end

    describe '#body' do
      it 'returns an array of paragraphs formatted as strings' do
        expect(body).to be_an_instance_of(Array)
        expect(body[0]).to be_an_instance_of(String)
      end

      it 'accurately stores paragraphs for a CNN article' do
        expect(body[0]).to include("the greatest Wimbledon men's champion")
        expect(body[3]).to include("won his first Wimbledon title in five years")
      end
    end

    describe '#format_me_baby' do
      it 'returns a hash' do
        expect(formatted).to be_an_instance_of(Hash)
      end

      it 'contains id, title, and body hash keys' do
        expect(formatted.keys).to include(:id, :title, :body)
      end
    end
  end

end