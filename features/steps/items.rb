require 'room'
require 'game'

class ItemsSteps < Spinach::FeatureSteps
  feature 'Items'

  Given "I'm in a room with a rubber chicken" do
    @room = Room.new(items: [:rubber_chicken])
    @game = Game.new(rooms: [@room])
  end

  When 'I look around' do
    @output = @game.look
  end

  Then 'I should see the rubber chicken' do
    @output.should == [:rubber_chicken]
  end

  When 'I pick up the rubber chicken' do
    raise 'step not implemented'
  end

  Then 'I should have the rubber chicken in my inventory' do
    raise 'step not implemented'
  end

end
