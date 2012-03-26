# coding: utf-8

require 'spec_helper'

describe Department do
  let(:department0) { FactoryGirl.create(:department,
      code: "robot", name: "Department0",
      started_on: Date.new(2000, 1, 1), ended_on: Date.new(2002, 1, 1)) }
  let(:department1) { FactoryGirl.create(:department,
      code: "robot", name: "Department1",
      started_on: Date.new(2002, 1, 1), ended_on: nil) }
  
  it "部門(department)を複合キーで検索できる" do
    department0
    department1
    
    dep0 = Department.find("robot", Date.new(2001, 1, 1))
    dep0.name.should == department0.name
    
    dep1 = Department.find("robot", Date.new(2003, 1, 1))
    dep1.name.should == department1.name
  end
end
