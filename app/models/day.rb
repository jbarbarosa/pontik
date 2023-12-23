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
end
