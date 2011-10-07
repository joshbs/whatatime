module TimeEntriesHelper

  def formatted_duration (entry, length)
    arr = []
    entry.duration.each do |key, value|
      arr << "#{value} #{key}" if value > 0
    end
    arr[0..(length-1)].join(":")
  end
end
