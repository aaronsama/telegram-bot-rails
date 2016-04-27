class CreateTelegramBotRailsConversations < ActiveRecord::Migration
  def change
    create_table :telegram_bot_rails_conversations do |t|
      t.integer :chat_id
      t.string :bot_token
      t.string :state

      t.timestamps null: false
    end
  end
end
