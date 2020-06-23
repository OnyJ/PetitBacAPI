class DemoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "demo_channel_#{:id}"
  end
  
  def received(data)
    ActionCable.server.broadcast('demo_channel_id', data)
    #DemoChannel.broadcast_to('demo_channel', data)
  end
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
