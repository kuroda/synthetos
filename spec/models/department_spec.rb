# coding: utf-8

require 'spec_helper'

describe Department do
  let(:department0) { FactoryGirl.create(:department,
      code: "robot", name: "Department0",
      started_on: Date.new(2000, 1, 1), ended_on: Date.new(2002, 1, 1)) }
  let(:department1) { FactoryGirl.create(:department,
      code: "robot", name: "Department1",
      started_on: Date.new(2002, 1, 1), ended_on: nil) }
  let(:department2) { FactoryGirl.create(:department,
      code: "ship", name: "Department1",
      started_on: Date.new(2002, 1, 1), ended_on: nil) }
  
  before do
    department0
    department1
    department2
  end
  
  it "部門(department)を複合キーで検索できる" do
    DurationLimited.current_date = Date.new(2001, 1, 1)
    
    dep0 = Department.find("robot")
    dep0.name.should == department0.name
    
    DurationLimited.current_date = Date.new(2003, 1, 1)
    
    dep1 = Department.find("robot")
    dep1.name.should == department1.name
  end
  
  it "2001年1月1日当時の製品(product)リストを取得できる" do
    FactoryGirl.create(:product, name: "p0", department_code: "robot",
      started_on: Date.new(1999, 1, 1), ended_on: Date.new(2000, 8, 1))
    FactoryGirl.create(:product, name: "p1", department_code: "robot",
      started_on: Date.new(2000, 1, 1), ended_on: Date.new(2002, 12, 1))
    FactoryGirl.create(:product, name: "p2", department_code: "robot",
      started_on: Date.new(2001, 1, 1), ended_on: nil)
    FactoryGirl.create(:product, name: "p3", department_code: "robot",
      started_on: Date.new(2002, 1, 1), ended_on: nil)
    FactoryGirl.create(:product, name: "p4", department_code: "ship",
      started_on: Date.new(2000, 1, 1), ended_on: nil)
    
    DurationLimited.current_date = Date.new(2001, 1, 1)
    
    dep = Department.find("robot")
    dep.should have(2).products
    
    products = dep.products.order("products.started_on")
    
    products[0].name.should == "p1"
    products[1].name.should == "p2"
  end
end
