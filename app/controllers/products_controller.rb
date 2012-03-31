class ProductsController < ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @products = @department.products.order("products.code")
  end
  
  def show
    @department = Department.find(params[:department_id])
    @product = @department.products.where(code: params[:id]).first
  end
end
