class Clock < ApplicationRecord
  belongs_to :user

  # Returns the clocked in times from the current user starting at `time`, grouped by days
  def self.by_days_from(user, time)
    where(user:, time: time..)
      .pluck(:time)
      .group_by(&:to_date)
      .transform_keys(&:to_s)
      .transform_keys { |key| Date.parse(key).day.to_i }
  end
end
