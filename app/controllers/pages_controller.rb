class PagesController < ApplicationController
  def home
    if user_signed_in?
      foodmoods = current_user.foodmoods.map(&:name)
      redirect_to controller: "users/foodmoods", action: :index if foodmoods.empty?

      @users = User.joins(:foodmoods).where(foodmoods: { name: foodmoods }).where.not(id:current_user.id ).uniq
    else
      redirect_to new_user_session_path
    end
  end
end
