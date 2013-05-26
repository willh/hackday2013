require_relative '../model/feedback'

class SampleData

    def self.load

        sampledata = []

        sampledata << Feedback.create(
            :location => "Ward 3", 
            :date => "2013-05-26 10:10:10", 
            :time_of_day => "Morning", 
            :type => "miscommunication", 
            :incident_points => ["bad_communication", "no_reason_medicine"], 
            :incident_comments => "I'm not sure if the nurses treating me are talking", 
            :good_points => ["friendly", "helpful"], 
            :bad_points => ["unclean", "poor_food_quality"], 
            :general_comments => "The staff were very nice", 
            :severity => "Low", 
            :safety => "Low", 
            :happened_before => "No",
            :told_us => "Yes",
            :how_important_safety => "Medium",
            :apologised => "Yes", 
            :satisfied => "Yes", 
            :would_recommend => "Maybe"
        )

        sampledata << Feedback.create(
            :location => "Ward 3", 
            :date => "2013-05-22 10:10:10", 
            :time_of_day => "Morning", 
            :type => "drug-error", 
            :incident_points => ["wrong_medicine", "wrong_time_medicine"], 
            :incident_comments => "I was given the wrong antiboitic at a different time from when the first nurse said so", 
            :good_points => ["clean", "helpful"], 
            :bad_points => ["unfriendly"], 
            :general_comments => "The ward is very clean", 
            :severity => "Low", 
            :safety => "Low", 
            :happened_before => "Yes",
            :told_us => "No",
            :how_important_safety => "Low",
            :apologised => "Yes", 
            :satisfied => "Yes", 
            :would_recommend => "No"
        )

        sampledata << Feedback.create(
            :location => "Ward 10", 
            :date => "2013-05-20 10:10:10", 
            :time_of_day => "Evening", 
            :type => "drug-error", 
            :incident_points => ["no_medicine"], 
            :incident_comments => "", 
            :good_points => ["helpful", "good_food_quality"], 
            :bad_points => ["unclean"], 
            :general_comments => "The ward is not clean, there are overflowing rubbish bins at the doorway", 
            :severity => "Medium", 
            :safety => "Medium", 
            :happened_before => "No",
            :told_us => "Yes",
            :how_important_safety => "High",
            :apologised => "Yes", 
            :satisfied => "Yes", 
            :would_recommend => "No"
        )

        sampledata << Feedback.create(
            :location => "Ward 10", 
            :date => "2013-05-20 10:10:10", 
            :time_of_day => "Evening", 
            :type => "miscommunication", 
            :incident_points => ["bad_communication"], 
            :incident_comments => "Nobody explained to me why they were performing the tests", 
            :good_points => ["friendly", "clean"], 
            :bad_points => [], 
            :general_comments => "Long waiting times", 
            :severity => "Low", 
            :safety => "Medium", 
            :happened_before => "No",
            :told_us => "No",
            :how_important_safety => "Low",
            :apologised => "No", 
            :satisfied => "No", 
            :would_recommend => "No"
        )

        sampledata << Feedback.create(
            :location => "Ward 5", 
            :date => "2013-05-24 10:10:10", 
            :time_of_day => "Night", 
            :type => "drug-error", 
            :incident_points => ["wrong_time_medicine"], 
            :incident_comments => "Nurse woke me up at night to give medicine but the doctor said I had finished that medicine during the day and that there would be no more", 
            :good_points => ["helpful", "friendly"], 
            :bad_points => ["poor_food_quality"], 
            :general_comments => "Meals are not good quality, limited vegeterian options", 
            :severity => "Medium", 
            :safety => "Medium", 
            :happened_before => "No",
            :told_us => "Yes",
            :how_important_safety => "High",
            :apologised => "Yes", 
            :satisfied => "Yes", 
            :would_recommend => "Yes"
        )

        sampledata.each do |sample|
            sample.errors.each do |e|
               puts "save failed! "
               puts e
            end
        end

    end

end