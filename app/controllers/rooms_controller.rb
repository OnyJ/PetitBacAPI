class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    render json: @rooms
  end

  def create
    @room = Room.create(room_params)
    render json: @room
  ActionCable.server.broadcast 'rooms_channel', @room
end

def room_params
  params.require(:room).permit(:name)
end

end
