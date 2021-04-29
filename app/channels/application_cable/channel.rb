module ApplicationCable
  class Channel < ActionCable::Channel::Base
    # Вызывается, когда потребитель успешно
    # стал подписчиком этого канала
    def subscribed
    end
  end
end
