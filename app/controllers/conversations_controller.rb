class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    @messages = Message.where(conversation: @conversation)
  end

  def index
    @matchs = Like.match(current_user)
  end

  def create
    @conversation = Conversation.find_or_create_by(user_id: current_user.id, user_liked_id: params[:user_liked_id])

    if @conversation.save!
      respond_to do |f|
        f.html { redirect_to @conversation }
        f.json { render json: { id: @conversation.id } }
      end
    else
      render :new, notice: "Un problème est survenu... Réessayez"
    end
  end

  def exist
    user_liked = User.find(params[:user_liked_id])
    @conversation = Conversation.find_by(user: current_user, user_liked: user_liked) || Conversation.find_by(user: user_liked, user_liked: current_user)
    if @conversation
      render json: { id: @conversation.id }
    else
      @conversation = Conversation.new(user_liked: user_liked)
      @conversation.user = current_user
      @conversation.save
      render json: { id: @conversation.id }
    end
  end

  def destroy
    @like = Like.find_by(user: current_user, user_liked_id: params[:user_liked_id])
    @like.destroy!

    render json: { status: :ok }
  end

  private

  def params_conversation
    params.require(:conversation).permit(:user_liked_id)
  end

end
