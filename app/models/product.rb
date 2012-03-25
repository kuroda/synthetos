class Product < ActiveRecord::Base
  self.primary_keys = :code, :model_number
  belongs_to :department,
    foreign_key: [ :department_code, :department_seq_number ],
    primary_key: [ :code, :seq_number ]
end
