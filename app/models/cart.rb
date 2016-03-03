class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_gif(gif_id)
    contents[gif_id.to_s] ||= 0
    contents[gif_id.to_s] += 1
  end

  def count
    contents.values.sum
  end

  def count_of(gif_id)
    contents[gif_id.to_s]
  end

  def gifs
    @ids = contents.keys
    gifs = @ids.map do |id|
      Gif.find(id.to_i)
    end
  end

  def gif_quantity(gif)
    @contents.map do |id, quantity|
      [Gif.find(gif.id).title, quantity]
    end.to_h
  end
end
