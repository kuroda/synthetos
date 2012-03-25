require 'composite_primary_keys'

class Department < ActiveRecord::Base
  self.primary_keys = :code, :seq_number
  has_many :products, foreign_key: [ :department_code, :department_seq_number ]
end
