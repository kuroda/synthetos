module DurationLimited
  extend ActiveSupport::Concern
  mattr_accessor :current_date
  
  included do
    default_scope do
      where("started_on <= ? AND (ended_on >= ? OR ended_on IS NULL)",
        DurationLimited.current_date, DurationLimited.current_date)
    end
  end

  module ClassMethods
    def find(code)
      record = self.where(code: code).first
      raise ActiveRecord::RecordNotFound unless record
      record
    end
  end
end
