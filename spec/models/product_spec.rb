# coding: utf-8

require 'spec_helper'

describe Product do
  let(:department) { FactoryGirl.create(:department) }
  
  it "部門(department)と関連づけできる" do
    product = FactoryGirl.build(:product)
    product.code = "alpha"
    product.model_number = 2012
    product.department_code = department.code
    product.department_seq_number = department.seq_number
    product.save!
    
    p = Product.find("alpha,2012")
    p.department.code.should == department.code
  end
end
