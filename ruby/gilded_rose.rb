require_relative 'default_strategy'
require_relative 'backstage_strategy'
require_relative 'legendary_strategy'
require_relative 'conjured_strategy'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        DefaultStrategy.new(item, 1).apply
      when 'Backstage passes to a TAFKAL80ETC concert'
        BackstageStrategy.new(item).apply
      when 'Sulfuras, Hand of Ragnaros'
        LegendaryStrategy.new(item).apply
      when 'Conjured Mana Cake'
        ConjuredStrategy.new(item).apply
      else
        DefaultStrategy.new(item).apply
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
