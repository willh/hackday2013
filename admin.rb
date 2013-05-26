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
dummy_issues.each do |o|
    if o[:id] == params[:incident]
      params[:incident] = o
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
    :name => params[:location],
    :value => 23,
    :children => [
      { :name => 'Facilities', :value => 9 },
      { :name => 'Miscommunication', :value => 6 },
      { :name => 'Drug Error', :value => 3 }
    ]
  }.to_json
end