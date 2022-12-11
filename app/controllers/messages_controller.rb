class MessagesController < ApplicationController
 
  def create
    # session[:user] = msg_params[:user]
    if Room.find(params[:room_id])
    @message = Message.create(body: msg_params[:body], room_id: params[:room_id], user: session[:user])
    else
    redirect_to controller: :RoomsController, action: "index"
    end
  end
  private
  def msg_params
    params.require(:message).permit(:body, :user)
  end
end
