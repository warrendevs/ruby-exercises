require_relative 'lib/eliza_questions'
require 'rack'

app = Proc.new do |env|
  # req = Rack::Request.new env
  # question = req.params['user_input']
  #
  # if question == nill
  #   user_response = " "
  # else
  #   user_response = Response.get_answer question
  # end
  # # puts req.params.inspect
  # ['200', {'Content-Type' => 'text/html'}, ["
  #   <p>#{user_response}</p><br>
  #   <form>
  #   <input class='text' name='user_input'><br>
  #   <button type='submit' >OK</input>"]]

  req = Rack::Request.new env
  question = req.params['user_input']
  if question == nil
    ['200', {'Content-Type' => 'text/html'}, ["
      <form>
      <input class='text' name='user_input'><br>
      <button type='submit' >OK</input>"]]
  else
    user_response = Response.get_answer question
    ['200', {'Content-Type' => 'text/html'}, ["
      <p>#{user_response}</p><br>
      <form>
      <input class='text' name='user_input'><br>
      <button type='submit' >OK</input>"]]
  end
end

Rack::Handler::WEBrick.run app
