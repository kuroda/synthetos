class Product < ActiveRecord::Base
  include DurationLimited
  
  def department
    record = Department.where(code: department_code).
      where("started_on <= ? AND (ended_on >= ? OR ended_on IS NULL)", current_date, current_date).first
    raise ActiveRecord::RecordNotFound unless record
    record.current_date = current_date
    record
  end
end
