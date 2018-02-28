class DepartmentsController < ApplicationController
  before_action :set_depart, only: [:show, :update, :edit, :destroy]

  def index
    @departs = Department.all
  end

  def show
  end

  def new
    @depart = Department.new
  end

  def edit
    # 
  end

  def create
    # binding.pry
    @depart = Department.new(depart_params)
    if @depart.save
      redirect_to departments_path(@depart)
    else
      render :new
    end
  end

  def update
    if @depart.update(depart_params)
      redirect_to department_path(@depart)
    else
      render :edit
    end
  end

  def destroy
    @depart.destroy
    redirect_to departments_path
  end



  private
    def depart_params
      params.require(:department).permit(:name) # :departments => the actual db model, not the instance. therefore, here we are passing the data into the database.
    end

    def set_depart
      @depart = Department.find(params[:id])
    end
end
