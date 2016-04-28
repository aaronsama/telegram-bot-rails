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
        #TODO raise exception
      end
    end

    def matchings
      @matchings ||= {}
    end

  end
end
