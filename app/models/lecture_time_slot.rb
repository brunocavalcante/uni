class LectureTimeSlot < ActiveRecord::Base
  belongs_to :lecture
  
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  
  def start_time_string
    time_to_string(start_time)
  end
  
  def end_time_string
    time_to_string(end_time)
  end
  
  def time_to_string(time)
    time = "%04d" % time.to_s
    "#{time[0..1]}:#{time[2..-1]}"
  end
end
