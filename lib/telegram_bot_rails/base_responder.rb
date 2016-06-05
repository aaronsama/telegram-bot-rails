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
    end

    def respond
      states = self.class.class_eval { self.states }
      states[current_state].each do |regex, action| #stop on the first?
        regex =~ @message #or whatever
        if $~
          action.call(self, *$~.to_a[1..-1])
        end
      end
    end

    protected

    def current_state
      @conversation.state || :start
    end

    def go_to_state state
      @conversation.update_attribute :state, state
    end

    def send_answer text, answers=nil
      MessageSender.new(bot: @client,
                        chat: @conversation.id,
                        text: text,
                        answers: answers).send
    end

  end
end
