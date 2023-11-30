class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(params_message)
    @message.sender = current_user
    @message.conversation = @conversation

    if @message.save!
      redirect_to conversation_path(@conversation), notice: "✅"
    else
      render :new, notice: "Un problème est survenu... Réessayez"
    end
  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end
