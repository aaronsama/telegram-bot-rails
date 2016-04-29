class ApplicationResponder < TelegramBotRails::BaseResponder

  in_state :start do |s|
    s.on /test_with_symbol/, :test_with_symbol
    s.on /test_with_block/ do
      puts "test_with_block"
    end
  end

  def test_with_symbol
    puts "test_with_symbol"
  end

end
