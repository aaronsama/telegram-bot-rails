class BotGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  argument :token, type: :string, required: true, desc: "Your bot's token"

  def create_bot
    @name = name
    @token = token
    migration_template "add_bot_to_bots.rb.erb", "db/migrate/add_#{name.underscore}_to_bots.rb"
  end

  def copy_responder_file
    @name = name
    template "responder.rb.erb", "app/responders/#{name.underscore}_responder.rb"
  end

  private

  def self.next_migration_number(dir)
    @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
  end
end
