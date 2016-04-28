require_dependency "telegram_bot_rails/application_controller"

module TelegramBotRails
  class BotsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def webhook
      bot_token = params[:token]
      bot = Bot.find_by(token: bot_token)
      if bot.present?
        "#{bot.responder_name}".classify.constantize.new(bot, request).respond
        head :ok, content_type: 'application/json'
      else
        head :bad_request, content_type: 'application/json'
        # TODO: log that the bot wasn't found
      end
    end

  end
end
