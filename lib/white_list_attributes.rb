module WhiteListAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def white_list(*args)
      allowed = (self.column_names - args.map(&:to_s))
      allowed.each do |field|
        if defined? self.field
          self.send(:remove_method, field)
          self.send(:remove_method, "#{field}=")
        end
      end
    end
  end
end
