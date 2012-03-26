class Department < ActiveRecord::Base
  class << self
    include DurationLimited
  end
end
