get '/admin' do
  erb :"admin/index"
end

get '/admin/location/:location' do
  erb :"admin/location"
end

get '/admin/incident/:incident' do
  erb :"admin/incident"
end