class TimeEntry < ActiveRecord::Base

  def timer_running?
    !self.started_at.nil? && !self.timer_complete?
  end

  def timer_complete?
    !self.stopped_at.nil?
  end

end
