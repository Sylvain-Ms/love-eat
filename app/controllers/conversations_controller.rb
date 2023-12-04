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
    @conversation = Conversation.new(params_conversation)
    @conversation.user = current_user

    if @conversation.save!
      redirect_to @conversation
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

  private

  def params_conversation
    params.require(:conversation).permit(:user_liked_id)
  end

end
