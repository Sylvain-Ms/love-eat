class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    @messages = Message.where(conversation: @conversation)
  end
end
