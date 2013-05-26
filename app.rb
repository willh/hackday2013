require './model/feedback'
require 'rubygems'
require 'sinatra'
require 'data_mapper' 
require_relative 'admin.rb'

FEEDBACK_KEY = "best.feedback"

use Rack::Session::Cookie, :key => FEEDBACK_KEY,
                           :path => '/',
                           :expire_after => 3600, # In seconds
                           :secret => 'nhs-hackday-best'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  DataMapper.setup(:default, (ENV['DATABASE_URL'] || 'postgres://localhost/hackday2013'))
  DataMapper.finalize
  DataMapper.auto_migrate!
  sample = Feedback.create(
    :location => "Ward 3", 
    :date => "2001-01-01 10:10:10", 
    :time_of_day => "Morning", 
    :type => "Communication", 
    :incident_points => ["Repeated allergies", "Repeated current medication"], 
    :incident_comments => "I'm not sure if the nurses treating me are talking", 
    :good_points => ["Staff pleasant", "Comfortable stay"], 
    :bad_points => ["Bedside phone not working", "Meals delivered late"], 
    :general_comments => "The staff were very nice", 
    :severity => "Low", 
    :safety => "Low", 
    :happened_before => "No",
    :told_us => "Yes",
    :how_important_safety => "Medium",
    :apologised => "Yes", 
    :satisfied => "", 
    :would_recommend => "Maybe"
    )
end

helpers do

end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/context' do
  erb :context
end

get '/feedback' do
  session[FEEDBACK_KEY] ||= {}
  erb :feedback
end

post '/feedback' do
  puts params["incident-date"]
  session[FEEDBACK_KEY] ||= {}
  session[FEEDBACK_KEY][:date] = params[:type]
  session[FEEDBACK_KEY][:type] = params[:type]

  redirect "/feedback/#{params[:type]}"
end

get '/feedback/:type' do
  params[:incident_points] = session[FEEDBACK_KEY][:incident_points]
  params[:incident_comments] = session[FEEDBACK_KEY][:incident_comments]

  params[:incident_points] ||= []
  params[:incident_comments] ||= ""

  incident_type.each do |o|
    if params[:type].include?(o[:value])
      params[:type_string] = o[:description]
    end
  end
  erb :"incidents"
end

post '/feedback/:type' do
  session[FEEDBACK_KEY][:incident_points] = params[:incident_points]
  session[FEEDBACK_KEY][:incident_comments] = params[:incident_comments]
  redirect "/feedback/#{params[:type]}/general"
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
  params[:severity] = session[FEEDBACK_KEY][:severity]
  params[:safety] = session[FEEDBACK_KEY][:safety]
  params[:happened_before] = session[FEEDBACK_KEY][:happened_before]
  params[:told_us] = session[FEEDBACK_KEY][:told_us]
  params[:how_important_safety] = session[FEEDBACK_KEY][:how_important_safety]
  params[:apologised] = session[FEEDBACK_KEY][:apologised]
  params[:satisfied] = session[FEEDBACK_KEY][:satisfied]
  params[:would_recommend] = session[FEEDBACK_KEY][:would_recommend]

  erb :overall
end

post '/feedback/:type/general/overall' do
  session[FEEDBACK_KEY][:severity] = params[:severity]
  session[FEEDBACK_KEY][:safety] = params[:safety]
  session[FEEDBACK_KEY][:happened_before] = params[:happened_before]
  session[FEEDBACK_KEY][:told_us] = params[:told_us]
  session[FEEDBACK_KEY][:how_important_safety] = params[:how_important_safety]
  session[FEEDBACK_KEY][:apologised] = params[:apologised]
  session[FEEDBACK_KEY][:satisfied] = params[:satisfied]
  session[FEEDBACK_KEY][:would_recommend] = params[:would_recommend]

  feedback_ref = save_feedback(session[FEEDBACK_KEY])

  erb :finished, :locals => { :feedback_ref => feedback_ref }
end

def save_feedback(feedback_hash)
  Feedback.newFromHash(feedback_hash)
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


def incident_options
  [
    {:name => "Wrong medicine was given", :value => "wrong_medicine"},
    {:name => "Medicine was not given at all", :value => "no_medicine"},
    {:name => "Too much or too little medicine was given", :value => "too_much_medicine"},
    {:name => "Medicine was given at the wrong time<", :value => "wrong_time_medicine"},
    {:name => "Medicine was given but patient had an allergy to this", :value => "allergy_not_noted"},
    {:name => "No-one explained why the medicine was given", :value => "no_reason_medicine"},
    {:name => "Plan for medicine at home was not clear", :value => "bad_communication"}
  ]
end

def incident_type
  [
    {:description => "Drug errors", :value => "drug-error"},
    {:description => "Miscommunication", :value => "miscommunication"}
  ]
end
