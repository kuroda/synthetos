class Product < ActiveRecord::Base
  include DurationLimited
  
  belongs_to :department
end
