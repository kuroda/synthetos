class Department < ActiveRecord::Base
  self.primary_keys = :code, :seq_number
  has_many :products, foreign_key: [ :department_code, :department_seq_number ]
  
  def to_param
    persisted? ? to_key.join(',') : nil
  end
end
