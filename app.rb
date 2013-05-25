
require 'rubygems'
require 'sinatra'
require 'activerecord'
require 'sinatra/activerecord'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  set :database, ENV['DATABASE_URL'] || 'postgres://localhost/hackday2013'
end

helpers do

end

get '/' do
  erb :index
end

get '/feedback' do
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

get '/feedback/:type/notable'
  erb :index
end

get '/feedback/:type/notable/overall' do
  erb :index
end

post '/feedback/:type' do
  "posted!"
end
