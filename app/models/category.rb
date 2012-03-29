class Category < ActiveRecord::Base
  include DurationLimited
  
  has_many :products, through: :category_product_links
end
