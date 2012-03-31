module DurationLimited
  extend ActiveSupport::Concern
  mattr_accessor :current_date
  
  included do
    default_scope do
      where("started_on <= ? AND (ended_on > ? OR ended_on IS NULL)",
        DurationLimited.current_date, DurationLimited.current_date)
    end
  end

  module ClassMethods
    def belongs_to(name)
      module_eval <<-EOS, __FILE__, __LINE__ + 1
        def #{name}
          #{name.to_s.camelize}.where(code: #{name}_code).first
        end
      EOS
    end

    def has_many(name)
      module_eval <<-EOS, __FILE__, __LINE__ + 1
        def #{name}
          #{name.to_s.singularize.camelize}.where(#{self.name.underscore}_code: code)
        end
      EOS
    end
    
    def find(code)
      record = self.where(code: code).first
      raise ActiveRecord::RecordNotFound unless record
      record
    end
  end
end
