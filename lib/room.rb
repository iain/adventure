class Room

  def initialize(options)
    @options = options
  end

  def look
    items
  end

  def pick_up(what)
    items.delete(what) { fail ItemNotFound }
  end

  private

  def items
    @options[:items]
  end

  class ItemNotFound < RuntimeError
  end

end
