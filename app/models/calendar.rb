# frozen_string_literal: true

class Calendar
  def initialize(year, month)
    @year = year
    @month = month
  end

  def days(&block)
    days_of_the_month.each(&block)
  end

  private

  def days_of_the_month
    start_date = Date.new(@year, @month, 1)
    end_date = start_date.end_of_month
    (start_date..end_date).map { |date| Day.new(date) }
  end
end
