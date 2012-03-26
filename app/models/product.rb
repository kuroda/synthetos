class Product < ActiveRecord::Base
  include DurationLimited
  
  def department
    record = Department.where(code: department_code).effective_on(current_date).first
    raise ActiveRecord::RecordNotFound unless record
    record.current_date = current_date
    record
  end
end
