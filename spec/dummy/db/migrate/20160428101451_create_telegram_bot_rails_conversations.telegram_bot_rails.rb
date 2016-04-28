# This migration comes from telegram_bot_rails (originally 20160427164627)
class CreateTelegramBotRailsConversations < ActiveRecord::Migration
  def change
    create_table :telegram_bot_rails_conversations do |t|
      t.integer :chat_id
      t.integer :bot_id
      t.string :state

      t.index :bot_id

      t.timestamps null: false
    end
  end
end
