module TelegramBotRails
  class Bot < ActiveRecord::Base

    has_many :conversations

    def client
      Telegram::Bot::Client.new token
    end
  end
end
