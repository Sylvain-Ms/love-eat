class SuggestionsController < ApplicationController
  def show
    @restaurants = Restaurant.where(category: current_user.foodmoods.map(&:name))
  end
end
