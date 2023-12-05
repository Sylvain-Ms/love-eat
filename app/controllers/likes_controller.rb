class LikesController < ApplicationController
  def create
    user_liked = User.find(params[:user_liked_id])
    @like = Like.new(user_liked: user_liked)
    @like.user = current_user

    respond_to do |format|
      if @like.save
        format.json { render json: { message: 'Item is successfully created', item: @like, match: @like.match?(current_user, user_liked) } }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def match
    @user_liked = User.find(params[:user_liked_id])
    # render a partial: foodmatch
    respond_to do |format|
      format.html { redirect_to likes_path }
      format.text { render partial: "users/foodmatch", locals: {user_liked: @user_liked, user: current_user}, formats: [:html] }
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_liked_id)
  end
end
