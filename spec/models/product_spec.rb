# coding: utf-8

require 'spec_helper'

describe Product do
  let(:department0) { FactoryGirl.create(:department,
      code: "robot", name: "Department0",
      started_on: Date.new(2000, 1, 1), ended_on: Date.new(2002, 1, 1)) }
  let(:department1) { FactoryGirl.create(:department,
      code: "robot", name: "Department1",
      started_on: Date.new(2002, 1, 1), ended_on: nil) }
  
  it "2001年1月1日当時の部門(department)と関連づけできる" do
    product = FactoryGirl.build(:product)
    product.code = "alpha"
    product.started_on = Date.new(2000, 1, 1)
    product.ended_on = Date.new(2004, 1, 1)
    product.department_code = "robot"
    product.save!
    
    p = Product.find("alpha", Date.new(2001, 1, 1))
    p.department.code.should == department0.name
  end
  
  it "2003年1月1日当時の部門(department)と関連づけできる" do
    product = FactoryGirl.build(:product)
    product.code = "alpha"
    product.started_on = Date.new(2000, 1, 1)
    product.ended_on = Date.new(2004, 1, 1)
    product.department_code = "robot"
    product.save!
    
    p = Product.find("alpha", Date.new(2003, 1, 1))
    p.department.name.should == department1.name
  end
end
