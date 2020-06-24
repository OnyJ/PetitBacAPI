class GameChannel < ApplicationCable::Channel
  def subscribed

    puts '#############################################'
    puts params
    stream_from "game_channel_#{params[:game_id]}"
    puts "#############################################"
  end
  
  def received(data)
    puts '*******************************************************'
    puts data
    puts params
    puts '*******************************************************'
    ActionCable.server.broadcast("game_channel_#{params[:game_id]}", data)
  end

  def stopping(data)
    puts '*******************************************************'
    ActionCable.server.broadcast("game_channel_#{params[:game_id]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
