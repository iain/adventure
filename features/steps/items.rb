class ItemsSteps < Spinach::FeatureSteps
  feature 'Items'

  include RoomHelper

  When 'I pick up the rubber chicken' do
    @game.pick_up :rubber_chicken
  end

  Then 'I should have the rubber chicken in my inventory' do
    @game.inventory.should include :rubber_chicken
  end

end
