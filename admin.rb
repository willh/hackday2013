require 'json'

get '/admin' do
incidents = get_all_feedback
puts "incidents: #{incidents.count}"
  erb :"admin/index", :layout => :admin_layout, :locals => { :incidents => incidents }
end

get '/admin/location/:location' do
  erb :"admin/location", :layout => :admin_layout
end

get '/admin/incident/:incident' do
incidents = get_all_feedback
incidents.each do |o|
     if o[:id].to_s == params[:incident].to_s
      params[:incidentReported] = o
    end
   end
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
        :url => '/admin/location/ward_10'
      },
      {
        :name => 'Reception',
        :value => 23,
        :url => '/admin/location/reception'
      },
      {
        :name => 'Ward 6S',
        :value => 18,
        :url => '/admin/location/ward_6s'
      },
      {
        :name => 'Ward 21',
        :value => 4,
        :url => '/admin/location/ward_21'
      },
    ]
  }.to_json
end

get '/admin/api/incidents_by_location/:location' do
  {
    :name => 'Ward 21',
    :value => 23,
    :children => [
      { :name => 'Facilities', :value => 9 },
      { :name => 'Miscommunication', :value => 6 },
      { :name => 'Drug Error', :value => 3 }
    ]
  }.to_json
end

get '/admin/api/incidents_over_time' do
  [
    { :date => '01-01-2013', :value => 10 },
    { :date => '01-02-2013', :value => 11 },
    { :date => '01-03-2013', :value => 14 },
    { :date => '01-04-2013', :value => 8 },
    { :date => '01-05-2013', :value => 23 },
    { :date => '01-06-2013', :value => 5 }
  ].to_json
end