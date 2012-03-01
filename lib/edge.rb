class Edge

  attr_reader :options

  def initialize(options)
    @options = options
  end

  def self.destination(options)
    edge = options[:from].edges.find { |edge| edge.matches?(options) }
    fail DestinationUnknown unless edge
    edge.to
  end

  def to
    @options[:to]
  end

  def direction
    @options[:direction]
  end

  def via
    @options[:via]
  end

  def matches?(options)
    options[:direction] == direction && options[:via] == via
  end

  def ==(other)
    other.options == options
  end

  def self.create(options)
    edge = new(options)
    options[:from].create_edge(edge)
    edge
  end

  class DestinationUnknown < RuntimeError
  end

end
