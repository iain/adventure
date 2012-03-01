class Edge

  def initialize(options)
    @options = options
  end

  def self.destination(options)
    edge = options[:edges].find { |edge|
      edge.matches?(options)
    } || fail(DestinationUnknown)
    edge.to
  end

  def to
    @options[:to]
  end

  def matches?(options)
    options[:direction] == @options[:direction] &&
      options[:via] == @options[:via] &&
      options[:from] == @options[:from]

  end

  class DestinationUnknown < RuntimeError
  end

end
