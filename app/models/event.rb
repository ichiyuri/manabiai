class Event < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :joins, dependent: :destroy
  has_many :join_users, through: :joins, source: :user
end
