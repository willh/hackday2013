
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

get '/feedback/:type/general' do
  params[:good_points] = session[FEEDBACK_KEY][:good_points]
  params[:bad_points] = session[FEEDBACK_KEY][:bad_points]
  params[:general_comments] = session[FEEDBACK_KEY][:general_comments]

  erb :general
end

post '/feedback/:type/general' do
  session[FEEDBACK_KEY][:good_points] = params[:good_points]
  session[FEEDBACK_KEY][:bad_points] = params[:bad_points]
  session[FEEDBACK_KEY][:general_comments] = params[:general_comments]

  redirect "/feedback/#{session[FEEDBACK_KEY][:incident_type]}/general/overall"
end

get '/feedback/:type/general/overall' do
  erb :index
end

post '/feedback/:type' do
  "posted!"
end
