require 'optional'

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
