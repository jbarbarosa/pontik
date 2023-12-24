class Clock < ApplicationRecord
  belongs_to :user

  scope :from_user_since, ->(user, time) { where(user:, time: time..) }

  def self.group_time_by_days
    pluck(:time)
      .group_by(&:to_date)
      .transform_keys(&:to_s)
      .transform_keys { |key| Date.parse(key).day.to_i }
  end
end
