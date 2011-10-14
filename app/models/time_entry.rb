class TimeEntry < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  has_paper_trail
  acts_as_api

  belongs_to :user

  has_many :paranormal_activities

  api_accessible :default do |template|
    template.add :name
    template.add :started_at
    template.add :stopped_at
    template.add :to_relative_time
    template.add :archived
  end

  def timer_running?
    !self.started_at.nil? && !self.timer_complete?
  end

  def timer_complete?
    !self.stopped_at.nil?
  end

  def duration
    time = self.stopped_at || Time.now - self.started_at rescue return
    begin
      years, time = time.divmod(29030400)
      months, time = time.divmod(2419200)
      weeks, time = time.divmod(604800)
      days, time = time.divmod(86400)
      hours, time = time.divmod(3600)
      minutes, time = time.divmod(60)
      seconds = time.to_i

      {
        years: years,
        months: months,
        weeks: weeks,
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds
      }
    rescue
    end
  end

  def to_relative_time
    if self.timer_running?
      "started #{time_ago_in_words(self.started_at, true)} ago"
    elsif self.timer_complete?
      "stopped #{time_ago_in_words(self.stopped_at, true)} ago"
    end
  end
end
