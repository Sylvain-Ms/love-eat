class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(content: params[:content])
    @message.sender = current_user
    @message.conversation = @conversation

    if @message.save!
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "shared/chat_bubble", locals: {message: @message})
      )
      head :ok
      # redirect_to conversation_path(@conversation)
    else
      render :new, notice: "Un problème est survenu... Réessayez"
    end
  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end
