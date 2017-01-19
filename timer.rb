require File.dirname(__FILE__) + '/send.rb'

def background_run_at(time, message)
  fork do
    sleep(1) until Time.now >= time
    send_answer(message)
  end
end