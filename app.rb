require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "openai"
require "http"
require "json"
require "redcarpet"

set :public_folder, 'public'


get("/") do
  
  erb(:homepage)
end


get("/recipies") do
  
  client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

  request = params.fetch("ingredients")
  
  message_list = [
    {
      "role" => "system",
      "content" => "A user will input ingredients and you need to output a recipie they can make with those ingredients."
    }
  ]
  

    message_list.push({"role" => "system", "content" => request})
    
      api_response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: message_list
        }
      )
  
      choices_array = api_response.fetch("choices")
      index_hash= choices_array[0]
      message_hash = index_hash.fetch("message")
      @content = message_hash.fetch("content").to_s
  
      message_list.push({"role" => "assistant", "content" => @content})

      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown.new(renderer)
      @response_html = @markdown.render(@content)
  

  erb(:recipies)
end
