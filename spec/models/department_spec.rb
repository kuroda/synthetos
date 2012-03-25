# coding: utf-8

require 'spec_helper'

describe Department do
  subject { FactoryGirl.create(:department) }
  
  it "部門(department)を複合キーで検索できる" do
    subject.code = "robot"
    subject.seq_number = 7
    subject.name = "Robot"
    subject.save!
    
    dep = Department.find("robot,7")
    dep.name.should == subject.name
  end
end
