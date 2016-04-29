require 'spec_helper'

describe ApplicationResponder do

  let(:bot) { TelegramBotRails::Bot.create(name: "test_bot", token: "ABCDEFG") }

  subject { ApplicationResponder.new(bot, message) }

  context "when the message is 'test_with_symbol'" do
    let(:message) { "test_with_symbol" }
    it "should execute :test_with_symbol" do
      expect{ subject.respond }.to output("test_with_symbol\n").to_stdout
    end
  end

  context "when the message is 'test_with_block'" do
    let(:message) { "test_with_block" }
    it "should execute the block" do
      expect{ subject.respond }.to output("test_with_block\n").to_stdout
    end
  end

end
