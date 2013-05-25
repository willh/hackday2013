class feedback

    attr_accessor :location, :date, :time_of_day, :incident_type, :incident_points,
     :incident_comments, :general_good_points, :general_bad_points, :general_comments,
     :summary_severity, :summary_safety, :summary_priority, :apologised, :satisfied, :would_recommend

    def initialize(location, date, time_of_day, incident_type, incident_points,
     incident_comments, general_good_points, general_bad_points, general_comments,
     summary_severity, summary_safety, summary_priority, apologised, satisfied, would_recommend)

        @location = location
        @date = date
        @time_of_day = time_of_day
        @incident_type = incident_type
        @incident_points = incident_points
        @incident_comments = incident_comments
        @general_good_points = general_good_points
        @general_bad_points = general_bad_points
        @general_comments = general_comments
        @summary_severity = summary_severity
        @summary_safety = summary_safety
        @summary_priority = summary_priority
        @apologised = apologised
        @satisfied = satisfied
        @would_recommend = would_recommend

    end

end