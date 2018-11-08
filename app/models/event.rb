class Event < ApplicationRecord
  
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :item, presence: true, length: { maximum: 255 }
  validates :start, presence: true
  validates :finish, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validate :date_cannot_be_in_the_past, :finish_cannot_be_greater_than_start
  has_many :joins, dependent: :destroy
  has_many :join_users, through: :joins, source: :user
  
  def date_cannot_be_in_the_past
    if start < Date.today
      errors.add(:start, ": 過去の日付は使用できません")
    end
  end
  
  def finish_cannot_be_greater_than_start
    if start > finish
      errors.add(:finish, "開始時間が終了時間を上回ることはできません")
    end
  end
end
