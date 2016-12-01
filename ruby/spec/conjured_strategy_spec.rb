require './conjured_strategy'
require './gilded_rose'

describe ConjuredStrategy do
  let(:name) { 'Test' }
  let(:quality) { 10 }
  let(:sell_in) { 20 }

  let(:item) { Item.new(name, sell_in, quality) }
  subject { ConjuredStrategy.new(item) }

  it 'decreases the value by 2' do
    expect{ subject.apply }.to change(item, :quality).by -2
  end

  it 'decreases the sell in by 1' do
    expect{ subject.apply }.to change(item, :sell_in).by -1
  end

  context 'when the sell by date has passed' do
    let(:sell_in) { 0 }

    it 'decreases the value by 4' do
      expect{ subject.apply }.to change(item, :quality).by -4
    end
  end
end
