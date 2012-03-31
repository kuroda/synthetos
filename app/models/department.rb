class Department < ActiveRecord::Base
  include DurationLimited
  
  has_many :products
end
