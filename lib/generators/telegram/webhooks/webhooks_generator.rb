module Telegram
  class WebhooksGenerator < Rails::Generators::Base

    def add_routes
      route 'mount TelegramBotRails::Engine => "/telegram_bot_rails"'
    end

   #TODO: set default url options(:host)
    def create_initializer
      initializer "webhooks.rb" do
        %{require 'telegram/bot'
  TelegramBotRails::Bot.find_each do |bot|
    Telegram::Bot::Client.run(bot.token) do |client|
      Rails.application.reload_routes!
      webhook_url = TelegramBotRails::Engine.routes.url_helpers.webhook_url(token: bot.token)
      client.api.setWebhook(url: webhook_url, certificate: File.read("\#{Rails.root}/config/public.pem"))
    end
  end}
      end
    end

  end
end
