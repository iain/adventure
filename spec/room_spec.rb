require 'room'

describe Room do

  describe "#look" do

    it "sees items" do
      item = stub
      subject = Room.new(items: [item])
      subject.look.should == [item]
    end

    it "sees edges leading away from here" do
      edge = stub
      subject = Room.new(edges: [edge])
      subject.look.should == [edge]
    end

  end

  describe "#pick_up" do

    it "removes the item from the room" do
      item = stub
      subject = Room.new(items: [item])
      subject.pick_up item
      subject.look.should == []
    end

    it "fails when the item isn't here" do
      subject = Room.new
      expect { subject.pick_up :bike }.to raise_error(Room::ItemNotFound)
    end

  end

  describe "#create_edge" do

    it "adds an edge" do
      edge = stub
      subject.create_edge(edge)
      subject.edges.should == [edge]
    end

  end

end
