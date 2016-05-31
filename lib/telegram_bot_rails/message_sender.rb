require 'telegram_bot_rails/reply_markup_formatter'
# require './lib/app_configurator'

module TelegramBotRails
  class MessageSender
    attr_reader :bot
    attr_reader :text
    attr_reader :chat
    attr_reader :answers
    attr_reader :reply_to_message
    attr_reader :parse_mode
    attr_reader :hide_kb

    def initialize(options)
      @bot = options[:bot]
      @text = options[:text]
      @chat = options[:chat]
      @answers = options[:answers]
      @reply_to_message_id = options[:reply_to_message_id]
      @force_reply = options[:force_reply]
      @parse_mode = options[:parse_mode]
      @hide_kb = options[:hide_kb]
    end

    def send
      params = { chat_id: chat.id, text: text }
      params[:reply_markup] = reply_markup if reply_markup
      params[:reply_to_message_id] = @reply_to_message_id if @reply_to_message_id
      params[:reply_markup] = force_reply_markup if @force_reply
      params[:parse_mode] = @parse_mode if @parse_mode

      resp = bot.api.send_message(params)
    end

    private

    def reply_markup
      if answers.present?
        ReplyMarkupFormatter.new(answers).get_markup
      end
      # if hide_kb
      #   ReplyMarkupFormatter.new(nil).get_hide_keyboard
      # end
    end

    def force_reply_markup
      Telegram::Bot::Types::ForceReply.new(force_reply: true)
    end

  end
end
