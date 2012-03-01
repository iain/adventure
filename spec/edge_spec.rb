require 'edge'

describe Edge do

  describe ".destination" do

    def self.stub(name)
      let(name) { stub name }
    end

    stub(:from)
    stub(:destination)

    def find(edge)
      Edge.destination(edges: [edge],
                       from:       from,
                       direction:  :north,
                       via:        :window)
    end

    it "finds the destination" do
      edge = Edge.new(direction: :north, from: from, to: destination, via: :window)
      find(edge).should == destination
    end

    context "won't find the destination" do

      specify "if direction is wrong" do
        edge = Edge.new(from: from, to: destination, direction: :east, via: :window)
        expect { find(edge) }.to raise_error(Edge::DestinationUnknown)
      end

      specify "if the via is wrong" do
        edge = Edge.new(direction: :north, from: from, to: destination, via: :ladder)
        expect { find(edge) }.to raise_error(Edge::DestinationUnknown)
      end

      specify "if you're not in the right room" do
        other = stub "other"
        edge = Edge.new(direction: :north, from: other, to: destination, via: :window)
        expect { find(edge) }.to raise_error(Edge::DestinationUnknown)
      end

    end

  end

end
