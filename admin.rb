get '/admin' do
  erb :"admin/index", :layout => :admin_layout
end

get '/admin/location/:location' do
  erb :"admin/location", :layout => :admin_layout
end

get '/admin/incident/:incident' do
  erb :"admin/incident", :layout => :admin_layout
end