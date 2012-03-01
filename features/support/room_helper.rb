module RoomHelper
  include Spinach::DSL

  Given "I'm in a room with a rubber chicken" do
    @room = Room.new(items: [:rubber_chicken])
    @game = Game.new(rooms: [@room])
  end

end
