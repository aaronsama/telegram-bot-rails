Feature: Respond to calls to the webhook
  In order to talk to respond with the right bot
  As a Rails application
  I want to register 1 or many bot tokens

Scenario: Single bot registered in the application
  Given the following bot exists:
    | name | description | token       |
    | bot1 | test bot    | ABCDEF12345 |
  When a webhook is triggered with token "ABCDEF12345"
  Then a status 200 is returned
  And the responder for "bot1" is called

Scenario: An invalid token is passed to the webhook
  Given the following bots exist:
  | name | description | token       |
  | bot1 | test bot 1  | ABCDEF12345 |
  | bot2 | test bot 2  | ZBDTDK12456 |
  When a webhook is triggered with token "ZAGAJAGDJYH32__325262"
  Then a status 400 is returned
