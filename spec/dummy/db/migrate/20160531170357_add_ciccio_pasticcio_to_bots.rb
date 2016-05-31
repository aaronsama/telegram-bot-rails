class AddCiccioPasticcioToBots < ActiveRecord::Migration

  def up
    TelegramBotRails::Bot.create(name: "CiccioPasticcio", token: "ABCDEF12543646", responder_name: "CiccioPasticcioResponder")
  end

  def down
    TelegramBotRails::Bot.find_by(token: "ABCDEF12543646").destroy
  end

end
