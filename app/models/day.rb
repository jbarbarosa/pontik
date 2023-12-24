# frozen_string_literal: true

class Day
  def initialize(date)
    @date = date
  end

  def of_the_week
    @date.strftime('%a')
  end

  def of_the_month
    @date.day
  end

  def to_identifier
    "#{of_the_week.downcase}-#{of_the_month}"
  end

  def worked_hours(user)
    times = Clock.where(user:, time: @date.beginning_of_day..@date.end_of_day).pluck(:time)
    if times.length > 1
      hours = (times[1] - times[0]) / 60 / 60
      minutes = (times[1] - times[0]) % 60
      "#{format('%02d', hours.to_i)}h#{format('%02d', minutes.to_i)}m"
    else
      '00h00m'
    end
  end
end
