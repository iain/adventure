class Game

  def initialize(options)
    @options = options
  end

  def rooms
    @options[:rooms]
  end

  def look
    rooms.first.look
  end

end
