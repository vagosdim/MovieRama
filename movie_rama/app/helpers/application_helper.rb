module ApplicationHelper
    def custom_time_ago_in_words(time)
        diff_in_days = (Time.zone.now - time) / 1.day
        if diff_in_days.round == 1
          '1 day ago'
        elsif diff_in_days.round > 1
          "#{diff_in_days.round} days ago"
        else
          # Removes (the first) occurence from 'about' in the word
          
          "#{time_ago_in_words(time)} ago";
        end
    end
end
