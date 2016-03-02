module CartHelper
  def get_total_price(gifs)
    gifs.inject(0) do |memo, array|
      memo + (array.first.price * array.last)
    end
  end

  def format_price(num)
    "$#{num / 100}"
  end
end
