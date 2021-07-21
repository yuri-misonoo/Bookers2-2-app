class UsersController < ApplicationController
  before_action :ensure_correct_user, only[:edit, :update]

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update
      redirect_to user_path(@user.id), notice: "You have updated user successfully"
    else
      render :edit
    end
    
    def ensure_correct_user
      @book = Book.find(params[:id])
      unless @book.user = current_user
        redirect_to books_path
      end
    end
    
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
