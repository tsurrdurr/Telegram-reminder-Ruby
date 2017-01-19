require File.dirname(__FILE__) + '/timer.rb'

def form_response_set(message)
  @num = message.text[/\d+/]
  unless @num.nil? || @num == 0
    @now = Time.now
    @then = @now + @num.to_i
    background_run_at(@then, message)
    @str = "I'm starting to count..."
    # @str = sum([Time.now, 5])
  else
    @str = "Sorry I do not understand..."
  end
  return @str
end