class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    foodmoods_id = current_user.foodmood_ids
    @users = User.where(foodmoods: foodmoods_id)
  end

  # si foodmoods == nil, alors
    # redirect to create foodmood
  # else
    # home

end
