class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update_without_password(user_params)

    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:distance,
                                 :first_name,
                                 :last_name,
                                 :birthdate,
                                 :description,
                                 :preferences,
                                 :gender,
                                 :diet,
                                 pictures: [])
  end
end
