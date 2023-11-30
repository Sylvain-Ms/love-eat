class Users::FoodmoodsController < ApplicationController

  def index
    @foodmoods = Foodmood.all
  end

  def create
    @foodmood = Foodmood.find(params[:id])
    current_user.foodmoods << @foodmood

    if @foodmood.save!
      redirect_to root_path, notice: "Your foodmood has been registered 🍕"
    else
      render :index
    end
  end

  private

  def foodmood_params
    params.require(:foodmood).permit(:name, :user_id)
  end

end
