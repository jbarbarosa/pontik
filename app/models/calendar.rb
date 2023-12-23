# frozen_string_literal: true

class Calendar
  def initialize(date)
    @current_date = date
  end

  def days(&block)
    days_of_the_month.each(&block)
  end

  def full_date
    "#{current_day_of_the_week} #{current_day_of_the_month}, #{current_month_and_year}"
  end

  def current_month_and_year
    "#{Date::MONTHNAMES[@current_date.month]} #{@current_date.year}"
  end

  def current_day_of_the_week
    @current_date.strftime('%A')
  end

  def current_day_of_the_month
    @current_date.day
  end

  private

  def days_of_the_month
    start_date = @current_date.beginning_of_month
    end_date = start_date.end_of_month
    (start_date..end_date).map { |date| Day.new(date) }
  end
end
