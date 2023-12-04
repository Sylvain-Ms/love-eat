class PagesController < ApplicationController
  def home
    if user_signed_in?
      foodmoods_id = current_user.foodmood_ids
      @users = User.where(foodmoods: foodmoods_id)

      if foodmoods_id.nil?
        redirect_to controller: "users/foodmoods", action: :index
      end
    else
      redirect_to new_user_session_path
    end
  end
end
