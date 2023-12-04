class Foodmoods::RestaurantsController < ApplicationController

  def index
    @foodmoods = Foodmood.all
  end

  def new
    @foodmood = Foodmood.new
  end

  def create
    @foodmood = Foodmood.new(foodmood_params)
    @foodmood.user = current_user
    @foodmood.restaurants = @restaurant.find(params[:restaurant_ids])

    if @foodmood.save!
      redirect_to root_path
    else
      render :new, notice: 'Choose a Foodmood 🍴'
    end
  end

  def update
    @foodmood = Foodmood.find(params[:id])
    @foodmood.restaurants = @restaurant.find(params[:restaurant_ids])

    if @foodmood.save!
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def foodmood_params
    params.require(:foodmood).permit(:name)
  end

end
