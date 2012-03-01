require 'room'

describe Room do

  let(:item) { stub }
  subject { Room.new(items: [item]) }

  specify "looking around" do
    subject.look.should == [item]
  end

  describe "#pick_up" do

    it "removes the item from the room" do
      subject.pick_up item
      subject.look.should == []
    end

    it "fails when the item isn't here" do
      expect { subject.pick_up :bike }.to raise_error(Room::ItemNotFound)
    end

  end

end
