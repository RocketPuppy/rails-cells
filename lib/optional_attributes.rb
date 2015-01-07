module OptionalAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def optional(*args)
      args.each do |field|
        self.send(:define_method, field) do
          Optional.new(read_attribute(field))
        end
      end
    end
  end
end

class Optional
  def initialize(val)
    @val = val
  end

  def map
    if val
      yield(val)
    end
  end

  def map_or(x)
    if val
      yield(val)
    else
      x
    end
  end

  private

  attr_reader :val
end
