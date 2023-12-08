class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(content: params[:content])
    @message.sender = current_user
    @message.conversation = @conversation

    if @message.save!
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "shared/chat_bubble", locals: {message: @message}, formats: [:html])
      )
      head :ok
      # redirect_to conversation_path(@conversation)
    else
      render :new, notice: "Un problème est survenu... Réessayez"
    end
  end

  def get_asking_card
    @restaurant = Restaurant.find(params[:restaurant_id])
    @conversation = Conversation.find(params[:conversation_id])
    user_liked_id = @conversation.user_id == current_user.id ? @conversation.user_liked_id : @conversation.user_id
    @suggestion = Suggestion.create(user: current_user, restaurant: @restaurant, user_liked_id: user_liked_id, status: 'pending' )
    p @suggestion.errors.messages
    respond_to do |f|
      f.text { render partial: 'shared/cards_asking', locals: { restaurant: @restaurant, suggestion: @suggestion }, formats: [:html]}
    end
  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end
