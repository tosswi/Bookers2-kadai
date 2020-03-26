class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]

  def top
  	if current_user
        redirect_to user_path(current_user)
    end
  end

  def index
		@users=User.all
    @book=Book.new
    @user=current_user

  end
  def show
  	@user=User.find(params[:id])
  	@book1=User.find(params[:id]).books
  	 @book=Book.new
  end
  def search
    @users = User.search(params[:search])
     @book=Book.new
    @user=current_user
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  		@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
  	redirect_to user_path(@user.id)
    else
  	render :edit
    end
  end
    def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
private
  def user_params
      params.require(:user).permit(:name,:introduction,:profile_image)
    end
def correct_user
  @user=User.find(params[:id])

     redirect_to user_path(current_user) unless @user == current_user

end
end