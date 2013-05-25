class CreateFeedback < ActiveRecord::Migration
  def self.up
    create_table :feedback do |t|
        t.string            :location
        t.datetime          :date
        t.string            :time_of_day
        t.string            :incident_type
        t.string      :incident_points      #TODO: Fix string_array type
        t.string            :incident_comments
        t.string      :general_good_points      #TODO: Fix string_array type
        t.string      :general_bad_points      #TODO: Fix string_array type
        t.string            :general_comments
        t.string            :summary_severity
        t.string            :summary_safety
        t.string            :summary_priority
        t.string            :apologised
        t.string            :satisfied
        t.string            :would_recommend
    end
  end

  def self.down
    drop_table :feedback
  end
end
