Rails.application.routes.draw do

  mount TelegramBotRails::Engine => "/telegram_bot_rails"
end
