require 'spec_helper'
# require '../lib/telegram_bot_rails'

shared_examples "when a valid matching is provided" do
  it "should add a new matching to the state" do
    previous_matchings = subject.matchings.dup
    expect{ subject.on(regex, &p) }.to change{ subject.matchings }.from(previous_matchings).to(previous_matchings.merge({ regex => p }))
  end
end

describe TelegramBotRails::StateBuilder.new(:test) do

  context "#on with a simple regex" do
    let(:regex) { /pippo/ }
    let(:p) { Proc.new{ puts "hey there" } }

    it_should_behave_like "when a valid matching is provided"
  end

  context "#on with a regex with 1 capture" do
    let(:regex) { /pippo (.*)/ }
    let(:p) { Proc.new {|a| } }
    it_should_behave_like "when a valid matching is provided"
  end

  context "when no block is provided to #on" do
    it "should raise an exception" do
      expect{ subject.on(/blabla/) }.to raise_exception "No block provided for /blabla/"
    end
  end

end
