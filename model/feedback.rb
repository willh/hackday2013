class Feedback
    include DataMapper::Resource

    property id,                    Serial
    property location,              String
    property date,                  String
    property time_of_day,           String
    property incident_type,         String
    property incident_points,       StringArray
    property incident_comments,     String
    property general_good_points,   StringArray
    property general_bad_points,    StringArray
    property general_comments,      String
    property summary_severity,      String
    property summary_safety,        String
    property summary_priority,      String
    property apologised,            String
    property satisfied,             String
    property would_recommend,       String
end