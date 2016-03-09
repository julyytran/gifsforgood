class OrdersGrid

  include Datagrid

  scope do
    Order
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)
  filter(:status, :enum, :select => ["Ordered", "Paid", "Cancelled", "Completed"].map {|r| [r.humanize, r]})

  column(:id) do |order|
    format(order.id) do |value|
      link_to value, admin_order_path(order)
    end
  end
  column(:created_at) do |model|
    model.created_at.to_date
  end
  column(:updated_at) do |model|
    model.updated_at.to_date
  end
  column(:status)
  column(:total_price)
  column(:cancel, :html => true) do |record|
    if record.ordered? || record.paid?
      link_to "Cancel", admin_order_path(record, status: 3), method: :patch
    end
  end
  column(:mark_as_paid, :html => true) do |record|
    if record.ordered?
      link_to "Mark As Paid", admin_order_path(record, status: 1), method: :patch
    end
  end
  column(:mark_as_completed, html: true) do |record|
    if record.paid?
      link_to "Mark As Completed", admin_order_path(record, status: 2), method: :patch
    end
  end
end
