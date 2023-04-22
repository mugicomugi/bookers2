class UsersController < ApplicationController
    
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
  end
    
  def new
    @books = Book.new
  end
  
   
  def edit
  end    
  
  
  
  
  private
  
  def users_params
    params.require(:users).permit(:name, :user_id)
  end
  
    
end
