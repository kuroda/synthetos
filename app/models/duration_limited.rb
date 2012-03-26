require 'active_support/concern'

module DurationLimited
  extend ActiveSupport::Concern
  
  included do
    attr_accessor :current_date
    
    scope :effective_on,
      ->(date) do
        where("started_on <= ? AND (ended_on >= ? OR ended_on IS NULL)", date, date)
      end
  end

  module ClassMethods
    def find(code, date)
      record = self.where(code: code).effective_on(date).first
      raise ActiveRecord::RecordNotFound unless record
      record.current_date = date
      record
    end
  end
end
