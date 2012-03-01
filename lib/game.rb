class Game

  attr_reader :inventory

  def initialize(options)
    @options = options
    @inventory = []
  end

  def rooms
    @options[:rooms]
  end

  def look
    rooms.first.look
  end

  def pick_up(what)
    inventory << rooms.first.pick_up(what)
  end

end
