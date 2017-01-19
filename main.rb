require 'telegram/bot'
require File.dirname(__FILE__) + '/response_logic.rb'

token = 'YOUR_BOT_API_TOKEN'

Telegram::Bot::Client.run(token) do |bot|
  logger = Logger.new('logfile.log')
  bot.listen do |message|
    begin
    @keyword = message.text[/\/([a-zA-Z]+)/]
    rescue => err
      log.fatal(err)
      log.fatal(message.text)
    else
    case @keyword
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      when '/set'
        @reply = form_response_set(message)
        bot.api.send_message(chat_id: message.chat.id, text: @reply)
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
    end


  end

end