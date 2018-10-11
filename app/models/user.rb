class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :events
  has_many :joins
  has_many :join_events, through: :joins, source: :event
  
  def join(event)
    self.joins.find_or_create_by(event_id: event.id)
  end

  def unjoin(event)
    join = self.joins.find_by(event_id: event.id)
    join.destroy if join
  end

  def join?(event)
    self.join_events.include?(event)
  end
end
