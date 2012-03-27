class Department < ActiveRecord::Base
  include DurationLimited
  
  def products
    Product.where(department_code: code).effective_on(current_date)
  end
end
