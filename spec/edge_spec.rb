require 'edge'

describe Edge do

  let(:destination) { stub "Destination" }
  let(:from) { stub "From", create_edge: true }

  describe ".destination" do

    def find(edge)
      from.stub(:edges) { [ edge ] }
      Edge.destination(from:       from,
                       direction:  :north,
                       via:        :window)
    end

    it "finds the destination" do
      edge = Edge.create(direction: :north, from: from, to: destination, via: :window)
      find(edge).should == destination
    end

    context "won't find the destination" do

      specify "if direction is wrong" do
        edge = Edge.create(from: from, to: destination, direction: :east, via: :window)
        expect { find(edge) }.to raise_error(Edge::DestinationUnknown)
      end

      specify "if the via is wrong" do
        edge = Edge.create(direction: :north, from: from, to: destination, via: :ladder)
        expect { find(edge) }.to raise_error(Edge::DestinationUnknown)
      end

    end

  end

  describe ".create" do

    it "creates a new edge from one room to the other" do
      options = { from: from, to: destination, direction: :north, via: :elevator }
      from.should_receive(:create_edge).with(Edge.new(options))
      Edge.create(options)
    end

  end

end
