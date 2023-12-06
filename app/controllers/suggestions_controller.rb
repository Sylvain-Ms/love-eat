class SuggestionsController < ApplicationController
  def show
    @restaurants = Restaurant.where(category: current_user.foodmoods.map(&:name))
  end

  def new
    @suggestion = Suggestion.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @suggestion.restaurant = @restaurant
    @suggestion.user_liked_id = user_liked_id

    if @suggestion.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])

    if @suggestion.update(suggestion_params)
      redirect_to @suggestion
    else
      render :edit
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:date, :hour)
  end
end
