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
            :severity => "green", 
            :safety => "green", 
            :happened_before => "no",
            :told_us => "yes",
            :how_important_safety => "amber",
            :apologised => "yes", 
            :satisfied => "yes", 
            :would_recommend => "yes"
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
            :severity => "green", 
            :safety => "green", 
            :happened_before => "yes",
            :told_us => "no",
            :how_important_safety => "green",
            :apologised => "yes", 
            :satisfied => "yes", 
            :would_recommend => "no"
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
            :severity => "red", 
            :safety => "amber", 
            :happened_before => "no",
            :told_us => "yes",
            :how_important_safety => "red",
            :apologised => "yes", 
            :satisfied => "yes", 
            :would_recommend => "no"
        )

        sampledata << Feedback.create(
            :location => "Ward 10", 
            :date => "2013-05-20 10:10:10", 
            :time_of_day => "Evening", 
            :type => "miscommunication", 
            :incident_points => ["bad_communication"], 
            :incident_comments => "nobody explained to me why they were performing the tests", 
            :good_points => ["friendly", "clean"], 
            :bad_points => [], 
            :general_comments => "Long waiting times", 
            :severity => "green", 
            :safety => "amber", 
            :happened_before => "no",
            :told_us => "no",
            :how_important_safety => "green",
            :apologised => "no", 
            :satisfied => "no", 
            :would_recommend => "no"
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
            :severity => "amber", 
            :safety => "amber", 
            :happened_before => "no",
            :told_us => "yes",
            :how_important_safety => "red",
            :apologised => "yes", 
            :satisfied => "yes", 
            :would_recommend => "yes"
        )

        sampledata << Feedback.create(
            :location => "Ward 22", 
            :date => "2013-05-25 11:30:40", 
            :time_of_day => "Night", 
            :type => "drug-error", 
            :incident_points => ["too_much_medicine"], 
            :incident_comments => "I was given pain killers twice but I don't think I need them any more", 
            :good_points => ["helpful", "friendly"], 
            :bad_points => ["poor_food_quality"], 
            :general_comments => "Nurses friendly and gave me information on all the procedures", 
            :severity => "green", 
            :safety => "amber", 
            :happened_before => "no",
            :told_us => "yes",
            :how_important_safety => "red",
            :apologised => "yes", 
            :satisfied => "yes", 
            :would_recommend => "yes"
        )

        sampledata << Feedback.create(
            :location => "Ward 20", 
            :date => "2013-05-15 11:30:40", 
            :time_of_day => "Night", 
            :type => "drug-error", 
            :incident_points => ["allergy_not_noted"], 
            :incident_comments => "My daughter was given pennicillin but she is allergic to pennicillin. She was not given an allergy band upon entry.", 
            :good_points => ["helpful", "friendly"], 
            :bad_points => [], 
            :general_comments => "We were given a general information leaflet but not asked about allergies", 
            :severity => "red", 
            :safety => "amber", 
            :happened_before => "no",
            :told_us => "yes",
            :how_important_safety => "amber",
            :apologised => "yes", 
            :satisfied => "yes", 
            :would_recommend => "yes"
        )

        sampledata.each do |sample|
            sample.errors.each do |e|
               puts "save failed! "
               puts e
            end
        end

    end

end