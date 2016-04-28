require 'telegram_bot_rails/state_builder'

module TelegramBotRails
  class BaseResponder

    class << self

      protected

      def states
        @states ||= {"start" => {}}
      end

      def in_state state_name
        states[state_name] = {} unless states[state_name]
        state_builder = StateBuilder.new(state_name)
        yield state_builder
        states[state_name] = state_builder.matchings
      end

    end

    def initialize bot, request
      @bot = bot
      @request = request
      # extract message etc
      # @bot = Bot.find_by token: request.token???
      # @conversation = Conversation.find_or_create_by ...
    end

    def respond
      states = self.class.class_eval { states }
      states[current_state].each do |regex, action| #stop on the first?
        regex =~ @message.text #or whatever
        if $~
          case action.arity
          when 0
            action
          when 1
            action $1
          when 2
            action $1, $2
          # and so on
          end
        end
      end
      # check conversation state
      # look at all the matchings and do your magic

      # necessary to make states available to subclasses

    end

    protected

    def current_state
      "start" # return the current conversation state
    end

  end
end
