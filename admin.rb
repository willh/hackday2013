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
    :name => '/',
    :value => 58,
    :children => [
      {
        :name => 'Ward 10',
        :value => 13,
        :children => [
          { :name => 'Facilities', :value => 2 },
          { :name => 'Miscommunication', :value => 6 },
          { :name => 'Drug Error', :value => 5 }
        ]
      },
      {
        :name => 'Reception',
        :value => 23,
        :children => [
          { :name => 'Facilities', :value => 2 },
          { :name => 'Miscommunication', :value => 21 }
        ]
      },
      {
        :name => 'Ward 6S',
        :value => 18,
        :children => [
          { :name => 'Facilities', :value => 9 },
          { :name => 'Miscommunication', :value => 6 },
          { :name => 'Drug Error', :value => 3 }
        ]
      },
      {
        :name => 'Ward 21',
        :value => 4,
        :children => [
          { :name => 'Facilities', :value => 1 },
          { :name => 'Miscommunication', :value => 2 },
          { :name => 'Drug Error', :value => 1 }
        ]
      },
    ]
  }.to_json
end