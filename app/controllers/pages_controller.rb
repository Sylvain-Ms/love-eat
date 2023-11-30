class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    foodmoods_id = current_user.foodmood_ids
    @users = User.where(foodmoods: foodmoods_id)

    if foodmoods_id.nil?
      redirect_to controller: "users/foodmoods", action: :index
    end
  end
end
