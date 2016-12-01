require_relative 'default_strategy'

class BackstageStrategy < DefaultStrategy
  def initialize(item)
    super(item, 1)
  end

  def increment
    if sell_in < 5
      3
    elsif sell_in < 10
      2
    else
      super
    end
  end

  def quality
    sell_in < 0 ? 0 : super
  end
end
