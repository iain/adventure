require 'game'

describe Game do

  let(:room) { stub "a room" }
  subject { Game.new(rooms: [room]) }

  it "can be started with rooms" do
    subject.should have(1).rooms
  end

  specify "looking around" do
    room.should_receive(:look)
    subject.look
  end

  describe "#pick_up" do

    it "picks up items from the room and puts it in the inventory" do
      room.should_receive(:pick_up) { |item| item }
      subject.pick_up :rubber_chicken
      subject.inventory.should == [:rubber_chicken]
    end

  end

  describe "#current_room" do

    it "is the first room" do
      subject.current_room.should == room
    end

  end

  describe "#walk_to" do

    class Edge
    end

    it "changes current room" do
      dining = stub "dining"
      edge = stub "edge"

      Edge.should_receive(:destination)
        .with(from:       subject.current_room,
              direction:  :north,
              via:        :window)
        .and_return(dining)

      subject = Game.new(
        rooms: [room, dining],
        edges: [edge])

      subject.walk_to(:north, via: :window)
      subject.current_room.should == dining
    end

  end

end
