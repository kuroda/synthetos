class DepartmentsController < ApplicationController
  def index
    @departments = Department.order("code, seq_number")
  end
end
