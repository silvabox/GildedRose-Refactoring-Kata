require './legendary_strategy'
require './gilded_rose'

describe LegendaryStrategy do
  let(:name) { 'Test' }
  let(:quality) { 10 }
  let(:sell_in) { 20 }

  let(:item) { Item.new(name, sell_in, quality) }
  subject { LegendaryStrategy.new(item) }

  it 'does not alter the quality' do
    expect{ subject.apply }.not_to change(item, :quality)
  end
end
