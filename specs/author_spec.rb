require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('Sana', 'Tameem')
  end

  describe '#new' do
    it 'Returns an instance of Author class' do
      expect(@author).to be_an_instance_of(Author)
    end
  end

  describe '#first_name' do
    it 'Returns first name of author' do
      expect(@author.first_name).to eq('Sana')
    end
  end

  describe '#last_name' do
    it 'Returns last name of author' do
      expect(@author.last_name).to eq('Tameem')
    end
  end

  describe '#items' do
    it 'Returns empty array for items' do
      expect(@author.items).to eq []
    end
  end

  describe '#add_item' do
    it 'Adding item to the array of items' do
      mock_item = double('item')
      allow(mock_item).to receive(:author=).with(@author)
      @author.add_item(mock_item)
      expect(@author.items).to include(mock_item)
    end
  end
end
