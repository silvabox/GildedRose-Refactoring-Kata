require_relative 'default_strategy'

class ConjuredStrategy < DefaultStrategy
  def increment
    super * 2
  end
end
