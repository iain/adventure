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
    current_room.look
  end

  def pick_up(what)
    inventory << current_room.pick_up(what)
  end

  def current_room
    rooms.first
  end

end
