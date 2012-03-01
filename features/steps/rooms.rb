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

end
