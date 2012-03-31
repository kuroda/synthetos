class DepartmentsController < ApplicationController
  def index
    @departments = Department.order("code")
  end
end
