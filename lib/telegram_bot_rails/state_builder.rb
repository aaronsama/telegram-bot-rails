module TelegramBotRails
  class StateBuilder

    def initialize(state)
      @state = state
    end

    def on regex, action=nil, &block
      if block_given?
        matchings[regex] = block
      elsif action
        matchings[regex] = action.to_proc
      else
        raise Exception.new("No block provided for #{regex.inspect}")
      end
    end

    def matchings
      @matchings ||= {}
    end

  end
end
