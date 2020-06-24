class GameChannel < ApplicationCable::Channel
  def subscribed

    puts '#############################################'
    puts params
    stream_from "game_channel_#{params[:game_id]}"
    puts "#############################################"
  end
  
  def received(data)
    data = data.except('action')
    @user = User.find(params[:user_id])
    @game = Game.find(params[:game_id])
    data.each do |cat, value|
      @category = Category.find_by(name: cat)
      @response = Response.create(game_id: @game.id, user_id: @user.id, category_id: @category.id, content: value)
    end
   
  
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
