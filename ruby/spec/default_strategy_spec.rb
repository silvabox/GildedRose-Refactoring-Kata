require './default_strategy'
require './gilded_rose'

describe DefaultStrategy do
  let(:name) { 'Test' }
  let(:quality) { 10 }
  let(:sell_in) { 20 }

  let(:item) { Item.new(name, sell_in, quality) }
  subject { DefaultStrategy.new(item) }

  it 'decreases the value by 1' do
    expect{ subject.apply }.to change(item, :quality).by -1
  end

  it 'decreases the sell in by 1' do
    expect{ subject.apply }.to change(item, :sell_in).by -1
  end

  it 'does not decrease the quality below 0' do
    item.quality = 0
    subject.apply
    expect(item.quality).to eq 0
  end

  context 'when the sell by date has passed' do
    let(:sell_in) { 0 }

    it 'decreases the value by 2' do
      expect{ subject.apply }.to change(item, :quality).by -2
    end

    it 'does not decrease the quality below 0' do
      item.quality = 1
      subject.apply
      expect(item.quality).to eq 0
    end
  end
end
