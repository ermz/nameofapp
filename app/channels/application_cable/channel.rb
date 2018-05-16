module ApplicationCable
  class Channel < ActionCable::Channel::Base
    ActionCable.server.broadcast 'product_channel', comment: "Hello World", average_rating: 5
  end
end
