
require 'rubygems'
require 'sinatra'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

helpers do

end

get '/' do
  erb :index
end

get '/feedback/:type' do
  case params[:type]
    when "drug-errors"
      erb :"drug-errors"
    when "miscommunication"
      erb :"miscommunication"
    else
      raise ArgumentException("Unknown type: #{params[:type]}")
    end
end

post '/feedback/:type' do
  "posted!"
end
