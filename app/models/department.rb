class Department < ActiveRecord::Base
  include DurationLimited
  
  def products
    Product.where(department_code: code)
  end
end
