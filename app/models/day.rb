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

  def worked_hours(times)
    if times.present? && times.length > 1
      hours, minutes = worked_hours_and_minutes times
      "#{format('%02d', hours.to_i)}h#{format('%02d', minutes.to_i)}m"
    else
      '00h00m'
    end
  end

  private

  def worked_hours_and_minutes(times)
    time_diff = (times.last - times.first).to_i

    [hours_from(time_diff), minutes_from(time_diff)]
  end

  def hours_from(time)
    time / 3600
  end

  def minutes_from(time)
    (time % 3600) / 60
  end
end
