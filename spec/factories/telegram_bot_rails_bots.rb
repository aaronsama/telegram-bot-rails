FactoryGirl.define do
  factory :telegram_bot_rails_bot, class: 'TelegramBotRails::Bot' do
    name "MyString"
    description "MyText"
    token "MyString"
  end
end
