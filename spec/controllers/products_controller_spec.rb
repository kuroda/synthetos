# coding: utf-8

require 'spec_helper'

describe ProductsController do
  let(:department) { FactoryGirl.create(:department, started_on: Date.new(1999, 1, 1)) }
  let(:product) { FactoryGirl.create(:product,
      department_code: department.code, started_on: Date.new(1999, 1, 1)) }
  
  before do
    DurationLimited.current_date = Date.new(2000, 1, 1)
  end
  
  describe "department_product_path" do
    it "ハッシュでURLパスを作る" do
      department_product_path(current_date: "2000-01-01",
        department_id: product.department.code, id: product.code).
        should == "/2000-01-01/departments/#{product.department.code}/products/#{product.code}"
    end
  end
end
