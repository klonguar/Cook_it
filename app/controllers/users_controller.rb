class UsersController < ApplicationController
    
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 2)#Source: https://www.railstutorial.org/book/updating_and_deleting_users
  end
    
  def show
    @user = User.find(params[:id])
    @user_recipes = @user.recipes.paginate(page: params[:page], per_page: 1) #Source: https://www.railstutorial.org/book/updating_and_deleting_users
  end
  
  def edit
    @user = User.find(params[:id])
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
  


  def update
    @user = User.find(params[:id]) #Source:https://www.railstutorial.org/book/updating_and_deleting_users
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to recipes_path, notice: 'Your account was updated successfully' }
      else
        format.html { render :edit }
      end
    end
  end



  
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

#this code:  @user = User.find(params[:id]) 
#source:https://www.railstutorial.org/book/updating_and_deleting_users
