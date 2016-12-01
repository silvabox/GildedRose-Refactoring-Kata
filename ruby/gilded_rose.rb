require_relative 'default_strategy'
require_relative 'mature_strategy'
require_relative 'backstage_strategy'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    legacy_items = [
      'Sulfuras, Hand of Ragnaros',
    ]
    @items.each do |item|
      if legacy_items.include?(item.name)
        update_quality_legacy(item)
      else
        case item.name
        when 'Aged Brie'
          MatureStrategy.new(item).apply
        when 'Backstage passes to a TAFKAL80ETC concert'
          BackstageStrategy.new(item).apply
        else
          DefaultStrategy.new(item).apply
        end
      end
    end
  end

  def update_quality_legacy(item)
    if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      if item.quality > 0
        if item.name != "Sulfuras, Hand of Ragnaros"
          item.quality = item.quality - 1
        end
      end
    else
      if item.quality < 50
        item.quality = item.quality + 1
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end
    end
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > 0
            if item.name != "Sulfuras, Hand of Ragnaros"
              item.quality = item.quality - 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
        end
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
