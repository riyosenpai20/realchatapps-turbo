class RoomsController < ApplicationController
  def index
    if session[:user] != ""
      @room = Room.new
      @rooms = Room.public_rooms

      render 'index'
    else
      redirect_to root_path
    end
  end

  def show
    begin
      @single_room = Room.find(params[:id])

      @room = Room.new
      @rooms = Room.public_rooms

      @message = Message.new
      @messages = @single_room.messages.order(created_at: :asc)

      render 'index'  
    rescue
      redirect_to action: "index"
    end
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end

  def destroy
    @room = Room.find(params[:id])
    Message.destroy_by(room: @room)
    @room.destroy
    redirect_to action: "index"
  end
end
