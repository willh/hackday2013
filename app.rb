
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