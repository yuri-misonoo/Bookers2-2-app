class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  end

  def update
  end
  
end
