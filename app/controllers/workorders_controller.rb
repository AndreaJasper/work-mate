require 'pry'
class WorkordersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :set_workorder, only: [:show, :edit, :update, :destroy]


  def index
    @workorders = Workorder.all
  end
  
  def show
  end

  def new
    @workorder = Workorder.new
  end

  def create
    @workorder = Workorder.new(workorder_params)
    @workorder.user_id = current_user.id

    if @workorder.save
      redirect_to @workorder
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @workorder.update(workorder_params)
      redirect_to @workorder, notice: 'Workorder successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workorder = current_user.workorders.find(params[:id])
    @workorder.destroy

    redirect_to root_path, notice: 'Workorder has been successfully deleted.'
  end

  private
  def set_workorder
    @workorder = Workorder.find(params[:id])
  end

  def workorder_params
      params.require(:workorder).permit(:title, :description, :multiplier, :labor_hours, :user_id)
  end
end