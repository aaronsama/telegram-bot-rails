class ApplicationResponder < TelegramBotRails::BaseResponder



  in_state "pippo" do |s|
    s.on "pluto", :zadig
    s.on "paperino" do
      puts "paperino"
    end
  end

  def zadig
    puts "zadig"
  end

end
