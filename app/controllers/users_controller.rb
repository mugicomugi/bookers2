class UsersController < ApplicationController
  before_action :is_maching_login_user, only: [:edit, :update]
    
  def index
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
    
  def new
    @books = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end    
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "You have updated succesfully."
    redirect_to user_path(@user.id)
    else 
    render :edit
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :user_id, :introduction)
  end
  
   def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to post_images_path
    end 
   end 
    
end
