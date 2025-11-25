require 'sinatra'
require 'sinatra/reloader'
require 'dotenv/load'
require 'openai'
require 'http'
require 'json'
require 'redcarpet'
require 'rack/utils'

set :public_folder, 'public'
set :views, File.expand_path("views", __dir__)


get('/') do
  erb(:homepage)
end

get('/recipes') do
  client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_API_KEY'))
  raw_input = params[:ingredients]
  redirect '/', 303 if raw_input.nil? || raw_input.strip.empty?
  request = Rack::Utils.escape_html(raw_input.strip)
  message_list = [
    {
      'role' => 'system',
      'content' => "You are a helpful recipe assistant. A user will provide a list of ingredients they currently have in their kitchen. Your job is to generate a realistic, beginner-friendly recipe based on their input. If the input contains non-food items or is not a list of ingredients, do not ask the user for clarification. Instead, clearly explain that the input was not recognized as a list of ingredients and provide a popular, simple recipe using common household items.Always provide a recipe, even if the input was not recognized as a list of ingredients. Never ask the user for clarification or additional input. Use as many of the user’s ingredients as make sense, but do not invent or ask for additional ingredients. You may only add common kitchen staples such as salt, pepper, oil, butter, and water. Formatting rules: Wrap the recipe title in <h3> tags. Use <h4> tags for the 'Ingredients' and 'Instructions' section headers. Keep the response short, clear, and focused only on the recipe."
    }
  ]
  message_list.push({ 'role' => 'system', 'content' => request })

  begin
    api_response = client.chat(
      parameters: {
        model: 'gpt-4o-mini',
        messages: message_list
      }
    )
    choices_array = api_response.fetch('choices')
    index_hash = choices_array[0]
    message_hash = index_hash.fetch('message')
    @content = message_hash.fetch('content').to_s
    message_list.push({ 'role' => 'assistant', 'content' => @content })
    renderer = Redcarpet::Render::HTML.new
    @markdown = Redcarpet::Markdown.new(renderer)
    @response_html = @markdown.render(@content)
    erb(:recipes)
  rescue StandardError
    redirect '/?error=service_unavailable', 303
  end
end
