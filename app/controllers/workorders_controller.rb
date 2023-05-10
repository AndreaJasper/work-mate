require 'pry'
class WorkordersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update, :destroy]

  def index
    @workorders = Workorder.all
  end
  
  def show
    @workorder = Workorder.find(params[:id])
  end

  def new
    @workorder = Workorder.new
  end

  def create
    @workorder = Workorder.new(workorder_params)
    @workorder.user_id = current_user.id

    # binding.pry
    if @workorder.save
      redirect_to @workorder
    else
      render :new
    end
  end

  def edit
    @workorder = Workorder.find(params[:id])
  end

  def update
    @workorder = Workorder.find(params[:id])

    if @workorder.update(workorder_params)
      redirect_to @workorder, notice: 'Workorder successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @workorder = Workorder.find(params[:id])
    @workorder.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def workorder_params
      params.require(:workorder).permit(:title, :description, :multiplier, :labor_hours, :user_id)
  end
end