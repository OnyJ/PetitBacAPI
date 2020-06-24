class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{:id}"

    @history = History.create(user_id: params[:user_id], game_id: params[:game_id])
    puts '*************************************'
    puts params
    puts '*************************************'
    puts History.last
    puts @history.errors.messages
  end

  # def players(data)
  #   puts '################################################'
  #   puts data['game_id']
  #   puts params
  #   puts '################################################'
  #   @players = Game.find(data['game_id']).users
  #   puts '################################################'
  #   puts @players
  #   puts '################################################'
  #   ActionCable.server.broadcast('room_channel_id', @players, action:'players')
  # end

  def received(data)
    puts '################################################'
    puts data['game_id']
    puts params
    puts '################################################'
    @players = Game.find(params['game_id']).users
    puts '################################################'
    puts @players
    puts '################################################'
    ActionCable.server.broadcast('room_channel_id', @players)
    #DemoChannel.broadcast_to('demo_channel', data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
