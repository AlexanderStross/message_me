class ChatroomChannel < ApplicationCable::Channel
  # import Pusher from 'pusher-js/with-encryption'
  def subscribed
    stream_from 'chatroom_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
