class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_gifs
  has_many :gifs, through: :order_gifs

  def order_status
    if status.upcase == "completed".upcase
      "Order Complete on #{updated_at}"
    elsif status.upcase == "cancelled".upcase
      "Order cancelled on #{updated_at}"
    else
      "In progress"
    end
  end

  def self.status_breakdown
    group(:status).order("count_status desc").count(:status)
  end
end
