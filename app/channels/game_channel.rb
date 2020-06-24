class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_channel_#{params[:game_id]}"
  end
  
  def received(data)
    ActionCable.server.broadcast("game_channel_#{params[:game_id]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
