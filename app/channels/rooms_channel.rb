class RoomsChannel < ApplicationCable::Channel
  def subscribed
     stream_from "rooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    raise NotImplementedError
  end

  def speak(data)
    @room.speak data
    puts data
  end
end
