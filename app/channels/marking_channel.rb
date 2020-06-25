class MarkingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "marking_channel_#{params[:game_id]}"
  end

  def received(data)
    data = data.except('action')
    data['answer'].each do |answer|
      @response = Response.find(answer["id"])
      @response.update(score: @response.score + answer["score"])
      puts @response
    end
    puts '******************************'
    puts data
    puts '******************************'
    puts ActionCable.server.connections.length
    ActionCable.server.broadcast("marking_channel_#{params[:game_id]}", data)
  end

  def stop(data)
    ActionCable.server.broadcast("marking_channel_#{params[:game_id]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
