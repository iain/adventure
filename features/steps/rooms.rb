class Rooms < Spinach::FeatureSteps
  feature 'Rooms'

  When 'I start a game with 2 rooms' do
    @room1 = Room.new
    @room2 = Room.new
    @game = Game.new(rooms: [@room1, @room2])
  end

  Then 'I should begin in the first room' do
    @game.current_room.should == @room1
  end

  Given 'there is door between the living room and a dining room' do
    @living = Room.new
    @dining = Room.new
    @edge = Edge.new(from: @living, to: @dining, via: :door, direction: :south)
    @game = Game.new(rooms: [ @living, @dining ], edges: [ @edge ])
  end

  When 'I walk to the dining room' do
    @game.walk_to(:south, via: :door)
  end

  Then 'I should be in the dining room' do
    @game.current_room.should == @dining
  end

end
