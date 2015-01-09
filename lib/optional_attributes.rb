module OptionalAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def optional(*args)
      args.each do |field|
        self.send(:define_method, field) do
          val = read_attribute(field)

          if val.nil?
            Optional.nothing
          else
            Optional.just(val)
          end
        end
      end
    end
  end
end

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
      yield(val)
    end

    def map_or(_)
      yield(val)
    end

    private

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
  end

  attr_reader :val
end
