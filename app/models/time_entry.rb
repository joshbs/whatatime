class TimeEntry < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  def timer_running?
    !self.started_at.nil? && !self.timer_complete?
  end

  def timer_complete?
    !self.stopped_at.nil?
  end
  
  def to_relative_time
    if self.timer_running?
      "started #{distance_of_time_in_words_to_now(self.started_at, true)} ago"
    elsif self.timer_complete?
      "stopped #{distance_of_time_in_words_to_now(self.stopped_at, true)} ago"
    end
  end
end
