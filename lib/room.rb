class Room

  def initialize(options)
    @options = options
  end

  def look
    @options[:items]
  end

end
