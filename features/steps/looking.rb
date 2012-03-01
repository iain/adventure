class Looking < Spinach::FeatureSteps
  feature 'Looking'

  include RoomHelper

  When 'I look around' do
    @output = @game.look
  end

  Then 'I should see the rubber chicken' do
    @output.should == [:rubber_chicken]
  end

  Given "I'm in a room with a way north" do
    @dining = Room.new(name: "Dining")
    @living = Room.new(name: "Living")
    @edge = Edge.create(from: @living, to: @dining, direction: :north, via: :whatever)
    @game = Game.new(rooms: [ @living, @dining ])
  end

  Then 'I should see the way out' do
    @output.should == [@edge]
  end

end
