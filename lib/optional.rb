module Optional
  def self.just(val)
    Just.new(val)
  end

  def self.nothing
    Nothing.instance
  end

  private

  class Just
    def initialize(val)
      @val = val
    end

    def map
      self.class.new(yield(val))
    end

    def map_or(_)
      self.class.new(yield(val))
    end

    def just?
      true
    end

    def nothing?
      false
    end

    attr_reader :val
  end

  class Nothing
    def self.instance
      @nothing ||= new
    end

    def map
      self
    end

    def map_or(x)
      x
    end

    def just?
      false
    end

    def nothing?
      true
    end
  end

  attr_reader :val
end
