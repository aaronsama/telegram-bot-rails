# telegram-bot-rails

[![Code Climate](https://codeclimate.com/github/aaronsama/telegram-bot-rails/badges/gpa.svg)](https://codeclimate.com/github/aaronsama/telegram-bot-rails) [![Test Coverage](https://codeclimate.com/github/aaronsama/telegram-bot-rails/badges/coverage.svg)](https://codeclimate.com/github/aaronsama/telegram-bot-rails/coverage)

A gem to integrate a bot (or many bots) with your Rails application via webhooks

This is a work in progress (at a very early stage)

## Installation

### Add to your `Gemfile`

```ruby
gem 'telegram-bot-rails'
```

And `bundle install`.

### Setup

In the shell run

```
$ rake telegram_bot_rails:install:migrations
$ rake db:migrate
```

This will add two tables to your application: `telegram_bot_rails_bots` and `telegram_bot_rails_conversations`.

## Adding Bots to your application

This gem supports multiple bots, storing their credentials in the `telegram_bot_rails_bots` table. You can define `Responders` to respond to requests coming from Telegram bots in `app/responders`. Each bot must have a responder (you can use the same for multiple bots) and, by default, will use `ApplicationResponder` (`app/responders/application_responder.rb`). You need to create your first responder following this template.

```ruby
class ApplicationResponder < TelegramBotRails::BaseResponder

  in_state :start do |s|
    s.on /regex1/, :call_some_method
    s.on /regex2/ do
      # execute some block
    end
  end

  # in_state :some_state do ...

end
```

You can also use a generator

```
$ rails g bot NAME TOKEN
```

This will create a migration to add the new bot to the DB and will create a new responder. You can also add your bot manually (or programmatically) with `Bot.create(name: "name", token: "TOKEN", responder_name: "RESPONDER CLASS")`.

## Credits

* [telegram-bot-ruby by atipugin](https://github.com/atipugin/telegram-bot-ruby) (which this gem uses)
* [telegram-bot-ruby-boilerplate by MaximAbramchuck](https://github.com/MaximAbramchuck/ruby-telegram-bot-starter-kit) (a lot of code comes from this and the very idea of this gem came from a small contribution to this repo)
