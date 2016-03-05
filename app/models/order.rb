class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_gifs
  has_many :gifs, through: :order_gifs

  def complete?
    if status == "completed"
      "Order Complete on #{updated_at}"
    elsif status == "cancelled"
      "Order cancelled on #{updated_at}"
    else
      "In progress"
    end
  end
end
