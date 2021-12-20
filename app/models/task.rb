class Task < ApplicationRecord
  belongs_to :users, optional: true

  validates :title, presence: true

  # 7日間のタスクの完了数
  scope :complete_today, -> { where(complete: true, updated_at: Time.zone.now.all_day) }
  scope :complete_yesterday, -> { where(complete: true, updated_at: 1.day.ago.all_day) }
  scope :complete_2day_ago, -> { where(complete: true, updated_at: 2.day.ago.all_day) }
  scope :complete_3day_ago, -> { where(complete: true, updated_at: 3.day.ago.all_day) }
  scope :complete_4day_ago, -> { where(complete: true, updated_at: 4.day.ago.all_day) }
  scope :complete_5day_ago, -> { where(complete: true, updated_at: 5.day.ago.all_day) }
  scope :complete_6day_ago, -> { where(complete: true, updated_at: 6.day.ago.all_day) }
end
