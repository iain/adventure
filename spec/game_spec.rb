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

end
