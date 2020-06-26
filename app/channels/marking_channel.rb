class MarkingChannel < ApplicationCable::Channel
  @@cpt = 0
  def subscribed
    # stream_from "some_channel"
    stream_from "marking_channel_#{params[:game_id]}"
  end

  def received(data)
    puts "#############################################"
    puts params
    puts "#############################################"
    puts data
    puts "#############################################"
    data = data.except('action')
    data["answers"].each do |answer|
      @response = Response.find(answer["id"])
      if !@response.score.nil?
        @response.update(score: @response.score + answer["score"], nbmarking: @response.nbmarking + 1 )
      else
        @response.update(score: 0 + answer["score"], nbmarking: @response.nbmarking + 1 )  
      end
      puts @response
    end
    @responses = Response.where(game_id: params[:game_id])

    if @responses.any?{|ans| ans.nbmarking != params[:validator] - 1 }
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
