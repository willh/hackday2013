require 'json'

get '/admin' do
  erb :"admin/index", :layout => :admin_layout
end

get '/admin/location/:location' do
  erb :"admin/location", :layout => :admin_layout
end

get '/admin/incident/:incident' do
  erb :"admin/incident", :layout => :admin_layout
end

get '/admin/api/incidents_by_location' do
  {
    :name => 'Total incidents by location',
    :value => 58,
    :children => [
      {
        :name => 'Ward 10',
        :value => 13,
        :url => '/admin/api/incidents_by_location/ward_10'
      },
      {
        :name => 'Reception',
        :value => 23,
        :url => '/admin/api/incidents_by_location/reception'
      },
      {
        :name => 'Ward 6S',
        :value => 18,
        :url => '/admin/api/incidents_by_location/ward_6s'
      },
      {
        :name => 'Ward 21',
        :value => 4,
        :url => '/admin/api/incidents_by_location/ward_21'
      },
    ]
  }.to_json
end

get '/admin/api/incidents_by_location/:location' do
  {
    :name => params[:location],
    :value => 23,
    :children => [
      { :name => 'Facilities', :value => 9 },
      { :name => 'Miscommunication', :value => 6 },
      { :name => 'Drug Error', :value => 3 }
    ]
  }.to_json
end