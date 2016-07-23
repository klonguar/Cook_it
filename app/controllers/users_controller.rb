class UsersController < ApplicationController
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to recipes_path, notice: 'Welcome to COOK IT APP #{@user.username}' }
      else
        format.html { render :new }
      end
    end
  end
  

  
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
