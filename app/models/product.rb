class Product < ActiveRecord::Base
  include DurationLimited
  
  def department
    Department.where(code: department_code).first
  end
end
