# coding: utf-8

require 'spec_helper'

describe Category do
  subject { FactoryGirl.create(:category, code: "c0",
      started_on: Date.new(1999, 1, 1), ended_on: nil) }
  let(:product0a) { FactoryGirl.create(:product,
      code: "p0", name: "Product0a",
      started_on: Date.new(2000, 1, 1), ended_on: Date.new(2002, 1, 1)) }
  let(:product0b) { FactoryGirl.create(:product,
      code: "p0", name: "Product0b",
      started_on: Date.new(2002, 1, 1), ended_on: nil) }
  let(:product1) { FactoryGirl.create(:product,
      code: "p1", name: "Product1",
      started_on: Date.new(1999, 1, 1), ended_on: nil) }
  
  before do
    product0a
    product0b
    product1
  end
  
  it "2001年1月1日当時の製品(product)リストと関連づけできる" do
    FactoryGirl.create(:category_product_link,
      category_code: subject.code, product_code: "p0",
      started_on: Date.new(2000, 1, 1), ended_on: nil)
    FactoryGirl.create(:category_product_link,
      category_code: subject.code, product_code: "p1",
      started_on: Date.new(1999, 1, 1), ended_on: nil)

    DurationLimited.current_date = Date.new(2001, 1, 1)
    
    cat = Category.find(subject.code)
    cat.should have(2).products
    cat.products.map(&:name).sort.should == [ "Product0a", "Product1" ]
  end
end
