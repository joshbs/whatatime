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
      "started #{time_ago_in_words(self.started_at, true)} ago"
    elsif self.timer_complete?
      "stopped #{time_ago_in_words(self.stopped_at, true)} ago"
    end
  end
end
