require 'game'

describe Game do

  let(:room) { stub }
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

end
