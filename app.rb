
require 'rubygems'
require 'sinatra'

FEEDBACK_KEY = "best.feedback"

use Rack::Session::Cookie, :key => FEEDBACK_KEY,
                           :path => '/',
                           :expire_after => 3600, # In seconds
                           :secret => 'nhs-hackday-best'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

helpers do

end

get '/' do
  erb :index
end

get '/feedback' do
  session[FEEDBACK_KEY] ||= {}
  erb :feedback
end

post '/feedback' do
  puts params["incident-date"]
  session[FEEDBACK_KEY] ||= {}
  session[FEEDBACK_KEY][:date] = params[:date]
  session[FEEDBACK_KEY][:type] = params[:type]

  redirect "/feedback/#{params[:type]}"
end

get '/feedback/:type' do
  puts "feedback/#{params[:type]}: #{session[FEEDBACK_KEY]}"

  case params[:type]
  when "drug-errors"
    erb :"drug-errors"
  when "miscommunication"
    erb :"miscommunication"
  else
    raise ArgumentException("Unknown type: #{params[:type]}")
  end
end

get '/feedback/:type/notable' do
  erb :index
end

get '/feedback/:type/notable/overall' do
  erb :index
end

post '/feedback/:type' do
  "posted!"
end
