require './mature_strategy'
require './gilded_rose'

describe MatureStrategy do
  let(:name) { 'Test' }
  let(:quality) { 10 }
  let(:sell_in) { 20 }

  let(:item) { Item.new(name, sell_in, quality) }
  subject { MatureStrategy.new(item) }

  it 'increases the value by 1' do
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

  context 'when the sell by date has passed' do
    let(:sell_in) { 0 }

    it 'increases the value by 2' do
      expect{ subject.apply }.to change(item, :quality).by 2
    end

    it 'does not increase the quality above 50' do
      item.quality = 50
      subject.apply
      expect(item.quality).to eq 50
    end
  end
end
