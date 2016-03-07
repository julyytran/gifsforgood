class OrdersGrid

  include Datagrid

  scope do
    Order
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)
  filter(:status, :string)

  column(:id)
  column(:created_at) do |model|
    model.created_at.to_date
  end
  column(:status)
  column(:total_price)
end
