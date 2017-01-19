def send_answer(message)
  token = 'YOUR_BOT_API_TOKEN'
  Telegram::Bot::Client.run(token) do |bot|
    bot.api.send_message(chat_id: message.chat.id, text: "The time has come")
  end
end