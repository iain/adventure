class Room

  def initialize(options = {})
    @options = options
  end

  def look
    items + edges
  end

  def pick_up(what)
    items.delete(what) { fail ItemNotFound }
  end

  def create_edge(edge)
    edges << edge
  end

  def edges
    @options[:edges] ||= []
  end

  private

  def items
    @options[:items] || []
  end

  class ItemNotFound < RuntimeError
  end

end
