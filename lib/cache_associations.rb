require 'optional'

module CacheAssociations
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def cache_associations(*args)
      args.each do |field|
        old_field = "old_#{field}"
        self.send(:alias_method, old_field, field)
        self.send(:define_method, field) do
          if association_cache.keys.include?(field)
            Optional.just(send(old_field))
          else
            Optional.nothing
          end
        end
      end
    end
  end
end
