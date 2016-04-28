module TelegramBotRails
  class Conversation < ActiveRecord::Base

    belongs_to :bot

  end
end
