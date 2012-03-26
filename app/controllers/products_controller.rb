class ProductsController < ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @products = @department.products.order("products.code, products.model_number")
  end
  
  def show
    @department = Department.find(params[:department_id])
    @product = @department.products.find(params[:id])
  end
end
