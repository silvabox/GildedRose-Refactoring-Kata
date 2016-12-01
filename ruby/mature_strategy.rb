require_relative 'default_strategy'

class MatureStrategy < DefaultStrategy
  def initialize(item)
    super(item, 1)
  end
end
