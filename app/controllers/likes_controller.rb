class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user

    respond_to do |format|
      if @like.save
        format.json { render json: { message: 'Item is successfully created', item: @like, match: @like.match? } }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_liked_id)
  end
end
