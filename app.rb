
require 'rubygems'
require 'sinatra'
require 'activerecord'
require 'sinatra/activerecord'

FEEDBACK_KEY = "best.feedback"

use Rack::Session::Cookie, :key => FEEDBACK_KEY,
                           :path => '/',
                           :expire_after => 3600, # In seconds
                           :secret => 'nhs-hackday-best'

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

  params[:good_points] ||= []
  params[:bad_points] ||= []
  params[:general_comments] ||= ""

  erb :general
end

post '/feedback/:type/general' do
  session[FEEDBACK_KEY][:good_points] = params[:good_points]
  session[FEEDBACK_KEY][:bad_points] = params[:bad_points]
  session[FEEDBACK_KEY][:general_comments] = params[:general_comments]

  redirect "/feedback/#{params[:type]}/general/overall"
end

get '/feedback/:type/general/overall' do
  erb :index
end

get '/feedback/:type/general/overall' do
  "posted"
end

def good_points_options
  [
    {:name => "Staff were friendly", :value => "friendy"},
    {:name => "Staff were helpful", :value => "helpful"},
    {:name => "Facilities were clean", :value => "clean"},
    {:name => "Food was high quality", :value => "good_food_quality"}
  ]
end

def bad_points_options
  [
    {:name => "Staff unfriendly", :value => "unfriendly"},
    {:name => "Staff unhelpful", :value => "unhelpful"},
    {:name => "Facilities unclean", :value => "unclean"},
    {:name => "Food was poor quality", :value => "poor_food_quality"}
  ]
end
