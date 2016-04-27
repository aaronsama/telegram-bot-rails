require_dependency "telegram_bot_rails/application_controller"

module TelegramBotRails
  class BotsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def webhook
      bot_token = params[:token]
      bot = find_bot
      if bot.present?
        head :ok, content_type: 'application/json'
      else
        head :bad_request, content_type: 'application/json'
        # TODO: log that the bot wasn't found
      end
    end

    private

    def find_bot
      nil
    end
  end
end
