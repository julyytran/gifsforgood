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

  def edit_gif(gif)

  end
end
