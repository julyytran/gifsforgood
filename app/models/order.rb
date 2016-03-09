class Order < ActiveRecord::Base
  validates :status, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :order_gifs
  has_many :gifs, through: :order_gifs

  enum status: %w(ordered paid completed cancelled)

  def order_status
    if completed?
      "Order Complete on #{updated_at}"
    elsif cancelled?
      "Order cancelled on #{updated_at}"
    else
      "In progress"
    end
  end

  def self.status_breakdown
    grouped = group(:status).order("count_status desc").count(:status)
    changed = grouped.map do | k, v |
      [statuses.key(k), v]
    end.to_h
  end
end
