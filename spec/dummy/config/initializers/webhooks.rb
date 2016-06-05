require 'telegram/bot'
  TelegramBotRails::Bot.find_each do |bot|
    Telegram::Bot::Client.run(bot.token) do |client|
      Rails.application.reload_routes!
      webhook_url = TelegramBotRails::Engine.routes.url_helpers.webhook_url(token: bot.token)
      client.api.setWebhook(url: webhook_url, certificate: File.read("#{Rails.root}/config/public.pem"))
    end
  end
