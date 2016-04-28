# This migration comes from telegram_bot_rails (originally 20160428091347)
class CreateTelegramBotRailsBots < ActiveRecord::Migration
  def change
    create_table :telegram_bot_rails_bots do |t|
      t.string :name
      t.text :description
      t.string :token, null: false
      t.string :responder_name, null: false, default: "application_responder"

      t.index :token

      t.timestamps null: false
    end
  end
end
