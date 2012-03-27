class Category < ActiveRecord::Base
  include DurationLimited
  
  def products
    product_codes = CategoryProductLink.where(category_code: code).
      select(:product_code).map(&:product_code)
    Product.where(code: product_codes)
  end
end
