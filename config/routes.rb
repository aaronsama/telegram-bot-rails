TelegramBotRails::Engine.routes.draw do

  post 'bot/:token', to: 'bots#webhook', defaults: { format: :json }

end
