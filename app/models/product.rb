class Product < ActiveRecord::Base
  class << self
    include DurationLimited
  end
end
