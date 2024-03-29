class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
