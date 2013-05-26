require 'data_mapper'
require 'dm-pg-types'

class Feedback
    include DataMapper::Resource

    property :id,                    Serial
    property :location,              String
    property :date,                  DateTime
    property :time_of_day,           String
    property :type,                  String
    property :incident_points,       StringArray
    property :incident_comments,     String
    property :good_points,           StringArray
    property :bad_points,            StringArray
    property :general_comments,      String
    property :severity,              String
    property :safety,                String
    property :happened_before,       String
    property :told_us,               String
    property :how_important_safety,  String
    property :apologised,            String
    property :satisfied,             String
    property :would_recommend,       String

    def newFromHash(feedback_hash)

        Feedback.create(
            :id => feedback_hash[:id] || "",
            :location => feedback_hash[:location] || "",
            :date => feedback_hash[:date] || "2013-05-26 10:10:10",
            :time_of_day => feedback_hash[:time_of_day] || "",
            :type => feedback_hash[:type] || "",
            :incident_points => feedback_hash[:incident_points] || "",
            :incident_comments => feedback_hash[:incident_comments] || "",
            :good_points => feedback_hash[:good_points] || "",
            :bad_points => feedback_hash[:bad_points] || "",
            :general_comments => feedback_hash[:general_comments] || "",
            :severity => feedback_hash[:severity] || "",
            :safety => feedback_hash[:safety] || "",
            :happened_before => feedback_hash[:happened_before] || "",
            :told_us => feedback_hash[:told_us] || "",
            :how_important_safety => feedback_hash[:how_important_safety] || "",
            :apologised => feedback_hash[:apologised] || "",
            :satisfied => feedback_hash[:satisfied] || "",
            :would_recommend => feedback_hash[:would_recommend] || ""
        )

    end

end