class MarkingChannel < ApplicationCable::Channel
  @@cpt = 0
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
    puts @@cpt
    puts params["validation"]
    if params["validation"] - 1 > @@cpt
      @@cpt += 1
    else
      Response.where(game_id: params[:game_id]).each do |answer|
        if answer.score >= 0
          answer.update(status: true)
        else
          answer.update(status: false)
        end
      end
      data["stop"] = true
      
    end
    ActionCable.server.broadcast("marking_channel_#{params[:game_id]}", data)
  end

  def stop(data)
    ActionCable.server.broadcast("marking_channel_#{params[:game_id]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
