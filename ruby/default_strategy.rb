class DefaultStrategy
  attr_reader :item
  protected :item

  def initialize(item)
    @item = item
  end

  def apply
    update_sell_in
    update_quality
  end

  def update_quality
    quality = item.quality + quality_inc
    item.quality = (quality < 0 ? 0 : quality)
  end

  def quality_inc
    item.sell_in < 0 ? -2 : -1
  end

  def update_sell_in
    item.sell_in -= 1
  end
end
