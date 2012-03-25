# coding: utf-8

require 'spec_helper'

describe Product do
  let(:department) { FactoryGirl.create(:department) }
  
  it "部門(department)と関連づけできる" do
    product = FactoryGirl.build(:product)
    product.department_code = department.code
    product.department_seq_number = department.seq_number
    product.save!
    
    product.reload
    product.department.code.should == department.code
  end
end
