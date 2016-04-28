module TelegramBotRails
  class Bot < ActiveRecord::Base

    has_many :conversations

  end
end
