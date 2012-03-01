require 'room'

describe Room do

  let(:item) { stub }
  subject { Room.new(items: [item]) }

  specify "looking around" do
    subject.look.should == [item]
  end

end
