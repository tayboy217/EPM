class Note < ApplicationRecord
  
  belongs_to :users,optional: true
    
    validates :word, presence: true
    validates :english, presence: true
    validates :japanese, presence: true

  # 日毎の投稿数スコープを作成取得する
  scope :created_today, -> {where(created_at: Time.zone.now.all_day)}
	scope :created_yesterday, -> {where(created_at: 1.day.ago.all_day)}
	scope :created_2day_ago, -> {where(created_at: 2.day.ago.all_day)}
	scope :created_3day_ago, -> {where(created_at: 3.day.ago.all_day)}
	scope :created_4day_ago, -> {where(created_at: 4.day.ago.all_day)}
	scope :created_5day_ago, -> {where(created_at: 5.day.ago.all_day)}
	scope :created_6day_ago, -> {where(created_at: 6.day.ago.all_day)}
end
