require 'telegram_bot_rails/state_builder'
require 'telegram_bot_rails/message_sender'

module TelegramBotRails
  class BaseResponder

    class << self

      protected

      def states
        @states ||= {start: {}}
      end

      def in_state state_name
        states[state_name] = {} unless states[state_name]
        state_builder = StateBuilder.new(state_name)
        yield state_builder
        states[state_name] = state_builder.matchings
      end

    end

    def initialize bot, request
      @bot = Bot.find_by token: bot.token
      @client = @bot.client
      @update = Telegram::Bot::Types::Update.new(request)
      @message = @update.message
      @conversation = Conversation.find_or_create_by chat_id: @message.chat.id, bot_id: @bot.id

      # @user = User.find_or_create_by(uid: message.from.id)
      # if message.chat.id != @user.chat_id
      #   @user.update_attributes chat_id: message.chat.id
      # end

      # extract message etc
      # @bot = Bot.find_by token: request.token???
      # @conversation = Conversation.find_or_create_by ...
    end

    def respond
      states = self.class.class_eval { self.states }
      states[current_state].each do |regex, action| #stop on the first?
        regex =~ @message #or whatever

        if $~
          action.call(self, *$~.to_a[1..-1])
          # case action.arity #TODO: CAPIRE come fare a chiamare le Proc (e passare i parametri)
          # when -1
          #   # when passing symbols instead of proc
          # when 0
          #   action
          # when 1
          #   action $1
          # when 2
          #   action $1, $2
          # # and so on
          # end
        end
      end
      # check conversation state
      # look at all the matchings and do your magic

      # necessary to make states available to subclasses

    end

    protected

    def current_state
      @conversation.state || :start
    end

    def go_to_state state
      @conversation.update_attribute :state, state
    end

    def send_answer
      MessageSender.new(bot: @client,
                        chat: @conversation.id,
                        text: "Pizza, insalata o qualcosa dalla cucina?",
                        answers: [
                          "#{MenuBuilder.emoji_for(:pizze)} Pizze",
                          "#{MenuBuilder.emoji_for(:insalate)} Insalate",
                          "#{MenuBuilder.emoji_for(:cucina)} Cucina"
                        ]).send
    end

  end
end
