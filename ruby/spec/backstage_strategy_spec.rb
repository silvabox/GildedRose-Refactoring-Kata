require './backstage_strategy'
require './gilded_rose'

describe BackstageStrategy do
  let(:name) { 'Test' }
  let(:quality) { 10 }
  let(:sell_in) { 20 }

  let(:item) { Item.new(name, sell_in, quality) }
  subject { BackstageStrategy.new(item) }

  it 'increases the quality by 1' do
    expect{ subject.apply }.to change(item, :quality).by 1
  end

  it 'decreases the sell in by 1' do
    expect{ subject.apply }.to change(item, :sell_in).by -1
  end

  it 'does not increase the quality above 50' do
    item.quality = 50
    subject.apply
    expect(item.quality).to eq 50
  end

  context 'when the sell by date is 10 days or less' do
    let(:sell_in) { 10 }

    it 'increases the quality by 2' do
      expect{ subject.apply }.to change(item, :quality).by 2
    end
  end

  context 'when the sell by date is 5 days or less' do
    let(:sell_in) { 5 }

    it 'increases the quality by 3' do
      expect{ subject.apply }.to change(item, :quality).by 3
    end
  end

  context 'when the sell by date is passed' do
    let(:sell_in) { 0 }

    it 'sets the quality to 0' do
      subject.apply
      expect(item.quality).to eq 0
    end
  end
end
