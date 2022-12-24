class MessagesController < ApplicationController
  
  def create
    if session[:user]
      if Room.find(params[:room_id])
        if msg_params[:body] != ""
          @message = Message.create(body: msg_params[:body], room_id: params[:room_id], user: session[:user])
        else
          flash[:error] =  "Your message is empty"
        end
      else
        redirect_to rooms_path
      end
    else
      redirect_to rooms_path
    end
  end

  private
  def msg_params
    params.require(:message).permit(:body, :user)
  end
end
