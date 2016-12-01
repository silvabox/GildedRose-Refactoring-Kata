class DefaultStrategy
  attr_reader :item
  protected :item

  QUALITY_MINIMUM = 0
  QUALITY_MAXIMUM = 50

  def initialize(item, increment = -1)
    @item = item
    @increment = increment
  end

  def apply
    item.quality = quality
    item.sell_in = sell_in
  end

  def quality
    quality = item.quality + increment
    return QUALITY_MINIMUM if quality < QUALITY_MINIMUM
    return QUALITY_MAXIMUM if quality > QUALITY_MAXIMUM
    quality
  end

  def increment
    sell_in < 0 ? @increment * 2 : @increment
  end

  def sell_in
    item.sell_in - 1
  end
end
