# Put your stuff here
class CiccioPasticcioResponder < TelegramBotRails::BaseResponder

  in_state :start do |s|
    s.on /.*/ do
      # responds always
      # TODO
    end
  end

  # USAGE
  # in_state :state_name do |s|
  #   s.on REGEX_OR_STRING, METHOD_NAME OR BLOCK
  # end

end
